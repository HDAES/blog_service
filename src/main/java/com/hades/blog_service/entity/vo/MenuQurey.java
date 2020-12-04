package com.hades.blog_service.entity.vo;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * @Author HADES
 * @Create 2020/12/4 10:26
 * description
 */
@Data
public class MenuQurey {

    @ApiModelProperty(value = "父级ID")
    private String id;

    @ApiModelProperty(value = "父级ID")
    private String mId;

    @ApiModelProperty(value = "菜单名字")
    private String name;

    @ApiModelProperty(value = "菜单地址")
    private String url;

    @ApiModelProperty(value = "菜单Icon")
    private String icon;

    @ApiModelProperty(value = "菜单状态")
    private Integer status;
}
