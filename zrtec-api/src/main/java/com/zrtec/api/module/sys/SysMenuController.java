package com.zrtec.api.module.sys;

import com.zrtec.core.module.sys.entity.SysMenu;
import com.zrtec.core.module.sys.entity.request.SysMenuAdd;
import com.zrtec.core.module.sys.entity.request.SysMenuUpdate;
import com.zrtec.core.module.sys.entity.response.ParentTree;
import com.zrtec.core.module.sys.service.SysMenuService;
import com.zrtec.core.utils.ApiResult;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.AllArgsConstructor;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 菜单管理
 * @author wenlongfei
 * @since 2018/11/6
 */
@RestController
@RequestMapping("/sys")
@AllArgsConstructor
@Api(description = "菜单管理")
public class SysMenuController {

    private SysMenuService sysMenuService;

    @ApiOperation("菜单列表")
    @GetMapping("/menus")
    public List<SysMenu> page(){
        //Page<SysUser> pageList = sysUserService.pages(page, usernameOrName);
        return sysMenuService.findAllMenus();
    }

    @ApiOperation("上级菜单树")
    @GetMapping("/menu/parentTrees")
    public List<ParentTree> parentTrees(){
        return sysMenuService.parentTrees();
    }

    @ApiOperation("添加菜单")
    @PostMapping("/menu")
    public ApiResult save(@RequestBody @Validated SysMenuAdd sysMenu){
        sysMenuService.addMenu(sysMenu);
        return ApiResult.ok("添加成功");
    }

    @ApiOperation("修改菜单")
    @PutMapping("/menu")
    public ApiResult update(@RequestBody @Validated SysMenuUpdate sysMenu){
        sysMenuService.updateMenu(sysMenu);
        return ApiResult.ok("修改成功");
    }

    @ApiOperation("删除菜单|批量删除")
    @DeleteMapping("/menu/{id}")
    public ApiResult update(@PathVariable Long id){
        sysMenuService.deleteMenus(id);
        return ApiResult.ok("删除成功");
    }
}
