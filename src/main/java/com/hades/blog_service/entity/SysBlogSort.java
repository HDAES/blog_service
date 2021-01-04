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
 * @since 2021-01-04
 */
@Data
@EqualsAndHashCode(callSuper = false)
@ApiModel(value="SysBlogSort对象", description="")
public class SysBlogSort implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "ID 主键")
    @TableId(value = "id", type = IdType.ID_WORKER_STR)
    private String id;

    @ApiModelProperty(value = "名字")
    private String name;

    @ApiModelProperty(value = "图标")
    private String icon;

    @ApiModelProperty(value = "图片")
    private String image;

    @ApiModelProperty(value = "0: pc 1:微信小程序 3：pc和小程序")
    private Integer type;

    @TableLogic
    @ApiModelProperty(value = "删除状态")
    private Integer deleted;


}
