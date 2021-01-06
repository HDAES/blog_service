package com.hades.blog_service.controller;


import com.hades.blog_service.entity.SysBlogSort;
import com.hades.blog_service.entity.SysBlogTags;
import com.hades.blog_service.service.impl.SysBlogTagsServiceImpl;
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
 * @since 2021-01-05
 */
@RestController
@Api(tags = "博客标签管理")
@CrossOrigin()
@RequestMapping("/admin/blog")
public class SysBlogTagsController {
    @Autowired
    SysBlogTagsServiceImpl blogTagsService;

    @ApiOperation(value = "获取所有分类")
    @GetMapping("tags")
    public R sort(){
        return blogTagsService.selectTagsList();
    }

    @ApiOperation(value = "添加标签")
    @PostMapping("/tags/add")
    public R addTags(@RequestBody SysBlogTags tags){
        return blogTagsService.addTags(tags);
    }

    @ApiOperation(value = "修改标签")
    @PostMapping("/tags/update")
    public R updateTags(@RequestBody SysBlogTags tags){
        return blogTagsService.updateTags(tags);
    }

    @ApiOperation(value = "删除标签")
    @GetMapping("/tags/del/{id}")
    public R delTags(@ApiParam(name = "id", value = "菜单ID") @PathVariable Long id ){
        if(id==null){
            return R.error().message("ID不能为空");
        }
        boolean flag = blogTagsService.removeById(id);
        return  R.booleanRespone(flag);
    }

}

