package com.caiqian.Bean;

import java.util.Date;

public class OrderForm {
    private Integer quoteId;

    private Integer bidId;

    private Integer customerId;

    private Double bidTotalPrice;

    private Integer orderStatus;

    private Date timePurchase;

    private Date timeDeliver;

    private Integer createBy;

    private Date createDate;

    private Integer modifyBy;

    private Date modifyDate;

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

    public Date getTimePurchase() {
        return timePurchase;
    }

    public void setTimePurchase(Date timePurchase) {
        this.timePurchase = timePurchase;
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
}