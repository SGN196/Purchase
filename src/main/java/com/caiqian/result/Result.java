package com.caiqian.result;

/**
 * @author SGN196
 * @date 2019/4/3 21:23
 *
 *
 *
 */

public class Result<T>
{
    private int code;  //错误码
    private String msg;  //错误信息

    private T data;  //成功时的信息。


    public Result()
    {
    }

    private Result(T data)
    {
        this.code = 0;
        this.msg = "success";
        this.data = data;  //返回json对象
    }
    private Result(CodeMsg codeMsg){
        if(codeMsg == null){
            return;
        }
        this.code = codeMsg.code;
        this.msg = codeMsg.msg;
    }

    public static <T> Result<T> success(T t){
        return new Result<T>(t);
    }

    public static <T> Result<T> error(CodeMsg codeMsg){
        return new Result<>(codeMsg);
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

    public T getData()
    {
        return data;
    }

    public void setData(T data)
    {
        this.data = data;
    }
}

