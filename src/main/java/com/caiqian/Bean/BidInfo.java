package com.caiqian.Bean;

import java.util.Date;

public class BidInfo {
    private Integer id;

    private Integer quoteId;

    private Integer customerId;

    private Double bidTotalPrice;

    private Integer bidStatus;

    private Date timePurchase;

    private Date timeDeliver;

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

    public Integer getQuoteId() {
        return quoteId;
    }

    public void setQuoteId(Integer quoteId) {
        this.quoteId = quoteId;
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

    public Integer getBidStatus() {
        return bidStatus;
    }

    public void setBidStatus(Integer bidStatus) {
        this.bidStatus = bidStatus;
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