package com.caiqian.mapper;

import com.caiqian.Bean.CustomerInfo;

public interface CustomerInfoMapper {


    CustomerInfo queryByNamePwd(CustomerInfo customerInfo);
}