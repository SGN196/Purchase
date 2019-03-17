package com.caiqian.Bean;

import java.util.Date;

public class MaterialRecord {
    private Integer id;

    private Integer materialId;

    private String materialName;

    private Integer materialNum;

    private Integer userId;

    private String useReason;

    private String refuseReason;

    private Integer recordStatus;

    private Integer managerId;

    private Integer createBy;

    private Date createDate;

    private Integer modifyBy;

    private Date modifyDate;

    private Integer pageNum = 1;

    public Integer getPageNum()
    {
        return pageNum;
    }

    public void setPageNum(Integer pageNum)
    {
        this.pageNum = pageNum;
    }


    public String getRefuseReason()
    {
        return refuseReason;
    }

    public void setRefuseReason(String refuseReason)
    {
        this.refuseReason = refuseReason;
    }

    public String getMaterialName()
    {
        return materialName;
    }

    public void setMaterialName(String materialName)
    {
        this.materialName = materialName;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getMaterialId() {
        return materialId;
    }

    public void setMaterialId(Integer materialId) {
        this.materialId = materialId;
    }

    public Integer getMaterialNum() {
        return materialNum;
    }

    public void setMaterialNum(Integer materialNum) {
        this.materialNum = materialNum;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUseReason() {
        return useReason;
    }

    public void setUseReason(String useReason) {
        this.useReason = useReason == null ? null : useReason.trim();
    }

    public Integer getRecordStatus() {
        return recordStatus;
    }

    public void setRecordStatus(Integer recordStatus) {
        this.recordStatus = recordStatus;
    }

    public Integer getManagerId() {
        return managerId;
    }

    public void setManagerId(Integer managerId) {
        this.managerId = managerId;
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

    public boolean isAddEmpty(){
        if(materialId == null || userId == null || materialNum == null )
            return true;
        else
            return false;

    }

    @Override
    public String toString()
    {
        return "MaterialRecord{" +
                "id=" + id +
                ", materialId=" + materialId +
                ", materialName='" + materialName + '\'' +
                ", materialNum=" + materialNum +
                ", userId=" + userId +
                ", useReason='" + useReason + '\'' +
                ", refuseReason='" + refuseReason + '\'' +
                ", recordStatus=" + recordStatus +
                ", managerId=" + managerId +
                ", createBy=" + createBy +
                ", createDate=" + createDate +
                ", modifyBy=" + modifyBy +
                ", modifyDate=" + modifyDate +
                ", pageNum=" + pageNum +
                '}';
    }
}