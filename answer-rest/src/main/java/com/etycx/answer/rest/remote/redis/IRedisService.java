package com.etycx.answer.rest.remote.redis;

import java.util.List;
import java.util.Set;

public interface IRedisService {

    /**
     * 验证redis是否存在key
     * @param key
     * @return
     */
    boolean keyExists(String key);

    /**
     * 设置redis值
     * @param key
     * @param value
     */
    boolean  addToRedis(String key, String value );

    /**
     * 设置redis值并设置存活时间
     * @param key
     * @param value
     * @param expire 秒 key存活时间
     */
    boolean  addToRedis(String key, String value, Long  expire);

    /**
     * 通过key获取redis值
     * @param key
     * @return
     */
    String getRedisValueByKey(String key);

    /**
     * 通过key删除value
     * @param key
     * @return
     */
    void  deleteRedisValueByKey(String key);
    /**
     * 通过keys删除value
     * @param keys
     * @return
     */
    void  deleteRedisValueByKeys(String... keys);


    Object hget(String key ,Object  field);

    void hset(String key ,Object  field ,Object  value);

    /**
     * 添加list
     * @param key
     * @param value
     */
    void addListToRedis(String key,String value);

    /**
     * 获取List
     * @param key
     * @param min 角标下限
     * @param max 角标上限
     * @return
     */
    List<Object> getListFromRedis(String key, Long min, Long max);

    /**
     * 添加list
     * @param key
     * @param value
     */
    void addSetToRedis(String key,String value);

    /**
     * 获取List
     * @param key
     * @return
     */
    Set<Object> getSetFromRedis(String key);

    /**
     * 有序集合添加
     * @param key
     * @param value
     * @param scoure
     */
    void zAdd(String key,Object value,double scoure);

    /**
     * 有序集合获取
     * @param key
     * @param scoure
     * @param scoure1
     * @return
     */
    Set<Object> rangeByScore(String key,double scoure,double scoure1);

}
