package com.etycx.answer.rest.remote.service;

import com.baomidou.mybatisplus.service.IService;
import com.etycx.answer.rest.remote.entity.AnswerUser;

import java.util.List;
import java.util.Map;

/**
 * 用户Service
 *
 * @author wuhaisheng
 * @Date 2019-03-15 12:12:32
 */
public interface IAnswerUserService extends IService<AnswerUser> {

    /**
     * @author 武海升
     * @param id 用户Id
     * @return 用户信息
     */
    AnswerUser getUserInfo(Integer id);

    List<Map<String,Object>> getUserList(AnswerUser user);

    Map<String,Object> register(AnswerUser build);
}
