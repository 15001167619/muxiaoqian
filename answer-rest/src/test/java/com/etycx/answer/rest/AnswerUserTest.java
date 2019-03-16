package com.etycx.answer.rest;

import com.etycx.answer.rest.remote.entity.AnswerUser;
import com.etycx.answer.rest.remote.service.IAnswerUserService;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.Date;

@RunWith(SpringRunner.class)
@SpringBootTest
@Slf4j
public class AnswerUserTest {

    @Autowired
    private IAnswerUserService sysUserService;

    @Test
    public void addUser() {
        sysUserService.insert(AnswerUser.builder().phone("15001167619").createTime(new Date()).build());
    }

}
