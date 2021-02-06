package com.hades.blog_service.mapper;

import com.hades.blog_service.entity.SysBlogDetails;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author hades
 * @since 2021-01-06
 */
@Mapper
public interface SysBlogDetailsMapper extends BaseMapper<SysBlogDetails> {
    List<SysBlogDetails> selectDetails();

    List<SysBlogDetails> selectDetailsById(long id);

    List<SysBlogDetails> selectDetailsBykey(String key);
}
