package com.caiqian.Controller;

import com.caiqian.Bean.CustomerInfo;
import com.caiqian.Service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

/**
 * @author SGN196
 * @date 2019/3/3 14:10
 */

@Controller
@RequestMapping("/customer")
public class CustomerController
{

    @Autowired
    CustomerService customerService;


    @RequestMapping("/toLogin")
    public String toLogin(){
        return "customer/login/login";
    }

    @RequestMapping("/toRegister")
    public String toRegister(){
        return "customer/login/register";
    }

    @RequestMapping("/login")
    public String login(CustomerInfo customerInfo, Model model, HttpSession httpSession){
        System.out.println(customerInfo);
        customerInfo = customerService.login(customerInfo);
        if(customerInfo == null){
            model.addAttribute("errMsg", "用户名或密码错误");
            return "emp/login";
        }


        httpSession.setAttribute("customerInfo", customerInfo);
        return "customer/login/indexCustomer";
    }

    @RequestMapping("/logout")
    public String logout(HttpSession httpSession){

        httpSession.removeAttribute("customerInfo");
        httpSession.invalidate();
        return "customer/login/login";
    }
}