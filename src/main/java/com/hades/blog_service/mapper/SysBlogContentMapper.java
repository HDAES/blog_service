package com.hades.blog_service.mapper;

import com.hades.blog_service.entity.SysBlogContent;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.hades.blog_service.entity.vo.HotArticel;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author hades
 * @since 2021-01-24
 */
public interface SysBlogContentMapper extends BaseMapper<SysBlogContent> {

    List<HotArticel> hotArticel();
}
