package com.caiqian.mapper;

import com.caiqian.Bean.MaterialRecord;

public interface MaterialRecordMapper {
    int insert(MaterialRecord record);

    int insertSelective(MaterialRecord record);
}