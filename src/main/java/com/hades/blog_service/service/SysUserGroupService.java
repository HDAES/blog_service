package com.hades.blog_service.service;

import com.hades.blog_service.entity.SysUserGroup;
import com.baomidou.mybatisplus.extension.service.IService;
import com.hades.blog_service.entity.vo.GroupQurey;
import com.hades.blog_service.utils.R;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author hades
 * @since 2020-12-04
 */
public interface SysUserGroupService extends IService<SysUserGroup> {

    R addGroup(GroupQurey userGroup);
}
