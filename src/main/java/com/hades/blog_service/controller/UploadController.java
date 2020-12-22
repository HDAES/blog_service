package com.hades.blog_service.controller;

import com.hades.blog_service.utils.R;
import com.hades.blog_service.utils.UploadFileOss;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

@RestController
@CrossOrigin
@Api(tags = "上传文件")
@RequestMapping("/upload")
public class UploadController {



    @ApiOperation(value = "oss上传文件")
    @PostMapping("oss")
    public R uploadOss(MultipartFile file){
        String url = UploadFileOss.uploadFileAvatar(file);
        return R.ok().data("url",url);
    }

}
