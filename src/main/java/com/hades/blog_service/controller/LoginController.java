package com.hades.blog_service.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.hades.blog_service.entity.SysUser;
import com.hades.blog_service.entity.vo.LoginModel;
import com.hades.blog_service.service.impl.SysUserServiceImpl;
import com.hades.blog_service.utils.MD5;
import com.hades.blog_service.utils.R;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


/**
 * @Author HADES
 * @Create 2020/12/3 17:56
 * description  登录模块
 */

@RestController
@Api(tags = "登录模块")
@RequestMapping("/admin/login")
public class LoginController {

    @Autowired
    SysUserServiceImpl userService;

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
        wrapper.eq("pass_word", MD5.encrypt(loginModel.getPassWord()));
        SysUser user = userService.getOne(wrapper);
        if(user!=null){
            return R.ok().message("登录成功");
        }else {
            return R.error().message("账号或者密码错误");
        }
    }
}
