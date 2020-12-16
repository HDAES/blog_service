package com.hades.blog_service.config;

import com.baomidou.mybatisplus.extension.plugins.PaginationInterceptor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * @Author HADES
 * @Create 2020/12/3 14:16
 * description MyBatis-plus 配置文件
 */
@Configuration
public class MyBatisConfig {
    @Bean
    public PaginationInterceptor paginationInterceptor() {
        return new PaginationInterceptor();
    }

}
