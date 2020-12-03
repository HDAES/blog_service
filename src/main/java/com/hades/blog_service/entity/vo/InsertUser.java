package com.hades.blog_service.entity.vo;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;


/**
 * @Author HADES
 * @Create 2020/12/3 16:28
 * description
 */
@Data
public class InsertUser {
    @ApiModelProperty(value = "用户名")
    private String name;

    @ApiModelProperty(value = "用户密码")
    private String passWord;

    @ApiModelProperty(value = "用户类型：0(default): 超级管理员 1：管理员  5：游客")
    private Integer type;

    @ApiModelProperty(value = "用户状态： 0：激活  1：未激活")
    private Integer status;

}