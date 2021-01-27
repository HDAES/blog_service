package com.hades.blog_service.entity.vo;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * @Author HADES
 * @Create 2021/1/27 13:37
 * description 热门文章输出
 */
@Data
public class HotArticel {

    @ApiModelProperty(value = "文章ID")
    private String id;

    @ApiModelProperty(value = "文章标题")
    private String title;

    @ApiModelProperty(value = "文章阅读数")
    private int readCount;

    @ApiModelProperty(value = "文章点赞数")
    private int likeCount;
}
