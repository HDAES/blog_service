package com.hades.blog_service.service.impl;

import com.hades.blog_service.entity.SysBlogSort;
import com.hades.blog_service.mapper.SysBlogSortMapper;
import com.hades.blog_service.service.SysBlogSortService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hades.blog_service.utils.R;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author hades
 * @since 2021-01-04
 */
@Service
public class SysBlogSortServiceImpl extends ServiceImpl<SysBlogSortMapper, SysBlogSort> implements SysBlogSortService {

    @Resource
    SysBlogSortMapper sysBlogSortMapper;

    public R addSort(SysBlogSort blogSort) {
        SysBlogSort sort = new SysBlogSort();
        sort.setName(blogSort.getName());
        sort.setType(blogSort.getType());
        sort.setImage(blogSort.getImage());
        sort.setIcon(blogSort.getIcon());
        int insert = sysBlogSortMapper.insert(sort);
        return R.intRespone(insert);
    }

    @Override
    public R updateSort(SysBlogSort blogSort) {
        if(blogSort.getId()==null){
            return R.error().message("ID不能为空");
        }else {
            SysBlogSort sort = new SysBlogSort();
            sort.setId(blogSort.getId());
            sort.setType(blogSort.getType());
            sort.setIcon(blogSort.getIcon());
            sort.setImage(blogSort.getImage());
            sort.setName(blogSort.getName());
            int update = sysBlogSortMapper.updateById(sort);
            return R.intRespone(update);

        }

    }
}
