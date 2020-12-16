package com.hades.blog_service.service.impl;

import com.hades.blog_service.entity.SysUser;
import com.hades.blog_service.entity.vo.InsertUser;
import com.hades.blog_service.entity.vo.UpdateUserModel;
import com.hades.blog_service.mapper.SysUserMapper;
import com.hades.blog_service.service.SysUserService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hades.blog_service.utils.MD5;
import com.hades.blog_service.utils.R;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author hades
 * @since 2020-12-03
 */
@Service
public class SysUserServiceImpl extends ServiceImpl<SysUserMapper, SysUser> implements SysUserService {

    @Resource
    SysUserMapper userMapper;

    public R updateUser(UpdateUserModel user) {
        if(user.getId()==null){
            return R.error().message("请输入用户ID");
        }else {
            SysUser sUser = new SysUser();
            sUser.setId(user.getId());
            if(user.getPassWord() !=null){
                sUser.setPassWord(MD5.encrypt(user.getPassWord()));
            }
            sUser.setName(user.getName());
            sUser.setType(user.getType());
            sUser.setStatus(user.getStatus());
            int i = userMapper.updateById(sUser);
            return R.intRespone(i);
        }
    }

    @Override
    public R insertUser(InsertUser user) {
        SysUser sUser = new SysUser();
        if(user.getName()==null){
            return R.error().message("用户名不能为空");
        }
        if(user.getPassWord() == null){
            return R.error().message("用户密码不能为空");
        }
        sUser.setPassWord(MD5.encrypt(user.getPassWord()));
        sUser.setName(user.getName());
        sUser.setStatus(user.getStatus());
        sUser.setType(user.getType());
        int i = userMapper.insert(sUser);
        return R.intRespone(i);
    }

    @Override
    public void listJoinGroup() {
        System.out.println(userMapper.selectUserList());

    }
}
