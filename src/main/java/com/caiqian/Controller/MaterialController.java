package com.caiqian.Controller;

import com.caiqian.Bean.MaterialCategory;
import com.caiqian.Bean.MaterialInfo;
import com.caiqian.Bean.UserInfo;
import com.caiqian.DTO.MaterialInfoDTO;
import com.caiqian.Service.MaterialService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 * @author SGN196
 * @date 2019/3/4 18:57
 */

@Controller
@RequestMapping("/material")
public class MaterialController
{

    @Autowired
    MaterialService materialService;


    //判断登录的员工账号，是否有权限访问库存信息
    @RequestMapping("/repertoryList")
    public String repertoryList(MaterialInfoDTO materialInfoDTO, HttpSession httpSession, Model model){
        UserInfo userInfo = (UserInfo)httpSession.getAttribute("userInfo");
        boolean isAuthority = materialService.isAccessAuthorityRepertoryOfEmployee(userInfo.getDeptId());
        if(isAuthority)
        {

            PageInfo<MaterialInfo> pageInfo = materialService.query(materialInfoDTO);
            List<MaterialCategory> levelOneList = materialService.queryLevelOne();


            model.addAttribute("page", pageInfo);
            model.addAttribute("levelOneList", levelOneList);
            model.addAttribute("materialInfoDTO", materialInfoDTO);
            
            return "repo/index";
        }
        else{
            model.addAttribute("PermissionDenied", "权限不足，无法访问");
            return "emp/index";
        }

    }

    @ResponseBody
    @RequestMapping("/category/queryLevelTwoByLevelOne/{levelId}")
    public List<MaterialCategory> queryLevelTwoByLevelOne(@PathVariable("levelId") Integer id){
        List<MaterialCategory> list = materialService.queryLevelTwoByLevelOne(id);
        return list;
    }



}
