package com.zrtec.core.module.sys.entity.request;

import com.zrtec.core.module.sys.constant.SysUserStatus;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import java.util.List;

/**
 * Created by wenlf on 2018/10/12
 */
@Data
@ApiModel(description = "用户添加内容")
public class SysUserAdd {

    /**
     * 用户名
     */
    @ApiModelProperty("姓名")
    @NotBlank(message="姓名不能为空")
    private String name;

    /**
     * 用户名
     */
    @ApiModelProperty("用户名")
    @NotBlank(message="用户名不能为空")
    private String username;
    /**
     * 密码
     */
    @ApiModelProperty("密码")
    @NotBlank(message="密码不能为空")
    private String password;
    /**
     * 邮箱
     */
    @ApiModelProperty("邮箱")
    @Email(message="邮箱格式不正确")
    private String email;
    /**
     * 手机号
     */
    @ApiModelProperty("手机号")
    @NotBlank(message="手机号不能为空")
    private String mobile;

    /**
     * 头像
     */
    @ApiModelProperty("头像")
    private String avatar;

    /**
     * 状态
     */
    @ApiModelProperty("状态：ENABLE：启用 DISABLE:禁用")
    private SysUserStatus status;

    /**
     * 分配的角色Id列表
     */
    @ApiModelProperty("分配的角色Id列表")
    private List<Long> roleIds;
}
