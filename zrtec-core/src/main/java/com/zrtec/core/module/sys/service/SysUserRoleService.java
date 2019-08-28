package com.zrtec.core.module.sys.service;

import com.baomidou.mybatisplus.service.IService;
import com.zrtec.core.module.sys.entity.SysUserRole;

import java.util.List;

/**
 * <p>
 * 用户角色关联表 服务类
 * </p>
 *
 * @author wenlongfei
 * @since 2018-10-12
 */
public interface SysUserRoleService extends IService<SysUserRole> {

    /**
     * 添加和更新用户角色
     * @param userId
     * @param roleIdList
     */
    void saveOrUpdate(Long userId, List<Long> roleIdList);
}
