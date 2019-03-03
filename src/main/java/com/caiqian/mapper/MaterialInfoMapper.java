package com.caiqian.mapper;

import com.caiqian.Bean.MaterialInfo;

public interface MaterialInfoMapper {
    int insert(MaterialInfo record);

    int insertSelective(MaterialInfo record);
}