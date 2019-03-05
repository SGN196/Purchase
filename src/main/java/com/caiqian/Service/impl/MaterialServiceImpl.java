package com.caiqian.Service.impl;

import com.caiqian.Bean.DataDictionary;
import com.caiqian.Bean.MaterialCategory;
import com.caiqian.Bean.MaterialInfo;
import com.caiqian.DTO.MaterialInfoDTO;
import com.caiqian.Service.MaterialService;
import com.caiqian.constant.CommonCodeConstant;
import com.caiqian.mapper.DataDictionaryMapper;
import com.caiqian.mapper.MaterialCategoryMapper;
import com.caiqian.mapper.MaterialInfoMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.List;

/**
 * @author SGN196
 * @date 2019/3/4 19:03
 */

@Service
public class MaterialServiceImpl implements MaterialService
{
    @Autowired
    DataDictionaryMapper dataDictionaryMapper;


    @Autowired
    MaterialInfoMapper materialInfoMapper;

    @Autowired
    MaterialCategoryMapper materialCategoryMapper;

    @Override
    public boolean isAccessAuthorityRepertoryOfEmployee(Integer id)
    {
        ArrayList<Integer> arrayList = dataDictionaryMapper.isAccessAuthorityRepertoryListOfEmployee();
        if(arrayList.contains(id)){
            return true;
        }
        return false;
    }


    @Override
    public PageInfo<MaterialInfo> query(MaterialInfoDTO materialInfoDTO)
    {
        PageHelper.startPage(1, CommonCodeConstant.PAGE_SIZE);
        ArrayList<MaterialInfo> list =  materialInfoMapper.queryAll(materialInfoDTO);
        PageInfo<MaterialInfo> page = new PageInfo<>(list);
        return page;
    }

    @Override
    public List<MaterialCategory> queryLevelTwoByLevelOne(Integer id)
    {
        return materialCategoryMapper.queryLevelTwoByLevelOne(id);
    }

    @Override
    public List<MaterialCategory> queryLevelOne()
    {
        return materialCategoryMapper.queryLevelOne();
    }
}
