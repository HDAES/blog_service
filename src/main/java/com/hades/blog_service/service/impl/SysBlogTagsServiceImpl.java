package com.hades.blog_service.service.impl;

import com.hades.blog_service.entity.SysBlogSort;
import com.hades.blog_service.entity.SysBlogTags;
import com.hades.blog_service.mapper.SysBlogSortMapper;
import com.hades.blog_service.mapper.SysBlogTagsMapper;
import com.hades.blog_service.service.SysBlogTagsService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hades.blog_service.utils.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author hades
 * @since 2021-01-05
 */
@Service
public class SysBlogTagsServiceImpl extends ServiceImpl<SysBlogTagsMapper, SysBlogTags> implements SysBlogTagsService {

    @Resource
    SysBlogTagsMapper sysBlogTagsMapper;

    @Override
    public R addTags(SysBlogTags tags) {
        SysBlogTags blogTags = new SysBlogTags();
        blogTags.setSId(tags.getSId());
        blogTags.setTName(tags.getTName());
        blogTags.setTIcon(tags.getTIcon());
        int insert = sysBlogTagsMapper.insert(blogTags);
        return R.intRespone(insert);
    }

    @Override
    public R updateTags(SysBlogTags tags) {
        if(tags.getId()==null){
            return R.error().message("ID不能为空");
        }
        SysBlogTags blogTags = new SysBlogTags();
        blogTags.setSId(tags.getSId());
        blogTags.setTName(tags.getTName());
        blogTags.setTIcon(tags.getTIcon());
        blogTags.setId(tags.getId());
        int i = sysBlogTagsMapper.updateById(blogTags);
        return R.intRespone(i);
    }

    @Override
    public R selectTagsList() {
        List<SysBlogTags> sysBlogTags = sysBlogTagsMapper.selectTagsList();
        return R.ok().data(sysBlogTags);
    }
}
