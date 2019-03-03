package com.caiqian.mapper;

import com.caiqian.Bean.CustomerInfo;

public interface CustomerInfoMapper {
    int insert(CustomerInfo record);

    int insertSelective(CustomerInfo record);
}