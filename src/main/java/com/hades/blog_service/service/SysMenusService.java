package com.hades.blog_service.service;

import com.hades.blog_service.entity.SysMenus;
import com.baomidou.mybatisplus.extension.service.IService;
import com.hades.blog_service.entity.vo.MenuQurey;
import com.hades.blog_service.utils.R;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author hades
 * @since 2020-12-03
 */
public interface SysMenusService extends IService<SysMenus> {

    R addMenus(MenuQurey postBody);

    R updataMenu(MenuQurey menu);
}
