package com.hades.blog_service.service;

import com.hades.blog_service.entity.SysBlogDetails;
import com.baomidou.mybatisplus.extension.service.IService;
import com.hades.blog_service.utils.R;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author hades
 * @since 2021-01-06
 */
public interface SysBlogDetailsService extends IService<SysBlogDetails> {

    R selectDetails();

    R addDetails(SysBlogDetails details);

    R updateDetail(SysBlogDetails details);

    List<SysBlogDetails> selectById(Long id);

    R getArticleList();


    R selectByKey(String key);
}
