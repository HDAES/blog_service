package com.hades.blog_service.controller;


import com.hades.blog_service.entity.SysBlogContent;
import com.hades.blog_service.service.impl.SysBlogContentServiceImpl;
import com.hades.blog_service.utils.R;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author hades
 * @since 2021-01-24
 */
@RestController
@Api(tags = "博客内容")
@CrossOrigin()
@RequestMapping("/admin/blog")
public class SysBlogContentController {
    @Autowired
    SysBlogContentServiceImpl blogContentService;

    @ApiOperation(value = "获取博客详情")
    @GetMapping("/content/{id}")
    public R content(@ApiParam(name = "id", value = "详情ID") @PathVariable Long id ){
        if(id==null){
            return R.error().message("ID不能为空");
        }else{
            SysBlogContent byId = blogContentService.getById(id);
            if(byId==null){
                return R.error().message("文章ID错误");
            }else {
                return R.ok().data("data",byId);
            }
        }
    }
    @ApiOperation(value = "添加博客内容")
    @PostMapping("/content")
    public R addContent(@RequestBody SysBlogContent content){
        boolean save = blogContentService.save(content);
        return R.booleanRespone(save);
    }
}

