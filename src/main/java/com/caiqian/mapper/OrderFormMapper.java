package com.caiqian.mapper;

import com.caiqian.Bean.OrderForm;
import com.github.pagehelper.PageInfo;

import java.util.ArrayList;

public interface OrderFormMapper {

    ArrayList<OrderForm> queryByPOJO(OrderForm orderForm);
}