package com.caiqian.mapper;

import com.caiqian.Bean.BidInfo;

public interface BidInfoMapper {
    int insert(BidInfo record);

    int insertSelective(BidInfo record);
}