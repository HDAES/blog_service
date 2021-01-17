package com.hades.blog_service.service.impl;

import com.hades.blog_service.entity.SysBlogDetails;
import com.hades.blog_service.mapper.SysBlogDetailsMapper;
import com.hades.blog_service.service.SysBlogDetailsService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hades.blog_service.utils.R;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author hades
 * @since 2021-01-06
 */
@Service
public class SysBlogDetailsServiceImpl extends ServiceImpl<SysBlogDetailsMapper, SysBlogDetails> implements SysBlogDetailsService {

    @Resource
    SysBlogDetailsMapper blogDetailsMapper;

    @Override
    public R selectDetails() {
        List<SysBlogDetails> sysBlogDetails = blogDetailsMapper.selectDetails();
        return R.ok().data("list",sysBlogDetails);
    }

    @Override
    public R addDetails(SysBlogDetails details) {
        int insert = blogDetailsMapper.insert(details);
        return R.intRespone(insert);
    }

    @Override
    public R updateDetails(SysBlogDetails details) {
        if(details.getId()==null){
            return  R.error().message("id不能为空");
        }
        int i = blogDetailsMapper.updateById(details);
        return R.intRespone(i);
    }

}
