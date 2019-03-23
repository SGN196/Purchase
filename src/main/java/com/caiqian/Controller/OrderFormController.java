package com.caiqian.Controller;

import com.caiqian.Bean.CustomerInfo;
import com.caiqian.Bean.MaterialInfo;
import com.caiqian.Bean.OrderForm;
import com.caiqian.Bean.UserInfo;
import com.caiqian.Service.OrderFormService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

/**
 * @author SGN196
 * @date 2019/3/21 13:27
 */

@RequestMapping("/order")
@Controller
public class OrderFormController
{

    @Autowired
    OrderFormService orderFormService;


    @RequestMapping("/toOrderFromList")
    public String toOrderFromList(HttpSession httpSession, Model model, OrderForm orderForm){
        UserInfo userInfo = (UserInfo)httpSession.getAttribute("userInfo");
        if(userInfo == null)
        {
            return "emp/login";
        }

        PageInfo<OrderForm> pageInfo = orderFormService.queryByPOJO(orderForm);
        model.addAttribute("page", pageInfo);
        model.addAttribute("orderForm", orderForm);
        return "order/orderFormList";
    }

    @RequestMapping("/toRepoByOrder")
    public String toRepoByOrder(HttpSession httpSession, Model model, OrderForm orderForm){
        UserInfo userInfo = (UserInfo)httpSession.getAttribute("userInfo");
        if(userInfo == null)
        {
            return "emp/login";
        }
        if(orderForm.getOrderStatus() == null)
            orderForm.setOrderStatus(0);
        PageInfo<OrderForm> pageInfo = orderFormService.queryByPOJO(orderForm);
        model.addAttribute("page", pageInfo);
        model.addAttribute("orderForm", orderForm);
        return "repo/RepoByOrder";
    }

    @RequestMapping("/toMyOrderList")
    public String toMyOrderList(HttpSession httpSession, Model model, OrderForm orderForm){
        CustomerInfo customerInfo = (CustomerInfo)httpSession.getAttribute("customerInfo");
        if(customerInfo == null){
            return "customer/login/login";
        }
        orderForm.setCustomerId(customerInfo.getId());
        PageInfo<OrderForm> pageInfo = orderFormService.queryByPOJO(orderForm);
        model.addAttribute("page", pageInfo);
        model.addAttribute("orderForm", orderForm);
        return "customer/bid/customerOrderFormList";

    }




}
