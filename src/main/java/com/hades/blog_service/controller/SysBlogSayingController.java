package com.hades.blog_service.controller;


import com.hades.blog_service.entity.SysBlogSaying;
import com.hades.blog_service.service.impl.SysBlogSayingServiceImpl;
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
 * @since 2021-01-25
 */
@RestController
@Api(tags = "博客名言")
@CrossOrigin()
@RequestMapping("/admin/blog")
public class SysBlogSayingController {
    @Autowired
    SysBlogSayingServiceImpl blogSayingService;

    @ApiOperation(value = "获取名言列表")
    @GetMapping("/saying")
    public R saying(){
        List<SysBlogSaying> list = blogSayingService.list();
        return R.ok().data(list);
    }

    @ApiOperation(value = "添加名言")
    @PostMapping("/saying")
    public R addSaying(@RequestBody SysBlogSaying saying){
        boolean save = blogSayingService.save(saying);
        return R.booleanRespone(save);
    }

    @ApiOperation(value = "删除名言")
    @DeleteMapping("/saying/{id}")
    public R delSaying(@ApiParam(name = "id", value = "名言ID") @PathVariable Long id){
        if(id==null){
            return R.error().message("ID不能为空");
        }else {
            boolean b = blogSayingService.removeById(id);
            return R.booleanRespone(b);
        }
    }

    @ApiOperation(value = "修改名言")
    @PutMapping("/saying")
    public R updateSaying(@RequestBody SysBlogSaying saying){
        if(saying.getId()==null){
            return R.error().message("ID不能为空");
        }else {
            boolean b = blogSayingService.updateById(saying);
            return R.booleanRespone(b);
        }
    }
}

