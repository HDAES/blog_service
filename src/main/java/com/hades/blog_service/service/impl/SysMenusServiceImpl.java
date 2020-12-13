package com.hades.blog_service.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.hades.blog_service.entity.SysMenus;
import com.hades.blog_service.entity.vo.MenuQurey;
import com.hades.blog_service.mapper.SysMenusMapper;
import com.hades.blog_service.service.SysMenusService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hades.blog_service.utils.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author hades
 * @since 2020-12-03
 */
@Service
public class SysMenusServiceImpl extends ServiceImpl<SysMenusMapper, SysMenus> implements SysMenusService {

    @Resource
    SysMenusMapper menusMapper;

    @Autowired
    SysMenusServiceImpl menusService;

    public R addMenus(MenuQurey postBody) {
        SysMenus menu = new SysMenus();
        if(postBody.getMId()!=null){
            menu.setMId(postBody.getMId());
        }
        menu.setName(postBody.getName());
        menu.setIcon(postBody.getIcon());
        menu.setUrl(postBody.getUrl());
        int insert = menusMapper.insert(menu);
        System.out.println(menu.getId());
        String id = menu.getId();
        if(insert>0){
            return R.ok().message("添加成功！").data("id",id);
        }else {
            return R.error().message("添加失败");
        }
    }

    @Override
    public R updataMenu(MenuQurey menu) {
        if(menu.getId() ==null || menu.getId().equals("undefined")){
            return R.error().message("ID不正确");
        }
        SysMenus newMenu = new SysMenus();
        newMenu.setId(menu.getId());
        newMenu.setMId(menu.getMId());
        newMenu.setName(menu.getName());
        newMenu.setUrl(menu.getUrl());
        newMenu.setStatus(menu.getStatus());
        newMenu.setSort(menu.getSort());
        int i = menusMapper.updateById(newMenu);
        if(i>0){
            QueryWrapper<SysMenus> menusWrapper = new QueryWrapper<>();
            menusWrapper.select("id","m_id","name","url","icon","sort");
            menusWrapper.orderByAsc("sort");
            List<Map<String, Object>> maps = menusService.listMaps(menusWrapper);
            return R.ok().message("修改成功").data("list",maps);
        }else {
            return R.error().message("更新失败");
        }
    }
}
