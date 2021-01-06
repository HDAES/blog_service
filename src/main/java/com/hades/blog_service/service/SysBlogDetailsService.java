package com.hades.blog_service.service;

import com.hades.blog_service.entity.SysBlogDetails;
import com.baomidou.mybatisplus.extension.service.IService;
import com.hades.blog_service.utils.R;

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
}
