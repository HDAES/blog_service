package com.hades.blog_service.mapper;

import com.hades.blog_service.entity.SysUser;
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
 * @since 2020-12-03
 */
@Mapper
public interface SysUserMapper extends BaseMapper<SysUser> {

    List<SysUser> selectUserList();

    SysUser userMapper( @Param("account") String account,@Param("psw") String psw);
}
