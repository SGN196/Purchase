package com.caiqian.Controller;

import com.caiqian.Bean.CustomerInfo;
import com.caiqian.Bean.UserInfo;
import com.caiqian.Service.CustomerService;
import com.caiqian.Service.EmployeeService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
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

    @Autowired
    EmployeeService employeeService;


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

        customerInfo = customerService.login(customerInfo);
        if(customerInfo == null){
            model.addAttribute("errMsg", "用户名或密码错误");
            return "emp/login";
        }


        httpSession.setAttribute("customerInfo", customerInfo);
        return "customer/login/indexCustomer";
    }

    @RequestMapping("/customerRegister")
    public String customerRegister(CustomerInfo customerInfo){
        System.out.println(customerInfo.toString());
        return null;

    }

    @RequestMapping("/logout")
    public String logout(HttpSession httpSession){

        httpSession.removeAttribute("customerInfo");
        httpSession.invalidate();
        return "customer/login/login";
    }


    @RequestMapping("/AcountStart/{id}")
    public String AcountStart(@PathVariable("id")Integer id, Model model, HttpSession httpSession, CustomerInfo customerInfo){
        UserInfo userInfo = (UserInfo)httpSession.getAttribute("userInfo");
        if(userInfo == null)
        {
            return "emp/login";
        }
        boolean isRoot = employeeService.isRoot(userInfo);
        if(!isRoot){
            return "emp/index";
        }
        boolean flag  = customerService.acountStart(id);

        PageInfo<CustomerInfo> pageInfo = customerService.queryAll(customerInfo);
        model.addAttribute("page", pageInfo);
        model.addAttribute("customerInfo",customerInfo);

        return "root/customerAcount";
    }
    @RequestMapping("/AcountStop/{id}")
    public String AcountStop(@PathVariable("id")Integer id, Model model, HttpSession httpSession, CustomerInfo customerInfo){
        UserInfo userInfo = (UserInfo)httpSession.getAttribute("userInfo");
        if(userInfo == null)
        {
            return "emp/login";
        }
        boolean isRoot = employeeService.isRoot(userInfo);
        if(!isRoot){
            return "emp/index";
        }
        boolean flag  = customerService.acountStop(id);

        PageInfo<CustomerInfo> pageInfo = customerService.queryAll(customerInfo);
        model.addAttribute("page", pageInfo);
        model.addAttribute("customerInfo",customerInfo);
        return "root/customerAcount";
    }
}