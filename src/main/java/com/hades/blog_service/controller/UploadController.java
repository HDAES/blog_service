package com.hades.blog_service.controller;

import com.hades.blog_service.utils.R;
import com.hades.blog_service.utils.UploadFileOss;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

@RestController
@Api(tags = "上传文件")
@CrossOrigin()
@RequestMapping("/upload")
public class UploadController {
    @ApiOperation(value = "oss上传文件")
    @PostMapping("oss")
    public R uploadOss(MultipartFile file){
        String url = UploadFileOss.uploadFileAvatar(file);
        return R.ok().data(url);
    }

}
