package com.hades.blog_service.entity;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.IdType;
import java.util.Date;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
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
 * @since 2020-12-04
 */
@Data
@EqualsAndHashCode(callSuper = false)
@ApiModel(value="SysUserGroup对象", description="")
public class SysUserGroup implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "用户组ID")
    @TableId(value = "id", type = IdType.ID_WORKER_STR)
    private String id;

    @ApiModelProperty(value = "用户组名字")
    private String name;

    @ApiModelProperty(value = "用户组权限菜单")
    private String menus;

    @TableField(fill = FieldFill.INSERT)
    @ApiModelProperty(value = "创建时间")
    private Date createTime;

    @TableField(fill = FieldFill.INSERT_UPDATE)
    @ApiModelProperty(value = "更新时间")
    private Date updateTime;


}
