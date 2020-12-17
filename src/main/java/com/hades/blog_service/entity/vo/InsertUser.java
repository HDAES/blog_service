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
    @ApiModelProperty(value = "昵称")
    private String name;

    @ApiModelProperty(value = "账号")
    private String account;

    @ApiModelProperty(value = "用户密码")
    private String passWord;

    @ApiModelProperty(value = "用户组")
    private String groupId;


}
