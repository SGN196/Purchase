package com.caiqian.Service.impl;

import com.caiqian.Bean.CustomerInfo;
import com.caiqian.Service.CustomerService;
import com.caiqian.mapper.CustomerInfoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
}
