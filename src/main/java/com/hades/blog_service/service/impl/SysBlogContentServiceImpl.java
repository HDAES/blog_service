package com.hades.blog_service.service.impl;

import com.hades.blog_service.entity.SysBlogContent;
import com.hades.blog_service.entity.vo.HotArticel;
import com.hades.blog_service.mapper.SysBlogContentMapper;
import com.hades.blog_service.service.SysBlogContentService;
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
 * @since 2021-01-24
 */
@Service
public class SysBlogContentServiceImpl extends ServiceImpl<SysBlogContentMapper, SysBlogContent> implements SysBlogContentService {

    @Resource
    SysBlogContentMapper blogContentMapper;

    @Override
    public R updateContent(SysBlogContent content) {
        if(content.getId()==null){
            return R.error().message("ID不能为空");
        }else {
            int i = blogContentMapper.updateById(content);
            return R.intRespone(i);
        }
    }

    @Override
    public R getHotArticel() {
        List<HotArticel> hotArticels = blogContentMapper.hotArticel();
        return R.ok().data(hotArticels);
    }
}
