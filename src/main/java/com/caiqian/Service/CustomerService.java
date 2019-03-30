package com.caiqian.Service;

import com.caiqian.Bean.CustomerInfo;
import com.github.pagehelper.PageInfo;

/**
 * @author SGN196
 * @date 2019/3/17 10:46
 */

public interface CustomerService
{
    CustomerInfo login(CustomerInfo customerInfo);

    PageInfo<CustomerInfo> queryAll(CustomerInfo customerInfo);
}
