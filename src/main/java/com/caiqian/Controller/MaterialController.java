package com.caiqian.Controller;

import com.caiqian.Bean.MaterialCategory;
import com.caiqian.Bean.MaterialInfo;
import com.caiqian.Bean.UserInfo;
import com.caiqian.DTO.MaterialInfoDTO;
import com.caiqian.DTO.UpdateMaterialDTO;
import com.caiqian.Service.MaterialService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
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


    @RequestMapping("/toUpdateMaterial/{MaterialId}")
    public String toUpdateMaterial(@PathVariable("MaterialId") Integer id,  Model model){
        UpdateMaterialDTO updateMaterialDTO  = materialService.queryByIdToUpdateDTO(id);
        List<MaterialCategory> levelOneList = materialService.queryLevelOne();
        model.addAttribute("updateMaterialDTO", updateMaterialDTO);
        model.addAttribute("levelOneList", levelOneList);

        return "category/updateMaterial";
    }

    @RequestMapping("/updateMaterial")
    public String UpdateMaterial( UpdateMaterialDTO updateMaterialDTO, Model model){

        if(updateMaterialDTO.isEmptyUpdate()){
            model.addAttribute("ErrUpdateMaterialMsg", "关键数据为空");
        }else
        {

            boolean flag = materialService.updateMaterialInfoDTO(updateMaterialDTO);
            if (flag == true)
            {
                model.addAttribute("updateMaterialMsg", "修改成功");
            } else
            {
                model.addAttribute("ErrUpdateMaterialMsg", "修改失败");
            }

        }
        List<MaterialCategory> levelOneList = materialService.queryLevelOne();
        model.addAttribute("levelOneList", levelOneList);
        model.addAttribute("updateMaterialDTO",updateMaterialDTO );
        return "category/updateMaterial";

    }

    @RequestMapping("/toAddMaterial")
    public String toAddMaterial(Model model, HttpSession httpSession){
        UserInfo userInfo = (UserInfo)httpSession.getAttribute("userInfo");
        if(userInfo == null){
            return "emp/login";
        }
        List<MaterialCategory> levelOnex = materialService.queryLevelOne();
        model.addAttribute("levelOnex", levelOnex);
        return "category/addMaterial";
    }


    @RequestMapping("/addMaterial")
    public String addMaterial(MaterialInfo materialInfoObj, HttpSession httpSession, Model model){
        UserInfo userInfo = (UserInfo)httpSession.getAttribute("userInfo");
        if(userInfo == null){
            return "emp/login";
        }
        //判断数据库中，是否存在该商品信息
        boolean exist = materialService.isExistByName(materialInfoObj);
        if(exist){
            model.addAttribute("addMaterialMsg","");
            model.addAttribute("ErraddMaterialMsg", "该材料已存在");
            return "category/addMaterial";
        }

        List<MaterialCategory> levelOnex = materialService.queryLevelOne();
        model.addAttribute("levelOnex", levelOnex);
        if(!materialInfoObj.isEmptyADD())
        {
            materialInfoObj.setCreateBy(userInfo.getId());
            boolean flag = materialService.addMaterialItem(materialInfoObj);
            if(flag){
                model.addAttribute("addMaterialMsg", "新增成功");
                model.addAttribute("ErraddMaterialMsg", "");
                return "category/addMaterial";
            }else{
                model.addAttribute("ErraddMaterialMsg", "新增失败");
                model.addAttribute("addMaterialMsg","");
            }
        }else{
            model.addAttribute("ErraddMaterialMsg", "信息填写未填全");
            model.addAttribute("addMaterialMsg","");

        }
        model.addAttribute("materialInfoTemp", materialInfoObj);
        return "category/addMaterial";
    }

    //判断登录的员工账号，是否有权限访问库存信息
    @RequestMapping("/repertoryList")
    public String repertoryList(MaterialInfoDTO materialInfoDTO, HttpSession httpSession, Model model){
        UserInfo userInfo = (UserInfo)httpSession.getAttribute("userInfo");
        if(userInfo == null){
            return "emp/login";
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

            return "category/index";
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

    @ResponseBody
    @RequestMapping("/category/queryMaterialNameByLevelTwo/{levelTwoId}")
    public List<MaterialInfo> queryMaterialNameByLevelTwo(@PathVariable("levelTwoId") Integer id){
        List<MaterialInfo> list = materialService.queryMaterialNameByLevelTwo(id);
        return list;
    }


    @ResponseBody
    @RequestMapping("/category/queryUnitById/{Id}")
    public String queryUnitById(@PathVariable("Id") Integer id){

        String str = materialService.queryUnitById(id);
        System.out.println(str);
        return str;
    }



}
