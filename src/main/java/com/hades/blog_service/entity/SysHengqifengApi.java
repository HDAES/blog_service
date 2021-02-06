package com.hades.blog_service.entity;

import com.baomidou.mybatisplus.annotation.IdType;
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
 * @since 2021-02-02
 */
@Data
@EqualsAndHashCode(callSuper = false)
@ApiModel(value="SysHengqifengApi对象", description="")
public class SysHengqifengApi implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "接口ID")
    private Integer id;

    @ApiModelProperty(value = "接口地址")
    private String url;

    @ApiModelProperty(value = "请求参数")
    private String params;

    @ApiModelProperty(value = "请求方式")
    private String method;

    @ApiModelProperty(value = "描述")
    private String des;
}
