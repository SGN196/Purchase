package com.caiqian.Service;

import com.caiqian.Bean.OrderForm;
import com.github.pagehelper.PageInfo;

/**
 * @author SGN196
 * @date 2019/3/21 13:38
 */

public interface OrderFormService
{
    PageInfo<OrderForm> queryByPOJO(OrderForm orderForm);
}
