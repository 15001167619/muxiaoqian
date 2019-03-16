package com.etycx.answer.rest.remote.dao;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.etycx.answer.rest.remote.entity.AnswerUser;

/**
 * 用户Dao
 *
 * @author wuhaisheng
 * @Date 2019-03-15 12:12:32
 */
public interface AnswerUserMapper extends BaseMapper<AnswerUser> {

    AnswerUser findUserInfo(AnswerUser userInfo);

}
