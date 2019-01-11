package com.ljq.house.common.constants;

/**
 * @Author: ljq
 * @Date: 18-12-27 下午3:39
 */
public enum HouseUserType {
    SALE(1),BOOKMARK(2);

    public final Integer value;

    private HouseUserType(Integer value){
        this.value = value;
    }
}
