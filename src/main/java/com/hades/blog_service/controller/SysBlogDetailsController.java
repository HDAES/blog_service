package com.hades.blog_service.controller;


import com.hades.blog_service.entity.SysBlogDetails;
import com.hades.blog_service.service.impl.SysBlogDetailsServiceImpl;
import com.hades.blog_service.utils.R;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
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

}

