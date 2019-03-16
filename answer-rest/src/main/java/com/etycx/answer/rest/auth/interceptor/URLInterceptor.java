package com.etycx.answer.rest.auth.interceptor;

import com.alibaba.fastjson.JSONObject;
import com.etycx.answer.rest.auth.util.JwtTokenUtil;
import com.etycx.answer.rest.remote.redis.IRedisService;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

@Slf4j
public class URLInterceptor implements HandlerInterceptor {

    @Autowired
    private JwtTokenUtil jwtTokenUtil;
    @Autowired
    private IRedisService redisService;

    final String TOKEN_PATH = "/api/auth/getToken";
    final String AUTH_PATH = "/api/auth";

    public boolean preHandle(HttpServletRequest request, HttpServletResponse httpServletResponse, Object o) throws Exception {

        String requestMethod = request.getRequestURI();
        if(requestMethod==null)
            return false;
        // 获取 token
        if(TOKEN_PATH.equals(requestMethod))
            return true;

        // 调用 带有 anth 接口 需校验
        if(requestMethod.contains(AUTH_PATH)){
            String token = request.getHeader("token");
            String sign = request.getHeader("sign");
            String credenceUnique = request.getHeader("credenceUnique");
            JSONObject object = new JSONObject();
            httpServletResponse.setCharacterEncoding("UTF-8");
            httpServletResponse.setContentType("text/html; charset=utf-8");
            PrintWriter writer = null;
            if(StringUtils.isBlank(token) || StringUtils.isBlank(sign) || StringUtils.isBlank(credenceUnique)){
                try {
                    writer = httpServletResponse.getWriter();
                    object.put("code",10000);
                    object.put("message","请求头参数错误");
                    writer.print(object);
                    return false;
                } catch (Exception e) {
                    log.error("response error",e);
                } finally {
                    if (writer != null)
                        writer.close();
                }
            }else {
                // 校验 token 是否 过期
                boolean flag = jwtTokenUtil.isTokenExpired(token);
                if(flag){
                    writer = httpServletResponse.getWriter();
                    object.put("code",10001);
                    object.put("message","token 已过期");
                    writer.print(object);
                    return false;
                }
                // 校验 sign 签名是否过期 服务器 redis 校验
                String redisValueByKey = redisService.getRedisValueByKey("token_sign_" + credenceUnique);
                if(StringUtils.isBlank(redisValueByKey) || !sign.equals(redisValueByKey)){
                    writer = httpServletResponse.getWriter();
                    object.put("code",10002);
                    object.put("message","sign 已过期");
                    writer.print(object);
                    return false;
                }
            }
        }
        return true;
    }

}
