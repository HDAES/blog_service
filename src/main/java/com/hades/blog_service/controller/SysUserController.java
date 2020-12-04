package com.hades.blog_service.controller;

import com.hades.blog_service.entity.vo.InsertUser;
import com.hades.blog_service.entity.vo.UpdateUserModel;
import com.hades.blog_service.service.impl.SysUserServiceImpl;
import com.hades.blog_service.utils.R;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;


/**
 * @author hades
 * @since 2020-12-03
 * description 用户控制
 */
@RestController
@Api(tags = "用户管理")
@RequestMapping("/admin/user")
public class SysUserController {

    @Autowired
    SysUserServiceImpl userService;

    @ApiOperation(value = "查询用户数据")
    @GetMapping("/getUserList")
    public R getUserList(){
        return R.ok().data("list",userService.list());
    }


    @ApiOperation(value = "添加用户")
    @PostMapping("/addUser")
    public R addUser(@RequestBody InsertUser user){
        return userService.insertUser(user);
    }

    @ApiOperation(value = "删除用户")
    @GetMapping("/delectUser/{id}")
    public R delUser(@ApiParam(name = "id", value = "用户ID") @PathVariable(required = true) Long id ){
        return userService.removeById(id) ? R.ok() : R.error();
    }

    @ApiOperation(value = "修改用户")
    @PostMapping("updateUser")
    public R updateUser(@RequestBody UpdateUserModel user){
        return  userService.updateUser(user);
    }

}

