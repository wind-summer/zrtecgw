package com.zrtec.core.module.sys.dao;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.zrtec.core.module.sys.entity.SysUserToken;

/**
 * <p>
 * 用户token关联表 Mapper 接口
 * </p>
 *
 * @author wenlongfei
 * @since 2018-10-12
 */
public interface SysUserTokenDao extends BaseMapper<SysUserToken> {

    SysUserToken selectByUserId(Long userId);
}
