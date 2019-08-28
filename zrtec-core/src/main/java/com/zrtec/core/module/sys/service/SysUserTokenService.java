package com.zrtec.core.module.sys.service;

import com.baomidou.mybatisplus.service.IService;
import com.zrtec.core.module.sys.entity.SysUserToken;
import com.zrtec.core.utils.ApiResult;

/**
 * <p>
 * 用户token关联表 服务类
 * </p>
 *
 * @author wenlongfei
 * @since 2018-10-12
 */
public interface SysUserTokenService extends IService<SysUserToken> {

    /**
     * 生成token
     * @param userId
     * @return
     */
    ApiResult createToken(Long userId);

    /**
     * 根据token查询登陆用户
     * @param token
     * @return
     */
    SysUserToken queryByToken(String token);
}
