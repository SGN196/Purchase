package com.caiqian.Service;

import com.caiqian.Bean.MaterialInfo;
import com.caiqian.Bean.MaterialRecord;
import com.caiqian.DTO.PageDTO;
import com.caiqian.DTO.RecordDTO;
import com.github.pagehelper.PageInfo;

/**
 * @author SGN196
 * @date 2019/3/13 22:43
 */

public interface RecordService
{
    boolean addNewRecord(MaterialRecord materialRecord);


    boolean deleteById(Integer id);

    Integer queryUserIdByRecordId(Integer id);

    PageInfo<MaterialRecord> queryById(Integer id, PageDTO pageDTO);

    boolean isAccessAuthorityRecordOfEmployee(Integer deptId);

    PageInfo<MaterialRecord> queryAll(PageDTO pageDTO);

    boolean approveRecord(Integer id, Integer userId, Integer requiredQuantity);

    boolean disApproveRecord(Integer id, Integer userId);

    MaterialRecord queryByRecordId(Integer id);

    PageInfo<RecordDTO> queryAllIORecord();

    PageInfo<RecordDTO> queryIORecord(RecordDTO recordDTO);
}
