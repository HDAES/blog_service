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
 * @since 2021-01-06
 */
@Data
@EqualsAndHashCode(callSuper = false)
@ApiModel(value="SysBlogDetails对象", description="")
public class SysBlogDetails implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "详情ID")
    @TableId(value = "id", type = IdType.ID_WORKER_STR)
    private String id;

    @ApiModelProperty(value = "分类ID")
    private String sId;

    @ApiModelProperty(value = "标签ID")
    private String tId;

    @ApiModelProperty(value = "博客标题")
    private String title;

    @ApiModelProperty(value = "博客描述")
    private String des;

    @ApiModelProperty(value = "博客图片")
    private String image;

    @ApiModelProperty(value = "来源 0: 原创  1:转载")
    private Integer source;

    @ApiModelProperty(value = "0: pc 1:微信小程序 2：pc和小程序")
    private Integer type;

    @ApiModelProperty(value = "排序")
    private Integer order;

    @TableField(fill = FieldFill.INSERT)
    @ApiModelProperty(value = "创建时间")
    private Date createTime;

    @TableField(fill = FieldFill.INSERT_UPDATE)
    @ApiModelProperty(value = "更新时间")
    private Date updateTime;


}
