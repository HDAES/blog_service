package com.hades.blog_service.utils;

import com.hades.blog_service.utils.inter.ResultCode;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.HashMap;
import java.util.Map;

/**
 * @Author HADES
 * @Create 2020/12/3 14:21
 * description  返回封装
 */
@Data
@ApiModel("返回实体")
public class R {
    @ApiModelProperty(value = "是否成功")
    private Boolean success;

    @ApiModelProperty(value = "返回码")
    private Integer code;

    @ApiModelProperty(value = "返回消息")
    private String message;

    @ApiModelProperty(value = "返回数据")
    private Map<String, Object> data = new HashMap<String, Object>();

    private R(){}

    public static R ok(){
        R r = new R();
        r.setSuccess(true);
        r.setCode(ResultCode.SUCCESS);
        r.setMessage("成功");
        return  r;
    }

    public static R error(){
        R r = new R();
        r.setSuccess(false);
        r.setCode(ResultCode.ERROR);
        r.setMessage("失败");
        return  r;
    }

    public R success(Boolean success){
        this.setSuccess(true);
        return this;
    }

    public R message(String message){
        this.setMessage(message);
        return this;
    }

    public R code(Integer code){
        this.setCode(code);
        return this;
    }

    public R data(String key, Object value){
        this.data.put(key,value);
        return this;
    }

    public R data(Map<String, Object> data){
        this.setData(data);
        return this;
    }

    public static R intRespone(int i){
        if(i>0){
            return R.ok().message("更新成功");
        }else {
            return R.error().message("更新失败，未找到ID");
        }
    }

    public static R booleanRespone(boolean bool){
        if(bool){
            return R.ok().message("删除成功");
        }else {
            return R.error().message("删除失败，未找到ID");
        }
    }
}
