package com.hades.blog_service.mapper;

import com.hades.blog_service.entity.SysBlogTags;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author hades
 * @since 2021-01-05
 */
@Mapper
public interface SysBlogTagsMapper extends BaseMapper<SysBlogTags> {
    List<SysBlogTags>  selectTagsList();
}
