package com.caiqian.util;

import org.apache.commons.codec.digest.DigestUtils;

/**
 * @author SGN196
 * @date 2019/3/31 23:15
 */

public class MD5Util
{
    private static final String salt = "1a2b3c4d";

    public static String md5(String str){
        return DigestUtils.md5Hex(str);
    }

}
