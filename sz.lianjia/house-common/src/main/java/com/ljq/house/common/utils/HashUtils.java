package com.ljq.house.common.utils;

import java.nio.charset.Charset;

import com.google.common.hash.HashCode;
import com.google.common.hash.HashFunction;
import com.google.common.hash.Hashing;

/**
 * @Author: ljq
 * @Date: 18-12-27 下午1:13
 */
public class HashUtils {
    private static final HashFunction FUNCTION = Hashing.md5();

    private static final String SALT = "ljq.com";

    public static String encryPassword(String password) {
        HashCode hashCode = FUNCTION.hashString(password + SALT, Charset.forName("UTF-8"));
        return hashCode.toString();
    }
}
