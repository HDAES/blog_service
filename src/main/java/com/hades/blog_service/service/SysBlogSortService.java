package com.hades.blog_service.service;

import com.hades.blog_service.entity.SysBlogSort;
import com.baomidou.mybatisplus.extension.service.IService;
import com.hades.blog_service.utils.R;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author hades
 * @since 2021-01-04
 */
public interface SysBlogSortService extends IService<SysBlogSort> {

    R addSort(SysBlogSort blogSort);

    R updateSort(SysBlogSort blogSort);
}
