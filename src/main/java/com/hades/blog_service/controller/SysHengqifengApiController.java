package com.hades.blog_service.controller;


import com.hades.blog_service.entity.SysHengqifengApi;
import com.hades.blog_service.service.impl.SysHengqifengApiServiceImpl;
import com.hades.blog_service.utils.R;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author hades
 * @since 2021-02-02
 */
@RestController
@Api(tags = "测试内容")
@CrossOrigin()
@RequestMapping("/admin/test")
public class SysHengqifengApiController {

    @Autowired
    SysHengqifengApiServiceImpl hengqifengApiService;

    @ApiOperation(value = "接口列表")
    @GetMapping("/api")
    public R getApis(){
        List<SysHengqifengApi> list = hengqifengApiService.list();
        return R.ok().data(list);
    }
}

