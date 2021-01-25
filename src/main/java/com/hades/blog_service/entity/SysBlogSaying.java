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
 * @since 2021-01-25
 */
@Data
@EqualsAndHashCode(callSuper = false)
@ApiModel(value="SysBlogSaying对象", description="")
public class SysBlogSaying implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "名言ID")
    @TableId(value = "id", type = IdType.ID_WORKER_STR)
    private String id;

    @ApiModelProperty(value = "内容")
    private String content;

    @ApiModelProperty(value = "作者")
    private String author;

    @TableLogic
    @ApiModelProperty(value = "是否删除 0：未删除 1 ：删除")
    private Integer deleted;

    @TableField(fill = FieldFill.INSERT)
    @ApiModelProperty(value = "创建时间")
    private Date createTime;

    @TableField(fill = FieldFill.INSERT_UPDATE)
    @ApiModelProperty(value = "更新时间")
    private Date updateTime;


}
