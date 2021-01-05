package com.hades.blog_service.service;

import com.hades.blog_service.entity.SysBlogTags;
import com.baomidou.mybatisplus.extension.service.IService;
import com.hades.blog_service.utils.R;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author hades
 * @since 2021-01-05
 */
public interface SysBlogTagsService extends IService<SysBlogTags> {
    R addTags(SysBlogTags tags);

    R updateTags(SysBlogTags tags);

    R selectTagsList();
}
