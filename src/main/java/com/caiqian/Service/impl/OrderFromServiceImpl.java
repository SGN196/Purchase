package com.caiqian.Service.impl;

import com.caiqian.Bean.MaterialInfo;
import com.caiqian.Bean.OrderForm;
import com.caiqian.Service.OrderFormService;
import com.caiqian.constant.CommonCodeConstant;
import com.caiqian.mapper.OrderFormMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

/**
 * @author SGN196
 * @date 2019/3/21 13:36
 */

@Service
public class OrderFromServiceImpl implements OrderFormService
{

    @Autowired
    OrderFormMapper orderFormMapper;

    @Override
    public PageInfo<OrderForm> queryByPOJO(OrderForm orderForm)
    {
        PageHelper.startPage(orderForm.getPageNum(), CommonCodeConstant.PAGE_SIZE);
        ArrayList<OrderForm> list =  orderFormMapper.queryByPOJO(orderForm);
        PageInfo<OrderForm> page = new PageInfo<>(list);
        return page;
    }
}
