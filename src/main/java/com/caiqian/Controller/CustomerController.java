package com.caiqian.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author SGN196
 * @date 2019/3/3 14:10
 */

@Controller
@RequestMapping("/customer")
public class CustomerController
{
    @RequestMapping("/toLogin")
    public String toLogin(){
        return "customer/login/login";
    }

    @RequestMapping("/toRegister")
    public String toRegister(){
        return "customer/login/register";
    }
}