package com.ljq.house.biz.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.common.collect.Lists;
import com.google.common.collect.Ordering;
import com.ljq.house.common.model.House;
import com.ljq.house.common.page.PageParams;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;

/**
 * @Author: ljq
 * @Date: 18-12-27 下午4:01
 */

@Service
public class RecommendService {
    private static final String HOT_HOUSE_KEY = "hot_house";

    private static final Logger logger = LoggerFactory.getLogger(RecommendService.class);

    @Autowired
    private HouseService houseService;

    public Jedis getJedis() {
        JedisPoolConfig poolconfig = new JedisPoolConfig();
        poolconfig.setMaxIdle(30);
        poolconfig.setMinIdle(10);
        poolconfig.setMaxTotal(50);
        JedisPool pool = new JedisPool(poolconfig, "localhost", 6379);
        return pool.getResource();
    }

    public void increase(Long id) {
        try {
            Jedis jedis = getJedis();
            jedis.zincrby(HOT_HOUSE_KEY, 1.0D, id + "");
            jedis.zremrangeByRank(HOT_HOUSE_KEY, 0, -11);// 0代表第一个元素,-1代表最后一个元素，保留热度由低到高末尾10个房产信息
            jedis.close();
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
        }

    }

    public List<Long> getHot() {
        try {
            Jedis jedis = getJedis();
            Set<String> idSet = jedis.zrevrange(HOT_HOUSE_KEY, 0, -1);
            jedis.close();
            List<Long> ids = idSet.stream().map(Long::parseLong).collect(Collectors.toList());
            return ids;
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
            return Lists.newArrayList();
        }

    }

    public List<House> getHotHouse(Integer size) {
        House query = new House();
        List<Long> list = getHot();
        list = list.subList(0, Math.min(list.size(), size));
        if (list.isEmpty()) {
            return Lists.newArrayList();
        }
        query.setIds(list);
        final List<Long> order = list;
        List<House> houses = houseService.queryAndSetImg(query, PageParams.build(size, 1));
        Ordering<House> houseSort = Ordering.natural().onResultOf(hs -> {
            return order.indexOf(hs.getId());
        });
        return houseSort.sortedCopy(houses);
    }

    public List<Double> getPercentage(Integer size) {
        try {
            List<Long> list = getHot();
            List<Double> data = new ArrayList<>();
            list = list.subList(0, Math.min(list.size(), size));
            Jedis jedis = getJedis();
            for (int i = 0; i < list.size(); i++) {
                data.add(jedis.zscore(HOT_HOUSE_KEY, list.get(i) + ""));
            }
            jedis.close();
            return data;
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
            return Lists.newArrayList();
        }
    }

    public List<House> getLastest() {
        House query = new House();
        query.setSort("create_time");
        List<House> houses = houseService.queryAndSetImg(query, new PageParams(8, 1));
        return houses;
    }
}
