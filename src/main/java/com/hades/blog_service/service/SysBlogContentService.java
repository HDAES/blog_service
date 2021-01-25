package com.hades.blog_service.service;

import com.hades.blog_service.entity.SysBlogContent;
import com.baomidou.mybatisplus.extension.service.IService;
import com.hades.blog_service.utils.R;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author hades
 * @since 2021-01-24
 */
public interface SysBlogContentService extends IService<SysBlogContent> {

    R updateContent(SysBlogContent content);
}
