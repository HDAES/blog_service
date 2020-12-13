package com.hades.blog_service.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

/**
 * @Author HADES
 * @Create 2020/12/3 14:10
 * @description Swagger配置文件
 */
@Configuration
@EnableSwagger2
public class SwaggerConfig {
    //api接口包扫描路径
    public static final String SWAGGER_SCAN_BASE_PACKAGE = "com.hades.blog_service.controller";

    public static final String VERSION = "1.0.0";

    @Bean
    public Docket webApiConfig(){
        return new Docket(DocumentationType.SWAGGER_2)
//                .host("sb.xl686.com")
                .groupName("webApi")
                .apiInfo(webApiInfo())
                .select()
                .paths(PathSelectors.any())
                .apis(RequestHandlerSelectors.basePackage(SWAGGER_SCAN_BASE_PACKAGE))
                .build();
    }

    private ApiInfo webApiInfo(){
        return new ApiInfoBuilder()
                .title("网站-博客系统API")
                .description("本文档描述了微信小程序，网页，后台的api接口")
                .version(VERSION)
                .termsOfServiceUrl("http://sb.xl686.com/")
                .licenseUrl("http://sb.xl686.com/")
                .build();
    }
}
