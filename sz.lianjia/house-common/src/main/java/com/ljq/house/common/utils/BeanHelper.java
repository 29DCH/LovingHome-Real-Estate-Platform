package com.ljq.house.common.utils;

import java.beans.PropertyDescriptor;
import java.lang.reflect.InvocationTargetException;
import java.util.Date;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.PropertyUtils;

/**
 * @Author: ljq
 * @Date: 18-12-26 下午10:17
 */

public class BeanHelper {
    private static final String updateTimeKey = "updateTime";

    private static final String createTimeKey = "createTime";


    public static <T> void setDefaultProp(T target, Class<T> clazz) {
        PropertyDescriptor[] descriptors = PropertyUtils.getPropertyDescriptors(clazz);
        for (PropertyDescriptor propertyDescriptor : descriptors) {
            String fieldName = propertyDescriptor.getName();
            Object value;
            try {
                value = PropertyUtils.getProperty(target, fieldName);
            } catch (IllegalAccessException | InvocationTargetException | NoSuchMethodException e) {
                throw new RuntimeException("can not set property  when get for " + target + " and clazz " + clazz + "" +
                        " field " + fieldName);
            }
            if (String.class.isAssignableFrom(propertyDescriptor.getPropertyType()) && value == null) {
                try {
                    PropertyUtils.setProperty(target, fieldName, "");
                } catch (IllegalAccessException | InvocationTargetException | NoSuchMethodException e) {
                    throw new RuntimeException("can not set property when set for " + target + " and clazz " + clazz
                            + " field " + fieldName);
                }
            } else if (Number.class.isAssignableFrom(propertyDescriptor.getPropertyType()) && value == null) {
                try {
                    BeanUtils.setProperty(target, fieldName, "0");
                } catch (Exception e) {
                    throw new RuntimeException("can not set property when set for " + target + " and clazz " + clazz
                            + " field " + fieldName);
                }
            }
        }
    }

    public static <T> void onUpdate(T target) {
        try {
            PropertyUtils.setProperty(target, updateTimeKey, System.currentTimeMillis());
        } catch (IllegalAccessException | InvocationTargetException | NoSuchMethodException e) {
            return;
        }
    }

    private static <T> void innerDefault(T target, Class<?> clazz, PropertyDescriptor[] descriptors) {
        for (PropertyDescriptor propertyDescriptor : descriptors) {
            String fieldName = propertyDescriptor.getName();
            Object value;
            try {
                value = PropertyUtils.getProperty(target, fieldName);
            } catch (IllegalAccessException | InvocationTargetException | NoSuchMethodException e) {
                throw new RuntimeException("can not set property  when get for " + target + " and clazz " + clazz + "" +
                        " field " + fieldName);
            }
            if (String.class.isAssignableFrom(propertyDescriptor.getPropertyType()) && value == null) {
                try {
                    PropertyUtils.setProperty(target, fieldName, "");
                } catch (IllegalAccessException | InvocationTargetException | NoSuchMethodException e) {
                    throw new RuntimeException("can not set property when set for " + target + " and clazz " + clazz
                            + " field " + fieldName);
                }
            } else if (Number.class.isAssignableFrom(propertyDescriptor.getPropertyType()) && value == null) {
                try {
                    BeanUtils.setProperty(target, fieldName, "0");
                } catch (Exception e) {
                    throw new RuntimeException("can not set property when set for " + target + " and clazz " + clazz
                            + " field " + fieldName);
                }
            } else if (Date.class.isAssignableFrom(propertyDescriptor.getPropertyType()) && value == null) {
                try {
                    BeanUtils.setProperty(target, fieldName, new Date(0));
                } catch (Exception e) {
                    throw new RuntimeException("can not set property when set for " + target + " and clazz " + clazz
                            + " field " + fieldName);
                }
            }
        }
    }

    public static <T> void onInsert(T target) {
        Class<?> clazz = target.getClass();
        PropertyDescriptor[] descriptors = PropertyUtils.getPropertyDescriptors(clazz);
        innerDefault(target, clazz, descriptors);
        long time = System.currentTimeMillis();
        Date date = new Date(time);
        try {
            PropertyUtils.setProperty(target, updateTimeKey, date);
        } catch (IllegalAccessException | InvocationTargetException | NoSuchMethodException e) {

        }
        try {
            PropertyUtils.setProperty(target, createTimeKey, date);
        } catch (IllegalAccessException | InvocationTargetException | NoSuchMethodException e) {

        }
    }


}
