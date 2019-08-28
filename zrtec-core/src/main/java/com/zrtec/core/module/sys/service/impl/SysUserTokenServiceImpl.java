package com.zrtec.core.module.sys.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.zrtec.core.config.ApplicationProperties;
import com.zrtec.core.module.sys.dao.SysUserTokenDao;
import com.zrtec.core.module.sys.entity.SysUserToken;
import com.zrtec.core.module.sys.service.SysUserTokenService;
import com.zrtec.core.oauth2.TokenGenerator;
import com.zrtec.core.utils.ApiResult;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Date;

/**
 * <p>
 * 用户token关联表 服务实现类
 * </p>
 *
 * @author wenlongfei
 * @since 2018-10-12
 */
@Service
@AllArgsConstructor
public class SysUserTokenServiceImpl extends ServiceImpl<SysUserTokenDao, SysUserToken> implements SysUserTokenService {
    private ApplicationProperties applicationProperties;
    private SysUserTokenDao sysUserTokenDao;

    /**
     * 生成token
     *
     * @param userId
     * @return
     */
    @Override
    public ApiResult createToken(Long userId) {
        //生成一个token
        String token = TokenGenerator.generateValue();

        //当前时间
        Date now = new Date();
        //过期时间
        //Date expireTime = new Date(now.getTime() + EXPIRE * 1000);
        Date expireTime = new Date(now.getTime() + applicationProperties.getSecurity().getTokenExpire() * 1000);

        //判断是否生成过token
        SysUserToken tokenEntity = sysUserTokenDao.selectByUserId(userId);

        if(tokenEntity == null){
            tokenEntity = new SysUserToken();
            tokenEntity.setUserId(userId);
            tokenEntity.setToken(token);
            tokenEntity.setUpdateTime(now);
            tokenEntity.setExpireTime(expireTime);

            //保存token
            sysUserTokenDao.insert(tokenEntity);
        }else{
            tokenEntity.setToken(token);
            tokenEntity.setUpdateTime(now);
            tokenEntity.setExpireTime(expireTime);

            //更新token
            sysUserTokenDao.updateById(tokenEntity);
        }
        ApiResult r = ApiResult.ok().put("token", token).put("expire", applicationProperties.getSecurity().getTokenExpire());
        return r;
    }

    /**
     * 根据token查询登陆用户
     * @param token
     * @return
     */
    @Override
    public SysUserToken queryByToken(String token) {
        return this.selectOne(new EntityWrapper<SysUserToken>().eq("token", token));
    }
}
