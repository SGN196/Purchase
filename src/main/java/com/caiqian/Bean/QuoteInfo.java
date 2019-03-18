package com.caiqian.Bean;

import java.sql.Date;

public class QuoteInfo {
    private Integer id;

    private Integer materialId;

    private String materialName;   //---连接其他表

    private Integer quoteQuantity;  //采购数量

    private Integer quoteStatus;

    private String quoteDesc;

    private Date quoteEndtime;

    private Integer createBy;

    private String userName;    //---连接其他表

    private String tempDate;

    private Date createDate;

    private Integer modifyBy;

    private Date modifyDate;

    private Integer pageNum = 1;


    public boolean isEmptyRequire(){
        if(materialId == null || quoteQuantity == null || quoteEndtime == null){
            return true;
        }
        return  false;
    }


    public String getMaterialName()
    {
        return materialName;
    }

    public void setMaterialName(String materialName)
    {
        this.materialName = materialName;
    }

    public Integer getPageNum()
    {
        return pageNum;
    }

    public void setPageNum(Integer pageNum)
    {
        this.pageNum = pageNum;
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

    public Integer getQuoteQuantity() {
        return quoteQuantity;
    }

    public void setQuoteQuantity(Integer quoteQuantity) {
        this.quoteQuantity = quoteQuantity;
    }

    public Integer getQuoteStatus() {
        return quoteStatus;
    }

    public void setQuoteStatus(Integer quoteStatus) {
        this.quoteStatus = quoteStatus;
    }

    public String getQuoteDesc() {
        return quoteDesc;
    }

    public void setQuoteDesc(String quoteDesc) {
        this.quoteDesc = quoteDesc == null ? null : quoteDesc.trim();
    }

    public Date getQuoteEndtime() {
        return quoteEndtime;
    }

    public void setQuoteEndtime(Date quoteEndtime) {
        this.quoteEndtime = quoteEndtime;
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

    public String getTempDate()
    {
        return tempDate;
    }

    public void setTempDate(String tempDate)
    {
        this.tempDate = tempDate;
    }

    public String getUserName()
    {
        return userName;
    }

    public void setUserName(String userName)
    {
        this.userName = userName;
    }

    @Override
    public String toString()
    {
        return "QuoteInfo{" +
                "id=" + id +
                ", materialId=" + materialId +
                ", materialName='" + materialName + '\'' +
                ", quoteQuantity=" + quoteQuantity +
                ", quoteStatus=" + quoteStatus +
                ", quoteDesc='" + quoteDesc + '\'' +
                ", quoteEndtime=" + quoteEndtime +
                ", createBy=" + createBy +
                ", userName='" + userName + '\'' +
                ", tempDate='" + tempDate + '\'' +
                ", createDate=" + createDate +
                ", modifyBy=" + modifyBy +
                ", modifyDate=" + modifyDate +
                ", pageNum=" + pageNum +
                '}';
    }
}