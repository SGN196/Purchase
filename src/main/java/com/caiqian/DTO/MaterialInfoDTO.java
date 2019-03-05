package com.caiqian.DTO;

/**
 * @author SGN196
 * @date 2019/3/5 18:40
 */

public class MaterialInfoDTO
{
    private Integer id;
    private String materialName;
    private Integer materialQuantity;
    private String materialUnit;
    private Integer levelOne;
    private Integer levelTwo;
    private Integer pageNum;    //得到当前页码

    public Integer getId()
    {
        return id;
    }

    public void setId(Integer id)
    {
        this.id = id;
    }

    public Integer getPageNum()
    {
        return pageNum;
    }

    public void setPageNum(Integer pageNum)
    {
        this.pageNum = pageNum;
    }

    public String getMaterialName()
    {
        return materialName;
    }

    public void setMaterialName(String materialName)
    {
        this.materialName = materialName;
    }

    public Integer getMaterialQuantity()
    {
        return materialQuantity;
    }

    public void setMaterialQuantity(Integer materialQuantity)
    {
        this.materialQuantity = materialQuantity;
    }

    public String getMaterialUnit()
    {
        return materialUnit;
    }

    public void setMaterialUnit(String materialUnit)
    {
        this.materialUnit = materialUnit;
    }

    public Integer getLevelOne()
    {
        return levelOne;
    }

    public void setLevelOne(Integer levelOne)
    {
        this.levelOne = levelOne;
    }

    public Integer getLevelTwo()
    {
        return levelTwo;
    }

    public void setLevelTwo(Integer levelTwo)
    {
        this.levelTwo = levelTwo;
    }

    @Override
    public String toString()
    {
        return "MaterialInfoDTO{" +
                "id='" + id + '\'' +
                ", materialName='" + materialName + '\'' +
                ", materialQuantity=" + materialQuantity +
                ", materialUnit='" + materialUnit + '\'' +
                ", levelOne=" + levelOne +
                ", levelTwo=" + levelTwo +
                ", pageNum=" + pageNum +
                '}';
    }
}
