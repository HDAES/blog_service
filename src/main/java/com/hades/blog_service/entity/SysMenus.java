package com.hades.blog_service.entity;

import com.baomidou.mybatisplus.annotation.*;

import java.util.Date;

import java.io.Serializable;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 
 * </p>
 *
 * @author hades
 * @since 2020-12-03
 */
@Data
@EqualsAndHashCode(callSuper = false)
@ApiModel(value="SysMenus对象", description="")
public class SysMenus implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "菜单ID")
    @TableId(value = "id", type = IdType.ID_WORKER_STR)
    private String id;

    @ApiModelProperty(value = "父级ID")
    private String mId;

    @ApiModelProperty(value = "菜单名字")
    private String name;

    @ApiModelProperty(value = "菜单地址")
    private String url;

    @ApiModelProperty(value = "菜单Icon")
    private String icon;

    @ApiModelProperty(value = "菜单排序")
    private Integer sort;

    @ApiModelProperty(value = "菜单状态")
    private Integer status;

    @TableLogic
    @ApiModelProperty(value = "逻辑删除")
    private Integer deleted;

    @TableField(fill = FieldFill.INSERT)
    @ApiModelProperty(value = "创建时间")
    private Date createTime;

    @TableField(fill = FieldFill.INSERT_UPDATE)
    @ApiModelProperty(value = "修改时间")
    private Date updateTime;
}
