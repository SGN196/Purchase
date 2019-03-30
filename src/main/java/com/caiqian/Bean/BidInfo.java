package com.caiqian.Bean;

import java.sql.Date;

public class BidInfo {
    private Integer id;

    private Integer quoteId;

    private Double bidTotalPrice;

    private Integer bidStatus;

    private Date timeDeliver;

    private String tempTime;

    private Integer createBy;

    private String customerName;

    private Date createDate;

    private Integer modifyBy;

    private Date modifyDate;

    private Integer pageNum = 1;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getQuoteId() {
        return quoteId;
    }

    public void setQuoteId(Integer quoteId) {
        this.quoteId = quoteId;
    }

    public Double getBidTotalPrice() {
        return bidTotalPrice;
    }

    public void setBidTotalPrice(Double bidTotalPrice) {
        this.bidTotalPrice = bidTotalPrice;
    }

    public Integer getBidStatus() {
        return bidStatus;
    }

    public void setBidStatus(Integer bidStatus) {
        this.bidStatus = bidStatus;
    }

    public Date getTimeDeliver() {
        return timeDeliver;
    }

    public void setTimeDeliver(Date timeDeliver) {
        this.timeDeliver = timeDeliver;
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

    public String getTempTime()
    {
        return tempTime;
    }

    public void setTempTime(String tempTime)
    {
        this.tempTime = tempTime;
    }

    public Integer getPageNum()
    {
        return pageNum;
    }

    public void setPageNum(Integer pageNum)
    {
        this.pageNum = pageNum;
    }


    public String getCustomerName()
    {
        return customerName;
    }

    public void setCustomerName(String customerName)
    {
        this.customerName = customerName;
    }

    @Override
    public String toString()
    {
        return "BidInfo{" +
                "id=" + id +
                ", quoteId=" + quoteId +
                ", bidTotalPrice=" + bidTotalPrice +
                ", bidStatus=" + bidStatus +
                ", timeDeliver=" + timeDeliver +
                ", tempTime='" + tempTime + '\'' +
                ", createBy=" + createBy +
                ", customerName='" + customerName + '\'' +
                ", createDate=" + createDate +
                ", modifyBy=" + modifyBy +
                ", modifyDate=" + modifyDate +
                ", pageNum=" + pageNum +
                '}';
    }

    public boolean isAddEmpty(){
        if(quoteId == null || tempTime == null || "".equals(tempTime) || bidTotalPrice == null){
            return true;
        }
        return false;
    }
}