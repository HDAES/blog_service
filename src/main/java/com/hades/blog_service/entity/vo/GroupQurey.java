package com.hades.blog_service.entity.vo;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.List;

/**
 * @Author HADES
 * @Create 2020/12/4 13:40
 * description
 */
@Data
public class GroupQurey {

    @ApiModelProperty(value = "用户组ID")
    private String id;

    @ApiModelProperty(value = "用户组名字")
    private String name;

    @ApiModelProperty(value = "用户组菜单")
    private List<String> menus;
}
