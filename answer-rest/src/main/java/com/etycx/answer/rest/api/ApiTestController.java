package com.etycx.answer.rest.api;

import com.etycx.answer.rest.remote.service.IAnswerUserService;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "api")
public class ApiTestController {

    @Autowired
    private IAnswerUserService answerUserService;


    @ApiOperation(value="测试", notes="获取 测试")
    @RequestMapping(value = "auth/test1", method= RequestMethod.GET)
    public String test1() {
        return "测试1";
    }

    @ApiOperation(value="测试2", notes="获取 测试2")
    @RequestMapping(value = "test2", method= RequestMethod.GET)
    public String test2() {
        return "测试2";
    }

    @ApiOperation(value="用户管理", notes="获取 获取用户")
    @RequestMapping(value = "getUserInfo", method= RequestMethod.GET)
    public Object getUserInfo(Integer id) {
        return answerUserService.getUserInfo(id);
    }

}
