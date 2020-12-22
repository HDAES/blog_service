package com.hades.blog_service.controller;


import com.hades.blog_service.service.OssService;
import com.hades.blog_service.utils.R;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

@RestController
@CrossOrigin
@Api(tags = "上传文件")
@RequestMapping("/upload")
public class uploadController {

    @Autowired
    private OssService ossService;

    @PostMapping("oss")
    public R uploadOss(MultipartFile file){
        String url = ossService.uploadFileAvatar(file);
        return R.ok().data("url",url);
    }

}
