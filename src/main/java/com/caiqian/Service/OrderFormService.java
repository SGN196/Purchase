package com.caiqian.Service;

import com.caiqian.Bean.OrderForm;
import com.github.pagehelper.PageInfo;

import java.util.List;

/**
 * @author SGN196
 * @date 2019/3/21 13:38
 */

public interface OrderFormService
{
    PageInfo<OrderForm> queryByPOJO(OrderForm orderForm);

    OrderForm queryOrderById(Integer id);

    boolean OrderInRepo(Integer id);


    PageInfo<OrderForm> queryAll(OrderForm orderForm);

    Boolean cancelById(Integer id);

    boolean isAccessAuthorityRecordOfEmployee(Integer deptId);
}
