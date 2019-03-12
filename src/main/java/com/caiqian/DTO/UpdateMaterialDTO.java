package com.caiqian.DTO;

/**
 * @author SGN196
 * @date 2019/3/6 19:19
 */

public class UpdateMaterialDTO
{
    private Integer id;
    private String materialName;
    private String materialUnit;
    private Integer levelOne;
    private Integer levelTwo;
    private String materialInfo;

    public Integer getId()
    {
        return id;
    }

    public void setId(Integer id)
    {
        this.id = id;
    }

    public String getMaterialName()
    {
        return materialName;
    }

    public void setMaterialName(String materialName)
    {
        this.materialName = materialName;
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

    public String getMaterialInfo()
    {
        return materialInfo;
    }

    public void setMaterialInfo(String materialInfo)
    {
        this.materialInfo = materialInfo;
    }

    @Override
    public String toString()
    {
        return "UpdateMaterialDTO{" +
                "id=" + id +
                ", materialName='" + materialName + '\'' +
                ", materialUnit='" + materialUnit + '\'' +
                ", levelOne=" + levelOne +
                ", levelTwo=" + levelTwo +
                ", materialInfo='" + materialInfo + '\'' +
                '}';
    }


    public boolean isEmptyUpdate(){
        if(id == null || materialName == null || materialUnit == null || "".equals(materialUnit)
                || levelOne == null || "".equals(levelOne) || levelTwo == null || "".equals(levelTwo)){
            return true;
        }else
            return false;
    }
}
