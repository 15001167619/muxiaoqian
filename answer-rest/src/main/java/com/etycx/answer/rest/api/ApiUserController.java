package com.etycx.answer.rest.api;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.etycx.answer.core.base.controller.BaseController;
import com.etycx.answer.rest.auth.util.CommonUtils;
import com.etycx.answer.rest.remote.entity.AnswerUser;
import com.etycx.answer.rest.remote.service.IAnswerUserService;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "api/user")
public class ApiUserController extends BaseController {

    @Autowired
    private IAnswerUserService answerUserService;

    /**
     * 获取用户列表
     */
    @ApiOperation(value="获取用户列表", notes="测试获取用户列表")
    @RequestMapping(value={""}, method=RequestMethod.GET)
    public Object list(@ApiParam(required = true, name = "page", value = "当前页码") @RequestParam(value = "page", defaultValue = "1") Integer pageNum,
                       @ApiParam(required = true, name = "rows", value = "每页条数") @RequestParam(value = "rows", defaultValue = "3") Integer rows,
                       @ApiParam(name = "age", value = "年龄") @RequestParam(value = "age", required = false) Integer age,
                       @ApiParam(name = "name", value = "姓名") @RequestParam(value = "name", required = false) String name) {
        if(CommonUtils.isNotBlank(name)||age!=null){
            EntityWrapper<AnswerUser> ew = new EntityWrapper<>();
            ew.setEntity(AnswerUser.builder().build());
            ew.where("age<{0}",age)
                    .like("name",name).orderBy("age");
            return findDataPage(answerUserService.selectPage(new Page<>(pageNum, rows), ew));
        }
        return findDataPage(answerUserService.selectPage(new Page<>(pageNum, rows)));
    }


    /**
     * 获取用户列表
     */
    @ApiOperation(value="获取用户列表", notes="测试获取用户列表")
    @RequestMapping(value={"register"}, method=RequestMethod.GET)
    public Object register(@ApiParam(name = "openId", value = "微信openId") @RequestParam(value = "openId", required = false) String openId,
                           @ApiParam(name = "nickName", value = "微信昵称") @RequestParam(value = "nickName", required = false) String nickName,
                           @ApiParam(name = "head", value = "微信头像") @RequestParam(value = "head", required = false) String head) {

        return answerUserService.register(AnswerUser.builder().build());
    }

}
