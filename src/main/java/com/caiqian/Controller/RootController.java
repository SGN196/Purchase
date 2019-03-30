package com.caiqian.Controller;

import com.caiqian.Bean.*;
import com.caiqian.DTO.MaterialInfoDTO;
import com.caiqian.Service.CustomerService;
import com.caiqian.Service.EmployeeService;
import com.caiqian.Service.MaterialService;
import com.caiqian.mapper.MaterialInfoMapper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @author SGN196
 * @date 2019/3/6 18:16
 */


@Controller
@RequestMapping("/root")
public class RootController
{
    @Autowired
    EmployeeService employeeService;

    @Autowired
    CustomerService customerService;

    @Autowired
    MaterialService materialService;

    @RequestMapping("/index")
    public String index(HttpSession httpSession){
        UserInfo userInfo = (UserInfo)httpSession.getAttribute("userInfo");
        if(userInfo == null)
        {
            return "emp/login";
        }
        boolean isRoot = employeeService.isRoot(userInfo);
        if(!isRoot){
            return "emp/index";
        }

        return "root/index";
    }

    @RequestMapping("/toEmpAcount")
    public String toEmpAcount(Model model, HttpSession httpSession, UserInfo userInfoQuery){
        UserInfo curUser = (UserInfo)httpSession.getAttribute("userInfo");
        if(curUser == null)
        {
            return "emp/login";
        }
        boolean isRoot = employeeService.isRoot(curUser);
        if(!isRoot){
            return "emp/index";
        }

        PageInfo<UserInfo> pageInfo = employeeService.queryAll(userInfoQuery);
        model.addAttribute("page", pageInfo);



        return "root/empAcount";
    }

    @RequestMapping("/toCustomerAcount")
    public String toCustomerAcount(HttpSession httpSession, Model model, CustomerInfo customerInfo){
        UserInfo userInfo = (UserInfo)httpSession.getAttribute("userInfo");
        if(userInfo == null)
        {
            return "emp/login";
        }
        boolean isRoot = employeeService.isRoot(userInfo);
        if(!isRoot){
            return "emp/index";
        }
        PageInfo<CustomerInfo> pageInfo = customerService.queryAll(customerInfo);
        model.addAttribute("page", pageInfo);


        return "root/customerAcount";
    }
    @RequestMapping("/toCloseOrderForm")
    public String toCloseOrderForm(HttpSession httpSession, OrderForm orderForm){
        UserInfo userInfo = (UserInfo)httpSession.getAttribute("userInfo");
        if(userInfo == null)
        {
            return "emp/login";
        }
        boolean isRoot = employeeService.isRoot(userInfo);
        if(!isRoot){
            return "emp/index";
        }





        return "root/closeOrderForm";
    }
    @RequestMapping("/toMaterialQuantitySet")
    public String toMaterialQuantitySet(HttpSession httpSession, Model model, MaterialInfoDTO materialInfoDTO){
        UserInfo userInfo = (UserInfo)httpSession.getAttribute("userInfo");
        if(userInfo == null)
        {
            return "emp/login";
        }
        boolean isRoot = employeeService.isRoot(userInfo);
        if(!isRoot){
            return "emp/index";
        }

        boolean isAuthority = materialService.isAccessAuthorityRepertoryOfEmployee(userInfo.getDeptId());
        if(isAuthority)
        {
            if(materialInfoDTO.getPageNum() == null){
                materialInfoDTO.setPageNum(1);
            }
            PageInfo<MaterialInfo> pageInfo = materialService.query(materialInfoDTO);
            List<MaterialCategory> levelOneList = materialService.queryLevelOne();


            model.addAttribute("page", pageInfo);
            model.addAttribute("levelOneList", levelOneList);
            model.addAttribute("materialInfoDTO", materialInfoDTO);

            return "root/materialQuantitySet";
        }


        return "root/materialQuantitySet";
    }

}
