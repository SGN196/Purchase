package com.caiqian.DTO;

/**
 * @author SGN196
 * @date 2019/3/15 20:49
 */

public class PageDTO
{
    private Integer pageNum = 1;

    public Integer getPageNum()
    {
        return pageNum;
    }

    public void setPageNum(Integer pageNum)
    {
        this.pageNum = pageNum;
    }

    @Override
    public String toString()
    {
        return "PageDTO{" +
                "pageNum=" + pageNum +
                '}';
    }
}
