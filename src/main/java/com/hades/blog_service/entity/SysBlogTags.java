package com.hades.blog_service.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;

import com.baomidou.mybatisplus.annotation.TableLogic;
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
 * @since 2021-01-05
 */
@Data
@EqualsAndHashCode(callSuper = false)
@ApiModel(value="SysBlogTags对象", description="")
public class SysBlogTags implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "标签ID")
    @TableId(value = "id", type = IdType.ID_WORKER_STR)
    private String id;

    @ApiModelProperty(value = "分类ID")
    private String sId;

    @ApiModelProperty(value = "分类名字")
    private String name;

    @ApiModelProperty(value = "标签名字")
    private String tName;

    @ApiModelProperty(value = "标签图标")
    private String tIcon;

    @TableLogic
    @ApiModelProperty(value = "删除状态")
    private Integer deleted;


}
