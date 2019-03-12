package com.caiqian.Bean;

import java.util.Date;

public class MaterialInfo {
    private Integer id;

    private String materialName;

    private Integer materialQuantity;

    private String materialUnit;

    private String materialInfo;

    private MaterialCategory categoryLevel1;

    private MaterialCategory categoryLevel2;

    private Integer categoryLevel3;

    private Integer createBy;

    private Date createDate;

    private Integer modifyBy;

    private Date modifyDate;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getMaterialName() {
        return materialName;
    }

    public void setMaterialName(String materialName) {
        this.materialName = materialName == null ? null : materialName.trim();
    }

    public Integer getMaterialQuantity() {
        return materialQuantity;
    }

    public void setMaterialQuantity(Integer materialQuantity) {
        this.materialQuantity = materialQuantity;
    }

    public String getMaterialUnit() {
        return materialUnit;
    }

    public void setMaterialUnit(String materialUnit) {
        this.materialUnit = materialUnit == null ? null : materialUnit.trim();
    }

    public String getMaterialInfo() {
        return materialInfo;
    }

    public void setMaterialInfo(String materialInfo) {
        this.materialInfo = materialInfo == null ? null : materialInfo.trim();
    }

    public MaterialCategory getCategoryLevel1()
    {
        return categoryLevel1;
    }

    public void setCategoryLevel1(MaterialCategory categoryLevel1)
    {
        this.categoryLevel1 = categoryLevel1;
    }

    public MaterialCategory getCategoryLevel2()
    {
        return categoryLevel2;
    }

    public void setCategoryLevel2(MaterialCategory categoryLevel2)
    {
        this.categoryLevel2 = categoryLevel2;
    }

    public Integer getCategoryLevel3() {
        return categoryLevel3;
    }

    public void setCategoryLevel3(Integer categoryLevel3) {
        this.categoryLevel3 = categoryLevel3;
    }

    public Integer getCreateBy() {
        return createBy;
    }

    public void setCreateBy(Integer createBy) {
        this.createBy = createBy;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Integer getModifyBy() {
        return modifyBy;
    }

    public void setModifyBy(Integer modifyBy) {
        this.modifyBy = modifyBy;
    }

    public Date getModifyDate() {
        return modifyDate;
    }

    public void setModifyDate(Date modifyDate) {
        this.modifyDate = modifyDate;
    }

    public boolean isEmptyADD(){
        if(materialName == null || "".equals(materialName) || materialUnit == null || "".equals(materialUnit)
                || categoryLevel1 == null || categoryLevel2 == null)
            return true;
        else
            return false;
    }

    @Override
    public String toString()
    {
        return "MaterialInfo{" +
                "id=" + id +
                ", materialName='" + materialName + '\'' +
                ", materialQuantity=" + materialQuantity +
                ", materialUnit='" + materialUnit + '\'' +
                ", materialInfo='" + materialInfo + '\'' +
                ", categoryLevel1=" + categoryLevel1 +
                ", categoryLevel2=" + categoryLevel2 +
                ", categoryLevel3=" + categoryLevel3 +
                ", createBy=" + createBy +
                ", createDate=" + createDate +
                ", modifyBy=" + modifyBy +
                ", modifyDate=" + modifyDate +
                '}';
    }
}