package com.hades.blog_service.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.hades.blog_service.entity.SysMenus;
import com.hades.blog_service.entity.vo.MenuQurey;
import com.hades.blog_service.service.impl.SysMenusServiceImpl;
import com.hades.blog_service.utils.R;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author hades
 * @since 2020-12-03
 */
@RestController
@CrossOrigin()
@Api(tags = "菜单管理")
@RequestMapping("/admin/menu")
public class SysMenusController {

    @Autowired
    SysMenusServiceImpl menusService;

    @ApiOperation(value = "获取菜单列表")
    @GetMapping()
    public R getMenus(){
        List<SysMenus> list = menusService.list(null);
        return R.ok().data("list",list);
    }

    @ApiOperation(value = "添加菜单")
    @PostMapping("/add")
    public R addMenus(@RequestBody MenuQurey postBody){
       return menusService.addMenus(postBody);

    }

    @ApiOperation(value = "查询一级菜单")
    @GetMapping("/getFirstMenus")
    public R getFirstMenus(){
        QueryWrapper<SysMenus> wrapper = new QueryWrapper<>();
        wrapper.eq("m_id","0");
        List<SysMenus> list = menusService.list(wrapper);
        return R.ok().data("list",list);
    }

    @ApiOperation(value = "删除菜单")
    @GetMapping("/delMenu/{id}")
    public R delMenu(@ApiParam(name = "id", value = "菜单ID") @PathVariable Long id ){
        System.out.println(id);
        if(id==null){
            return R.error().message("请输入ID");
        }else {
            boolean flag = menusService.removeById(id);

            if(flag){
                QueryWrapper<SysMenus> menusWrapper = new QueryWrapper<>();
                menusWrapper.select("id","m_id","name","url","icon","sort");
                menusWrapper.orderByAsc("sort");
                List<Map<String, Object>> maps = menusService.listMaps(menusWrapper);
                return R.ok().message("删除成功").data("list",maps);
            }else{
                return R.error().message("删除失败");
            }

        }
    }

    @ApiOperation(value = "修改菜单")
    @PostMapping("/update")
    public R updateMenu(@RequestBody MenuQurey menu){
        return menusService.updataMenu(menu);
    }


}

