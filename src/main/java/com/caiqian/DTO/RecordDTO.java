package com.caiqian.DTO;

import java.util.Date;

/**
 * @author SGN196
 * @date 2019/3/16 21:51
 */

public class RecordDTO
{
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

    public Integer getManagerId()
    {
        return managerId;
    }

    private String userName;

    public void setManagerId(Integer managerId)
    {
        this.managerId = managerId;
    }

    public String getUserName()
    {
        return userName;
    }

    public void setUserName(String userName)
    {
        this.userName = userName;
    }

    public Integer getId()
    {
        return id;
    }

    public void setId(Integer id)
    {
        this.id = id;
    }

    public Integer getMaterialId()
    {
        return materialId;
    }

    public void setMaterialId(Integer materialId)
    {
        this.materialId = materialId;
    }

    public String getMaterialName()
    {
        return materialName;
    }

    public void setMaterialName(String materialName)
    {
        this.materialName = materialName;
    }

    public Integer getMaterialNum()
    {
        return materialNum;
    }

    public void setMaterialNum(Integer materialNum)
    {
        this.materialNum = materialNum;
    }

    public Integer getUserId()
    {
        return userId;
    }

    public void setUserId(Integer userId)
    {
        this.userId = userId;
    }

    public String getUseReason()
    {
        return useReason;
    }

    public void setUseReason(String useReason)
    {
        this.useReason = useReason;
    }

    public String getRefuseReason()
    {
        return refuseReason;
    }

    public void setRefuseReason(String refuseReason)
    {
        this.refuseReason = refuseReason;
    }

    public Integer getRecordStatus()
    {
        return recordStatus;
    }

    public void setRecordStatus(Integer recordStatus)
    {
        this.recordStatus = recordStatus;
    }

    public Integer getPageNum()
    {
        return pageNum;
    }

    public void setPageNum(Integer pageNum)
    {
        this.pageNum = pageNum;
    }


    public Integer getCreateBy()
    {
        return createBy;
    }

    public void setCreateBy(Integer createBy)
    {
        this.createBy = createBy;
    }

    public Date getCreateDate()
    {
        return createDate;
    }

    public void setCreateDate(Date createDate)
    {
        this.createDate = createDate;
    }

    public Integer getModifyBy()
    {
        return modifyBy;
    }

    public void setModifyBy(Integer modifyBy)
    {
        this.modifyBy = modifyBy;
    }

    public Date getModifyDate()
    {
        return modifyDate;
    }

    public void setModifyDate(Date modifyDate)
    {
        this.modifyDate = modifyDate;
    }

    public RecordDTO()
    {
    }

    public RecordDTO(Integer materialId, Integer materialNum, Integer userId, Integer recordStatus, Integer managerId, Integer createBy, java.sql.Date createDate)
    {
        this.materialId = materialId;
        this.materialNum = materialNum;
        this.userId = userId;
        this.recordStatus = recordStatus;
        this.managerId = managerId;
        this.createBy = createBy;
        this.createDate = createDate;
    }
    @Override
    public String toString()
    {
        return "RecordDTO{" +
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
                ", userName='" + userName + '\'' +
                '}';
    }
}
