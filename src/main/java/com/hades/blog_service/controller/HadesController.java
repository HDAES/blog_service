package com.hades.blog_service.controller;

import com.hades.blog_service.entity.SysBlogDetails;
import com.hades.blog_service.entity.SysBlogSaying;
import com.hades.blog_service.entity.SysBlogSort;
import com.hades.blog_service.service.impl.SysBlogContentServiceImpl;
import com.hades.blog_service.service.impl.SysBlogDetailsServiceImpl;
import com.hades.blog_service.service.impl.SysBlogSayingServiceImpl;
import com.hades.blog_service.service.impl.SysBlogSortServiceImpl;
import com.hades.blog_service.utils.R;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Author HADES
 * @Create 2021/1/25 15:16
 * description
 */
@RestController
@Api(tags = "前端接口")
@CrossOrigin()
@RequestMapping("/hades")
public class HadesController {
    @Autowired
    SysBlogSortServiceImpl blogSortService;

    @Autowired
    SysBlogDetailsServiceImpl blogDetailsService;

    @Autowired
    SysBlogSayingServiceImpl blogSayingService;

    @ApiOperation(value = "获取分类")
    @GetMapping("/section")
    public R section(){
        List<SysBlogSort> list = blogSortService.list();
        return R.ok().data(list);
    }

    @ApiOperation(value = "获取分类内容")
    @GetMapping("/sectionData/{id}")
    public R sectionData(@ApiParam(name = "id", value = "详情ID") @PathVariable Long id ){
        List<SysBlogDetails>  detailsList = blogDetailsService.selectById(id);
        List<SysBlogSaying> list = blogSayingService.list();
        Map<String,Object> dataMap = new HashMap<>();
        dataMap.put("articleList",detailsList);
        dataMap.put("saying",list.get(0));
        return R.ok().data(dataMap);
    }
}
