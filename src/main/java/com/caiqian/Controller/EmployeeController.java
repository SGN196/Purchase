package com.caiqian.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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

    @RequestMapping("/toLogin")
    public String toLogin(){

        return "emp/login";
    }



}
