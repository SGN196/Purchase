package com.caiqian.Service.impl;

import com.caiqian.Bean.CustomerInfo;
import com.caiqian.Bean.UserInfo;
import com.caiqian.Service.CustomerService;
import com.caiqian.constant.CommonCodeConstant;
import com.caiqian.mapper.CustomerInfoMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

/**
 * @author SGN196
 * @date 2019/3/17 10:46
 */

@Service
public class CustomerServiceImpl implements CustomerService
{
    @Autowired
    CustomerInfoMapper customerInfoMapper;

    @Override
    public CustomerInfo login(CustomerInfo customerInfo)
    {
        customerInfo = customerInfoMapper.queryByNamePwd(customerInfo);


        if(customerInfo != null && customerInfo.getIsUse() == 1){
            return customerInfo;
        }else{
            return null;
        }
    }

    @Override
    public PageInfo<CustomerInfo> queryAll(CustomerInfo customerInfo)
    {
        PageHelper.startPage(customerInfo.getPageNum(), CommonCodeConstant.PAGE_SIZE);
        ArrayList<CustomerInfo> list =  customerInfoMapper.queryAll(customerInfo);
        PageInfo<CustomerInfo> page = new PageInfo<>(list);
        return page;
    }
}
