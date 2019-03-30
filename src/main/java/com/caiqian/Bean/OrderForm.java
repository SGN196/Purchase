package com.caiqian.Bean;

import java.sql.Date;

public class OrderForm {
    private Integer id;


    private Integer quoteId;

    private Integer bidId;

    private Integer customerId;

//    private String materialName;

    private String customerName;

    private Double bidTotalPrice;

    private Integer orderStatus;

    private String tempTime;

    private Date timeDeliver;

    private Integer createBy;

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

    public Integer getBidId() {
        return bidId;
    }

    public void setBidId(Integer bidId) {
        this.bidId = bidId;
    }

    public Integer getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Integer customerId) {
        this.customerId = customerId;
    }

    public Double getBidTotalPrice() {
        return bidTotalPrice;
    }

    public void setBidTotalPrice(Double bidTotalPrice) {
        this.bidTotalPrice = bidTotalPrice;
    }

    public Integer getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(Integer orderStatus) {
        this.orderStatus = orderStatus;
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

    public String getCustomerName()
    {
        return customerName;
    }

    public void setCustomerName(String customerName)
    {
        this.customerName = customerName;
    }

    public Integer getPageNum()
    {
        return pageNum;
    }

    public void setPageNum(Integer pageNum)
    {
        this.pageNum = pageNum;
    }

    public String getTempTime()
    {
        return tempTime;
    }

    public void setTempTime(String tempTime)
    {
        this.tempTime = tempTime;
    }



    @Override
    public String toString()
    {
        return "OrderForm{" +
                "id=" + id +
                ", quoteId=" + quoteId +
                ", bidId=" + bidId +
                ", customerId=" + customerId +
                ", customerName='" + customerName + '\'' +
                ", bidTotalPrice=" + bidTotalPrice +
                ", orderStatus=" + orderStatus +
                ", tempTime='" + tempTime + '\'' +
                ", timeDeliver=" + timeDeliver +
                ", createBy=" + createBy +
                ", createDate=" + createDate +
                ", modifyBy=" + modifyBy +
                ", modifyDate=" + modifyDate +
                ", pageNum=" + pageNum +
                '}';
    }
}