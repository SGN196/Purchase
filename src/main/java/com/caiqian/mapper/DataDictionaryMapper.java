package com.caiqian.mapper;

import com.caiqian.Bean.DataDictionary;

public interface DataDictionaryMapper {
    int insert(DataDictionary record);

    int insertSelective(DataDictionary record);
}