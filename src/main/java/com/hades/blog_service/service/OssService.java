package com.hades.blog_service.service;

import org.springframework.web.multipart.MultipartFile;
public interface OssService {
    String uploadFileAvatar(MultipartFile file);
}