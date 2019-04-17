package com.caiqian.mapper;

import com.caiqian.Bean.CustomerInfo;
import org.apache.ibatis.annotations.Param;

import java.util.ArrayList;

public interface CustomerInfoMapper {


    CustomerInfo queryByNamePwd(CustomerInfo customerInfo);

    ArrayList<CustomerInfo> queryAll(CustomerInfo customerInfo);

    boolean acountStart(@Param("id") Integer id);

    boolean acountStop(@Param("id") Integer id);
}