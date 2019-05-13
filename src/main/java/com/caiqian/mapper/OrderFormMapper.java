package com.caiqian.mapper;

import com.caiqian.Bean.OrderForm;
import com.github.pagehelper.PageInfo;
import org.apache.ibatis.annotations.Param;

import java.util.ArrayList;
import java.util.List;

public interface OrderFormMapper {

    ArrayList<OrderForm> queryByPOJO(OrderForm orderForm);

    OrderForm queryOrderById(@Param("id") Integer id);

    boolean success(@Param("orderId")Integer orderId);

    Boolean add(OrderForm orderForm);

    List<OrderForm> queryAll();

    Boolean cancelById(@Param("orderId")Integer id);
}