package com.etycx.answer.rest.remote.redis.impl;

import com.etycx.answer.rest.remote.redis.IRedisService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.*;
import org.springframework.data.redis.serializer.RedisSerializer;
import org.springframework.data.redis.serializer.StringRedisSerializer;
import org.springframework.stereotype.Service;

import java.io.Serializable;
import java.util.List;
import java.util.Set;
import java.util.concurrent.TimeUnit;

@Service
public class RedisServiceImpl implements IRedisService {

    private RedisTemplate redisTemplate;

    @Autowired(required = false)
    public void setRedisTemplate(RedisTemplate redisTemplate) {
        RedisSerializer stringSerializer = new StringRedisSerializer();
        redisTemplate.setKeySerializer(stringSerializer);
        redisTemplate.setValueSerializer(stringSerializer);
        redisTemplate.setHashKeySerializer(stringSerializer);
        redisTemplate.setHashValueSerializer(stringSerializer);
        this.redisTemplate = redisTemplate;
    }

    @Override
    public boolean keyExists(String key) {
        return redisTemplate.hasKey(key);
    }

    @Override
    public boolean  addToRedis(final String key, String value) {
        boolean result = false;
        try {
            ValueOperations<Serializable, Object> operations = redisTemplate.opsForValue();
            operations.set(key, value);
            result = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    @Override
    public boolean  addToRedis(final String key, String value, Long  expireTime) {
        boolean result = false;
        try {
            ValueOperations<Serializable, Object> operations = redisTemplate.opsForValue();
            operations.set(key, value);
            redisTemplate.expire(key, expireTime, TimeUnit.SECONDS);
            result = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    @Override
    public String getRedisValueByKey(String key) {
        Object result = null;
        ValueOperations<Serializable, Object> operations = redisTemplate.opsForValue();
        result = operations.get(key);
        return result==null?null:result.toString();
    }

    @Override
    public void  deleteRedisValueByKey(final String key) {
        Set<Serializable> keys = redisTemplate.keys(key);
        if (keys.size() > 0)
            redisTemplate.delete(keys);
    }
    @Override
    public void  deleteRedisValueByKeys(final  String... keys) {
        for (String key : keys) {
            remove(key);
        }
    }
    @Override
    public Object  hget(String key, Object  hashKey) {
        HashOperations<String, Object, Object> hash = redisTemplate.opsForHash();
        return hash.get(key,hashKey);
    }

    @Override
    public void hset(String key, Object  field, Object  value) {
        HashOperations<String, Object, Object> hash = redisTemplate.opsForHash();
        hash.put(key,field,value);
    }

    @Override
    public void addListToRedis(String key, String value) {
        ListOperations<String, Object> list = redisTemplate.opsForList();
        list.rightPush(key,value);
    }

    @Override
    public List<Object> getListFromRedis(String key, Long min, Long max) {
        ListOperations<String, Object> list = redisTemplate.opsForList();
        return list.range(key,min,max);
    }

    @Override
    public void addSetToRedis(String key, String value) {
        SetOperations<String, Object> set = redisTemplate.opsForSet();
        set.add(key,value);
    }

    @Override
    public Set<Object> getSetFromRedis(String key) {
        SetOperations<String, Object> set = redisTemplate.opsForSet();
        return set.members(key);
    }

    @Override
    public void zAdd(String key,Object value,double scoure){
        ZSetOperations<String, Object> zset = redisTemplate.opsForZSet();
        zset.add(key,value,scoure);
    }

    @Override
    public Set<Object> rangeByScore(String key, double scoure, double scoure1){
        ZSetOperations<String, Object> zset = redisTemplate.opsForZSet();
        return zset.rangeByScore(key, scoure, scoure1);
    }

    /**
     * 删除对应的value
     * @param key
     */
    public void remove(final String key) {
        if (exists(key)) {
            redisTemplate.delete(key);
        }
    }

    /**
     * 判断缓存中是否有对应的value
     * @param key
     * @return
     */
    public boolean exists(final String key) {
        return redisTemplate.hasKey(key);
    }

}
