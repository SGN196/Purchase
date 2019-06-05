package com.caiqian.util;

import org.apache.commons.codec.digest.DigestUtils;

/**
 * @author SGN196
 * @date 2019/3/31 23:15
 */

public class MD5Util
{

    private static final String salt = "1a2b3c4d";

    public static String md5(String src){
        return DigestUtils.md5Hex(src);
    }



    public static String inputPassFromPass(String inputPass){
        String str =  "" + salt.charAt(0) + salt.charAt(2) + inputPass + salt.charAt(5) + salt.charAt(4);
        System.out.println(str);
        return md5(str);
    }
    public static String formPassDBPass(String formPass, String salt){
        String str = salt.charAt(0) + salt.charAt(2) + formPass + salt.charAt(5) + salt.charAt(4);

        return md5(str);
    }
    public static String inputPassToDbPass(String inputPass, String saltDB){
        String formPass = inputPassFromPass(inputPass);
        String dbPass = formPassDBPass(formPass, saltDB);
        return dbPass;
    }

    public static void main(String[] args)
    {
        System.out.println(inputPassFromPass("123456"));
        System.out.println(formPassDBPass(inputPassFromPass("123456"), "1a2b3c4d"));
        System.out.println(inputPassToDbPass("123456", "1a2b3c4d"));
    }
}
