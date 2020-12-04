package com.hades.blog_service.service.impl;

import com.hades.blog_service.entity.SysMenus;
import com.hades.blog_service.entity.SysUserGroup;
import com.hades.blog_service.entity.vo.GroupQurey;
import com.hades.blog_service.mapper.SysMenusMapper;
import com.hades.blog_service.mapper.SysUserGroupMapper;
import com.hades.blog_service.service.SysUserGroupService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hades.blog_service.utils.R;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Arrays;
import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author hades
 * @since 2020-12-04
 */
@Service
public class SysUserGroupServiceImpl extends ServiceImpl<SysUserGroupMapper, SysUserGroup> implements SysUserGroupService {

    @Resource
    SysUserGroupMapper userGroupMapper;

    @Resource
    SysMenusMapper menusMapper;

    @Override
    public R addGroup(GroupQurey userGroup) {
        SysUserGroup group = new SysUserGroup();
        group.setName(userGroup.getName());
        StringBuilder menus = new StringBuilder();
        for (int i =0;i<userGroup.getMenus().size();i++){
            menus.append(userGroup.getMenus().get(i)+',');
        }
        menus.deleteCharAt(menus.length()-1);
        group.setMenus(menus.toString());
        int insert = userGroupMapper.insert(group);
        return R.intRespone(insert);
    }

    public R updateGroup(GroupQurey userGroup) {
        if(userGroup.getId()==null){
            return R.error().message("用户组ID不能为空");
        }
        SysUserGroup group = new SysUserGroup();

        group.setId(userGroup.getId());

        StringBuffer menus = new StringBuffer();
        for (int i =0;i<userGroup.getMenus().size();i++){
            menus.append(userGroup.getMenus().get(i)+',');
        }
        menus.deleteCharAt(menus.length()-1);
        group.setMenus(menus.toString());

        group.setName(userGroup.getName());

        int i = userGroupMapper.updateById(group);
        return R.intRespone(i);
    }

    public R getGroupMenus(String id) {
        SysUserGroup group = userGroupMapper.selectById(id);
        if(group==null){
            return R.error().message("用户组不存在");
        }
        String[] menusArray = null;
        menusArray = group.getMenus().split(",");
        List<SysMenus> sysMenus = menusMapper.selectBatchIds(Arrays.asList(menusArray));
        return R.ok().data("list",sysMenus).data("name",group.getName()).data("id",group.getId());
    }
}
