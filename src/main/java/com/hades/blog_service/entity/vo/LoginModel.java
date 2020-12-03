package com.hades.blog_service.entity.vo;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * @Author HADES
 * @Create 2020/12/3 18:00
 * description
 */
@Data
public class LoginModel {

    @ApiModelProperty(value = "用户名")
    private String account;

    @ApiModelProperty(value = "用户密码")
    private String passWord;
}
