package com.etycx.answer.rest.auth.validator.impl;

import com.etycx.answer.rest.auth.validator.IReqValidator;
import com.etycx.answer.rest.remote.dao.AnswerUserMapper;
import com.etycx.answer.rest.remote.entity.AnswerUser;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

@Service
public class ReqValidatorImpl implements IReqValidator {

    @Autowired
    private AnswerUserMapper userMapper;

    @Value("${specialValidator.enable}")
    private boolean enableValidator;

    @Override
    public boolean validate(String credenceUnique) {
        if(StringUtils.isBlank(credenceUnique))
            return false;
        //是否开启特殊验证
        if (enableValidator && ("666".equals(credenceUnique))) {
            return true;
        } else {
            AnswerUser userInfo = userMapper.findUserInfo(AnswerUser.builder().phone(credenceUnique).build());
            if(userInfo == null){
                return false;
            }
            return true;
        }
    }

}
