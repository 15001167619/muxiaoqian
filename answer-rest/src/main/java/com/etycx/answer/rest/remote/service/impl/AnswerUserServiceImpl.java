package com.etycx.answer.rest.remote.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.etycx.answer.rest.remote.dao.AnswerUserMapper;
import com.etycx.answer.rest.remote.entity.AnswerUser;
import com.etycx.answer.rest.remote.service.IAnswerUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 用户Service
 *
 * @author wuhaisheng
 * @Date 2019-03-15 12:12:32
 */
@Service
public class AnswerUserServiceImpl extends ServiceImpl<AnswerUserMapper, AnswerUser> implements IAnswerUserService {

    @Autowired
    private AnswerUserMapper userMapper;


    @Override
    public AnswerUser getUserInfo(Integer id) {
        return userMapper.selectById(id);
    }

    @Override
    public List<Map<String, Object>> getUserList(AnswerUser user) {
        return null;
    }

    @Override
    public Map<String, Object> register(AnswerUser user) {
        Map<String, Object> map = new HashMap<>(3);
        userMapper.insert(user);
        map.put("code",200);
        map.put("message","用户注册成功");
        map.put("data",user.getId());
        return map;
    }
}
