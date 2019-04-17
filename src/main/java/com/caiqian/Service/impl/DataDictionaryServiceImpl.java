package com.caiqian.Service.impl;

import com.caiqian.Bean.DataDictionary;
import com.caiqian.Service.DataDictionaryService;
import com.caiqian.mapper.DataDictionaryMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author SGN196
 * @date 2019/4/5 22:45
 */

@Service
public class DataDictionaryServiceImpl implements DataDictionaryService
{

    @Autowired
    DataDictionaryMapper dataDictionaryMapper;

    @Override
    public List<DataDictionary> queryDeptName()
    {
        return dataDictionaryMapper.queryDeptName();
    }
}
