package com.caiqian.Bean;

import java.util.Date;

public class QuoteInfo {
    private Integer id;

    private Integer quoteId;

    private Integer materialId;

    private String quoteName;

    private Integer quoteQuantity;

    private Integer quoteStatus;

    private String quoteDesc;

    private Date quoteEndtime;

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

    public Integer getMaterialId() {
        return materialId;
    }

    public void setMaterialId(Integer materialId) {
        this.materialId = materialId;
    }

    public String getQuoteName() {
        return quoteName;
    }

    public void setQuoteName(String quoteName) {
        this.quoteName = quoteName == null ? null : quoteName.trim();
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
}