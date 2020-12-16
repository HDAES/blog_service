package com.hades.blog_service.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.hades.blog_service.entity.SysMenus;
import com.hades.blog_service.entity.SysUser;
import com.hades.blog_service.entity.vo.LoginModel;
import com.hades.blog_service.service.impl.SysMenusServiceImpl;
import com.hades.blog_service.service.impl.SysUserServiceImpl;
import com.hades.blog_service.utils.MD5;
import com.hades.blog_service.utils.R;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;


/**
 * @Author HADES
 * @Create 2020/12/3 17:56
 * description  登录模块
 */

@RestController
@Api(tags = "登录模块")
@CrossOrigin()
@RequestMapping("/admin/login")
public class LoginController {

    @Autowired
    SysUserServiceImpl userService;

    @Autowired
    SysMenusServiceImpl menusService;

    @ApiOperation(value = "登录")
    @PostMapping()
    public R login(@RequestBody LoginModel loginModel){
        if(loginModel.getAccount()==null){
            return R.ok().message("账号不能为空");
        }
        if(loginModel.getPassWord()==null){
            return R.ok().message("密码不能为空");
        }

        QueryWrapper<SysUser> wrapper = new QueryWrapper<>();
        wrapper.eq("name",loginModel.getAccount());
        wrapper.eq("pass_word", loginModel.getPassWord());
        SysUser user = userService.getOne(wrapper);
        if(user!=null){
            QueryWrapper<SysMenus> menusWrapper = new QueryWrapper<>();
            menusWrapper.select("id","m_id","name","url","icon","sort");
            menusWrapper.orderByAsc("sort");
            List<Map<String, Object>> maps = menusService.listMaps(menusWrapper);

            //获取用户组 
            return R.ok().message("登录成功").data("user",user).data("menus",maps);
        }else {
            return R.error().message("账号或者密码错误");
        }
    }
}
