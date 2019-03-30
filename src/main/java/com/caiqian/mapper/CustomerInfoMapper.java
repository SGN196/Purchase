package com.caiqian.mapper;

import com.caiqian.Bean.CustomerInfo;

import java.util.ArrayList;

public interface CustomerInfoMapper {


    CustomerInfo queryByNamePwd(CustomerInfo customerInfo);

    ArrayList<CustomerInfo> queryAll(CustomerInfo customerInfo);
}