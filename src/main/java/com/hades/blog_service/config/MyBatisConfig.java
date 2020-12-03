package com.hades.blog_service.config;

import com.baomidou.mybatisplus.extension.plugins.PaginationInterceptor;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * @Author HADES
 * @Create 2020/12/3 14:16
 * description MyBatis-plus 配置文件
 */
@Configuration
@MapperScan("com.hades.springboot.mapper")
public class MyBatisConfig {
    @Bean
    public PaginationInterceptor paginationInterceptor() {
        return new PaginationInterceptor();
    }
}
