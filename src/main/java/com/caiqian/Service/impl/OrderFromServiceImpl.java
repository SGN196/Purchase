package com.caiqian.Service.impl;

import com.caiqian.Bean.*;
import com.caiqian.Service.OrderFormService;
import com.caiqian.constant.CommonCodeConstant;
import com.caiqian.mapper.*;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

/**
 * @author SGN196
 * @date 2019/3/21 13:36
 */

@Service
public class OrderFromServiceImpl implements OrderFormService
{

    @Autowired
    OrderFormMapper orderFormMapper;

    @Autowired
    BidInfoMapper bidInfoMapper;

    @Autowired
    QuoteInfoMapper quoteInfoMapper;

    @Autowired
    MaterialInfoMapper materialInfoMapper;

    @Autowired
    DataDictionaryMapper dataDictionaryMapper;

    @Autowired
    MaterialRecordMapper materialRecordMapper;

    @Override
    public OrderForm queryOrderById(Integer id)
    {
        return orderFormMapper.queryOrderById(id);

    }

    @Override
    public boolean isAccessAuthorityRecordOfEmployee(Integer deptId)
    {
        ArrayList<Integer> arrayList = dataDictionaryMapper.isAccessAuthorityRecordOfEmployee();
        if(arrayList.contains(deptId)){
            return true;
        }
        return false;
    }

    @Override
    @Transactional
    public boolean OrderInRepo(Integer id)
    {
        OrderForm orderForm = orderFormMapper.queryOrderById(id);
        QuoteInfo quoteInfo = quoteInfoMapper.queryQuoteById(orderForm.getQuoteId());
        boolean bid = bidInfoMapper.success(orderForm.getBidId());
        boolean quote = quoteInfoMapper.success(orderForm.getQuoteId());
        Integer number = quoteInfoMapper.queryQuantityById(orderForm.getQuoteId());
        Integer repoNumber = materialInfoMapper.queryQuantityByMaterialId(quoteInfo.getMaterialId());
        boolean addNum = materialInfoMapper.addMaterialQuantity(number + repoNumber, quoteInfo.getMaterialId(), new Date(System.currentTimeMillis()));

        MaterialRecord materialRecord = new MaterialRecord(quoteInfo.getMaterialId(),number, orderForm.getCreateBy(), 66, orderForm.getCreateBy(), orderForm.getCreateBy(), new Date(new java.util.Date().getTime()));
        boolean addRecord = materialRecordMapper.addNewRecord(materialRecord);
        boolean order = orderFormMapper.success(id);
        if(bid && quote && addNum)
            return true;
        else
            return false;
    }

    @Override
    public Boolean cancelById(Integer id)
    {
        return orderFormMapper.cancelById(id);
    }

    @Override
    public PageInfo<OrderForm> queryByPOJO(OrderForm orderForm)
    {
        PageHelper.startPage(orderForm.getPageNum(), CommonCodeConstant.PAGE_SIZE);
        ArrayList<OrderForm> list =  orderFormMapper.queryByPOJO(orderForm);
        PageInfo<OrderForm> page = new PageInfo<>(list);
        return page;
    }

    @Override
    public PageInfo<OrderForm> queryAll(OrderForm orderForm)
    {
        PageHelper.startPage(orderForm.getPageNum(), CommonCodeConstant.PAGE_SIZE);
        List<OrderForm> list =  orderFormMapper.queryAll();
        PageInfo<OrderForm> page = new PageInfo<>(list);
        return page;
    }
}
