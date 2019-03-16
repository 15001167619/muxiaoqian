package com.etycx.answer.rest;

import com.etycx.answer.rest.remote.redis.IRedisService;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
@Slf4j
public class RedisTest {

    @Autowired
    private IRedisService redisService;

    @Test
    public void addUser() {
        redisService.addToRedis("whs","武海升",120L);
    }

}
