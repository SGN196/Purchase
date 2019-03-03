package com.caiqian.mapper;

import com.caiqian.Bean.QuoteInfo;

public interface QuoteInfoMapper {
    int insert(QuoteInfo record);

    int insertSelective(QuoteInfo record);
}