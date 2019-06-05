package com.caiqian.mapper;

import com.caiqian.Bean.MaterialRecord;
import com.caiqian.DTO.RecordDTO;
import org.apache.ibatis.annotations.Param;

import java.util.ArrayList;
import java.sql.Date;
import java.util.List;

public interface MaterialRecordMapper {

    boolean addNewRecord(MaterialRecord materialRecord);

    ArrayList<MaterialRecord> queryByUserId(Integer id);


    boolean deleteById(Integer id);

    Integer queryUserIdByRecordId(Integer id);

    ArrayList<MaterialRecord> queryAll();

    boolean approveRecord(@Param("status") Integer status, @Param("userId")Integer userId, @Param("date")Date date, @Param("id")Integer id);

    boolean disApproveRecord(Integer status, Integer userId, Date date, Integer id);

    MaterialRecord queryByRecordId(Integer id);

    ArrayList<RecordDTO> queryAllIORecord();

    ArrayList<RecordDTO> queryIORecord(RecordDTO recordDTO);

    List<MaterialRecord> queryByMaterialId(@Param("MaterialId") Integer MaterialId);

    List<MaterialRecord> queryRecordByMaterialIdAndWeeK(@Param("MaterialId")Integer id, @Param("day")Integer day);
}