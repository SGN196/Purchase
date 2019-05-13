package com.caiqian.Controller;

import com.caiqian.Bean.CustomerInfo;
import com.caiqian.Bean.MaterialInfo;
import com.caiqian.Bean.OrderForm;
import com.caiqian.Bean.UserInfo;
import com.caiqian.Service.OrderFormService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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

    @ResponseBody
    @RequestMapping("/cancelOrderForm/{id}")
    public String cancelOrderForm(@PathVariable("id") Integer id, HttpSession httpSession, Model model){
        UserInfo userInfo = (UserInfo)httpSession.getAttribute("userInfo");
        if(userInfo == null)
        {
            return "emp/login";
        }
        Boolean flag = orderFormService.cancelById(id);
        if(flag){
            return "OK";
        }
        return "false";
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
        if(orderForm.getOrderStatus() == 22){
            orderForm.setOrderStatus(null);
        }
        PageInfo<OrderForm> pageInfo = orderFormService.queryByPOJO(orderForm);
        model.addAttribute("page", pageInfo);
        model.addAttribute("orderForm", orderForm);
        return "repo/RepoByOrder";
    }

    @Transactional
    @RequestMapping("/OrderInRepo/{id}")
    public String OrderInRepo(@PathVariable("id") Integer id, HttpSession httpSession){
        UserInfo userInfo = (UserInfo)httpSession.getAttribute("userInfo");
        if(userInfo == null)
        {
            return "emp/login";
        }
        boolean flag = orderFormService.OrderInRepo(id);
        if(!flag)
        {
            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
            System.out.println("执行失败");
        }
        System.out.println("执行成功");
        return "order/orderFormList";
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
