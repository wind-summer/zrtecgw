package com.zrtec.core.module.sys.entity;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableField;
import lombok.Data;

import java.io.Serializable;

/**
 * @author wenlf
 * @since 2018/4/24
 */
@Data
public class BaseEntity<T extends Model> extends Model<T> implements Serializable {

    @TableField("id")
    private Long id;
    /**
     * 主键值
     */
    @Override
    protected Serializable pkVal() {
        return id;
    }
}
