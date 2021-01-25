package com.hades.blog_service.controller;


import com.hades.blog_service.entity.SysBlogSort;
import com.hades.blog_service.service.impl.SysBlogSortServiceImpl;
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
 * @since 2021-01-04
 */
@RestController
@Api(tags = "博客分类")
@CrossOrigin()
@RequestMapping("/admin/blog")
public class SysBlogSortController {
    @Autowired
    SysBlogSortServiceImpl sysBlogSortService;

    @ApiOperation(value = "获取所有分类")
    @GetMapping("sort")
    public R sort(){
        List<SysBlogSort> list = sysBlogSortService.list();
        return R.ok().data(list);
    }

    @ApiOperation(value = "添加分类")
    @PostMapping("/sort/add")
    public R addSort(@RequestBody SysBlogSort blogSort){
        return sysBlogSortService.addSort(blogSort);
    }

    @ApiOperation(value = "修改分类")
    @PostMapping("/sort/update")
    public R updateSort(@RequestBody SysBlogSort blogSort){
        return sysBlogSortService.updateSort(blogSort);
    }

    @ApiOperation(value = "删除分类")
    @GetMapping("/sort/del/{id}")
    public R delSort(@ApiParam(name = "id", value = "菜单ID") @PathVariable Long id ){
        if(id==null){
            return R.error().message("请输入ID");
        }else {
            boolean flag = sysBlogSortService.removeById(id);
            return R.booleanRespone(flag);
        }
    }
}

