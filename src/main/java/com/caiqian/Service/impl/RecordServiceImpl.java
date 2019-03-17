package com.caiqian.Service.impl;

import com.caiqian.Bean.DataDictionary;
import com.caiqian.Bean.MaterialInfo;
import com.caiqian.Bean.MaterialRecord;
import com.caiqian.DTO.PageDTO;
import com.caiqian.DTO.RecordDTO;
import com.caiqian.Service.MaterialService;
import com.caiqian.Service.RecordService;
import com.caiqian.constant.CommonCodeConstant;
import com.caiqian.mapper.DataDictionaryMapper;
import com.caiqian.mapper.MaterialRecordMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.util.ArrayList;

/**
 * @author SGN196
 * @date 2019/3/13 22:44
 */

@Service
public class RecordServiceImpl implements RecordService
{
    @Autowired
    MaterialRecordMapper materialRecordMapper;

    @Autowired
    DataDictionaryMapper dataDictionaryMapper;

    @Override
    public boolean addNewRecord(MaterialRecord materialRecord)
    {
        return materialRecordMapper.addNewRecord(materialRecord);
    }

    @Override
    public MaterialRecord queryByRecordId(Integer id)
    {
        return materialRecordMapper.queryByRecordId(id);
    }

    @Override
    public boolean deleteById(Integer id)
    {
        return materialRecordMapper.deleteById(id);
    }



    @Override
    public PageInfo<MaterialRecord> queryById(Integer id, PageDTO pageDTO)
    {
        PageHelper.startPage(pageDTO.getPageNum(), CommonCodeConstant.PAGE_SIZE);
        ArrayList<MaterialRecord> list = materialRecordMapper.queryByUserId(id);
        PageInfo<MaterialRecord> page = new PageInfo<>(list);
        return page;
    }

    @Override
    public boolean approveRecord(Integer id, Integer userId)
    {
        Date date = new Date(System.currentTimeMillis());
        Integer status = 1;
        return materialRecordMapper.approveRecord(status, userId, date, id);
    }

    @Override
    public boolean disApproveRecord(Integer id, Integer userId)
    {
        Date date = new Date(System.currentTimeMillis());
        Integer status = 2;
        return materialRecordMapper.disApproveRecord(status, userId, date, id);
    }


    //可以不使用
    @Override
    public PageInfo<RecordDTO> queryAllIORecord()
    {
        PageHelper.startPage(1, CommonCodeConstant.PAGE_SIZE);
        ArrayList<RecordDTO> list =  materialRecordMapper.queryAllIORecord();
        PageInfo<RecordDTO> page = new PageInfo<>(list);
        return page;
    }

    @Override
    public PageInfo<RecordDTO> queryIORecord(RecordDTO recordDTO)
    {
        PageHelper.startPage(1, CommonCodeConstant.PAGE_SIZE);
        ArrayList<RecordDTO> list =  materialRecordMapper.queryIORecord(recordDTO);
        PageInfo<RecordDTO> page = new PageInfo<>(list);
        return page;
    }

    @Override
    public PageInfo<MaterialRecord> queryAll(PageDTO pageDTO)
    {
        PageHelper.startPage(pageDTO.getPageNum(), CommonCodeConstant.PAGE_SIZE);
        ArrayList<MaterialRecord> list = materialRecordMapper.queryAll();
        PageInfo<MaterialRecord> page = new PageInfo<>(list);
        return page;
    }

    @Override
    public boolean isAccessAuthorityRecordOfEmployee(Integer id)
    {
        ArrayList<Integer> arrayList = dataDictionaryMapper.isAccessAuthorityRecordOfEmployee();
        if(arrayList.contains(id)){
            return true;
        }
        return false;
    }

    @Override
    public Integer queryUserIdByRecordId(Integer id)
    {
        return materialRecordMapper.queryUserIdByRecordId(id);
    }


}
