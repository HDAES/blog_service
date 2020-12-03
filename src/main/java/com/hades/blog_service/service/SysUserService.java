package com.hades.blog_service.service;

import com.hades.blog_service.entity.SysUser;
import com.baomidou.mybatisplus.extension.service.IService;
import com.hades.blog_service.entity.vo.InsertUser;
import com.hades.blog_service.entity.vo.UpdateUserModel;
import com.hades.blog_service.utils.R;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author hades
 * @since 2020-12-03
 */
public interface SysUserService extends IService<SysUser> {

    R updateUser(UpdateUserModel user);

    R insertUser(InsertUser user);
}
