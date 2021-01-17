package com.hades.blog_service.controller;


import com.hades.blog_service.entity.SysBlogDetails;
import com.hades.blog_service.service.impl.SysBlogDetailsServiceImpl;
import com.hades.blog_service.utils.R;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author hades
 * @since 2021-01-06
 */
@RestController
@Api(tags = "博客详情")
@CrossOrigin()
@RequestMapping("/admin/blog")
public class SysBlogDetailsController {
    @Autowired
    SysBlogDetailsServiceImpl blogDetailsService;

    @ApiOperation(value = "获取博客详情")
    @GetMapping("/details")
    public R details(){
        return blogDetailsService.selectDetails();
    }

    @ApiOperation(value = "添加博客详情")
    @PostMapping("/details")
    public R addDetails(@RequestBody SysBlogDetails details){
        return blogDetailsService.addDetails(details);
    }

    @ApiOperation(value = "修改详情")
    @PutMapping("/details")
    public R updateDetails(@RequestBody SysBlogDetails details){
        return blogDetailsService.updateDetails(details);
    }

    @ApiOperation(value = "删除详情")
    @DeleteMapping("/details/{id}")
    public R delDetails(@ApiParam(name = "id", value = "详情ID") @PathVariable Long id ){
        if(id==null){
            return R.error().message("请输入ID");
        }
        boolean flag = blogDetailsService.removeById(id);
        return  R.booleanRespone(flag);
    }

}

