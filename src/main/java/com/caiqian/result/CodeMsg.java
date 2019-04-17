package com.caiqian.result;

/**
 * @author SGN196
 * @date 2019/4/3 21:24
 */

public class CodeMsg
{
    public int code;
    public String msg;

    public static final CodeMsg a = new CodeMsg(111,"aaa");



    private CodeMsg(int code, String msg)
    {
        this.code = code;
        this.msg = msg;
    }

    public int getCode()
    {
        return code;
    }

    public void setCode(int code)
    {
        this.code = code;
    }

    public String getMsg()
    {
        return msg;
    }

    public void setMsg(String msg)
    {
        this.msg = msg;
    }

    public static CodeMsg getA()
    {
        return a;
    }
}
