package com.caiqian.Controller;

import com.alibaba.fastjson.JSON;
import com.caiqian.Bean.MaterialRecord;
import com.caiqian.Bean.UserInfo;
import com.caiqian.DTO.PageDTO;
import com.caiqian.Service.EmployeeService;
import com.caiqian.Service.RecordService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

/**
 * @author SGN196
 * @date 2019/3/3 14:10
 *
 * 因为企业中人员较固定，所以不提供注册功能。
 *
 */


@Controller
@RequestMapping("/employee")
public class EmployeeController
{
    @Autowired
    private EmployeeService employeeService;


    @Autowired
    private RecordService recordService;


    @RequestMapping("/AcountStart/{id}")
    public String AcountStart(@PathVariable("id")Integer id, Model model, HttpSession httpSession){
        UserInfo userInfo = (UserInfo)httpSession.getAttribute("userInfo");
        if(userInfo == null)
        {
            return "emp/login";
        }
        boolean isRoot = employeeService.isRoot(userInfo);
        if(!isRoot){
            return "emp/index";
        }
        boolean flag  = employeeService.acountStart(id);

        UserInfo userInfoQuery = new UserInfo();
        PageInfo<UserInfo> pageInfo = employeeService.queryAll(userInfoQuery);
        model.addAttribute("page", pageInfo);
        model.addAttribute("userInfoQuery",userInfoQuery);
        return "root/empAcount";
    }
    @RequestMapping("/AcountStop/{id}")
    public String AcountStop(@PathVariable("id")Integer id, Model model, HttpSession httpSession){
        UserInfo userInfo = (UserInfo)httpSession.getAttribute("userInfo");
        if(userInfo == null)
        {
            return "emp/login";
        }
        boolean isRoot = employeeService.isRoot(userInfo);
        if(!isRoot){
            return "emp/index";
        }
        boolean flag  = employeeService.acountStop(id);

        UserInfo userInfoQuery = new UserInfo();
        PageInfo<UserInfo> pageInfo = employeeService.queryAll(userInfoQuery);
        model.addAttribute("page", pageInfo);
        model.addAttribute("userInfoQuery",userInfoQuery);
        return "root/empAcount";
    }

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

        PageInfo<MaterialRecord> pageInfo = recordService.queryById(userInfo.getId(), new PageDTO());
        model.addAttribute("page", pageInfo);

        return "repo/myApplyList";
    }

    @RequestMapping("/logout")
    public String logout(HttpSession httpSession){

        httpSession.removeAttribute("userInfo");
        httpSession.invalidate();
        return "emp/login";
    }



}
