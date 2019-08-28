package com.zrtec.core.module.sys.dao;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import com.zrtec.core.module.sys.entity.SysUser;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author wenlongfei
 * @since 2018-10-12
 */
public interface SysUserDao extends BaseMapper<SysUser> {

    /**
     * 查询用户的所有权限
     * @param userId  用户ID
     */
    List<String> queryAllPerms(Long userId);

    /**
     * 分页
     * @param page
     * @param usernameOrName
     * @return
     */
    List<SysUser> selectSysUserPages(Pagination page, @Param("usernameOrName") String usernameOrName, @Param("ids") List<Long> ids);

    /**
     * 修改密码
     * @param username
     * @param password
     * @param salt
     */
    void updatePassword(@Param("username") String username, @Param("password") String password, @Param("salt") String salt);
}
