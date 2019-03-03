package com.caiqian.mapper;

import com.caiqian.Bean.OrderForm;

public interface OrderFormMapper {
    int insert(OrderForm record);

    int insertSelective(OrderForm record);
}