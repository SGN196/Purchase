package com.caiqian.Controller;

import com.alibaba.fastjson.JSON;
import com.caiqian.Bean.UserInfo;
import com.caiqian.Service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

/**
 * @author SGN196
 * @date 2019/3/3 14:10
 *
 * 因为企业中人员较固定，所以不提供注册功能。
 *
 *
 *
 *
 */


@Controller
@RequestMapping("/employee")
public class EmployeeController
{
    @Autowired
    private EmployeeService employeeService;


    @RequestMapping("/toIndex")
    public  String toIndex(HttpSession httpSession){
        UserInfo userInfo = (UserInfo)httpSession.getAttribute("userInfo");
        if(userInfo == null){
            return "emp/login";
        }
        return "emp/index";
    }

    @RequestMapping("/toLogin")
    public String toLogin()
    {
        return "emp/login";
    }


    @RequestMapping("/login")
    public String login(UserInfo userInfo, Model model, HttpSession httpSession){
        userInfo = employeeService.login(userInfo);
        if(userInfo == null){
            model.addAttribute("errMsg", "用户名或密码错误");
            return "emp/login";
        }
        String deptName = employeeService.queryEmployeeDept(userInfo.getDeptId());
        httpSession.setAttribute("deptName", deptName);
        httpSession.setAttribute("userInfo", userInfo);
        String str = JSON.toJSONString(userInfo);
        httpSession.setAttribute("str", str);
        return "emp/index";
    }

    @RequestMapping("/logout")
    public String logout(HttpSession httpSession){

        httpSession.removeAttribute("userInfo");
        httpSession.invalidate();
        return "emp/login";
    }



}
