package com.hades.blog_service.controller;


import com.hades.blog_service.entity.SysUserGroup;
import com.hades.blog_service.entity.vo.GroupQurey;
import com.hades.blog_service.service.SysUserGroupService;
import com.hades.blog_service.service.impl.SysUserGroupServiceImpl;
import com.hades.blog_service.utils.R;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author hades
 * @since 2020-12-04
 */
@RestController
@CrossOrigin()
@Api(tags = "用户组管理")
@RequestMapping("/admin/usergroup")
public class SysUserGroupController {
    @Autowired
    SysUserGroupServiceImpl userGroupService;

    @ApiOperation(value = "查询用户组")
    @GetMapping()
    public R getGroup(){
        List<SysUserGroup> list = userGroupService.list();
        return R.ok().data(list);
    }

    @ApiOperation(value = "添加用户组")
    @PostMapping("/addGroup")
    public R addGroup(@RequestBody GroupQurey userGroup){
        return userGroupService.addGroup(userGroup);
    }

    @ApiOperation(value = "删除用户组")
    @GetMapping("/delGroup/{id}")
    public R delGroup(@ApiParam(name = "id", value = "用户组ID") @PathVariable(required = true) String id ){
        boolean flag = userGroupService.removeById(id);
        return R.booleanRespone(flag);
    }

    @ApiOperation(value = "修改用户组")
    @PostMapping("/updateGroup")
    public R updateGroup(@RequestBody GroupQurey userGroup){
        return  userGroupService.updateGroup(userGroup);
    }


    @ApiOperation(value = "查询管理员菜单")
    @GetMapping("/groupMenus/{id}")
    public R groupMens(@ApiParam(name = "id", value = "用户组ID") @PathVariable(required = true) String id ){
        return userGroupService.getGroupMenus(id);
    }

}

