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
import com.caiqian.mapper.MaterialInfoMapper;
import com.caiqian.mapper.MaterialRecordMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

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

    @Autowired
    MaterialInfoMapper materialInfoMapper;



    @Override
    public int[][] queryByMaterialId(Integer id, Integer day)
    {

        List<MaterialRecord> records = materialRecordMapper.queryRecordByMaterialIdAndWeeK(id, day);
        MaterialInfo materialInfo = materialInfoMapper.queryMaterialById(id);

        int[][] nums = new int[3][7];   //入库、出库、库存


        //得到日期
        java.util.Date[] dates = new java.util.Date[7];
        Calendar cal = Calendar.getInstance();
        dates[6] = cal.getTime();
        for (int i = 5; i >= 0; i--) {
            cal.add(Calendar.DATE, -7);
            dates[i] = cal.getTime();
        }

        //遍历进出库记录
        for(MaterialRecord record : records){
            java.util.Date tempDate = new java.util.Date(record.getCreateDate().getTime());
            //不在统计时间范围
            if(dates[0].compareTo(tempDate) > 0){
                continue;
            }

            //在统计时间范围内，根据时间记录统计
            for (int i = 1; i < dates.length; i++)
            {
                //判断记录的时间段
                if(dates[i].compareTo(tempDate) > 0 || i == dates.length){
                    //入库记录
                    if(record.getRecordStatus() == 66)
                        nums[0][i] += record.getMaterialNum();
                    //出库记录
                    if(record.getRecordStatus() == 1)
                        nums[1][i] += record.getMaterialNum();
                    break;
                }
            }
            /**
             *    根据时间计算数据
             *    相等则返回0,date在date1之后1,否则返回0
             *    System.out.println(date.compareTo(date1));
             */

        }
        //得到最后记录，根据进出库记录，反推各个时间的库存情况
        nums[2][6] = materialInfo.getMaterialQuantity();
        for (int i = 5; i >= 0; i--)
        {
            nums[2][i] = nums[2][i + 1] - nums[0][i + 1] + nums[1][i + 1];
        }

        /**


         * 日期之间的相互转换
         *   java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
         *
         *   java.sql.Date sqlDate = new java.sql.Date(new Date().getTime());
         *   Date utilDate = new Date(sqlDate.getTime());
         */



        return nums;
    }

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

    @Transactional
    @Override
    public boolean approveRecord(Integer id, Integer userId, Integer remainQuantity)
    {
        Date date = new Date(System.currentTimeMillis());
        Integer status = 1;
        MaterialRecord materialRecord = materialRecordMapper.queryByRecordId(id);
        Boolean flag = materialInfoMapper.approveRecord(materialRecord.getMaterialId(), remainQuantity);
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
