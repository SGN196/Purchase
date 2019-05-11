package com.caiqian.Controller;

import com.caiqian.Bean.MaterialCategory;
import com.caiqian.Bean.MaterialInfo;
import com.caiqian.Bean.MaterialRecord;
import com.caiqian.Bean.UserInfo;
import com.caiqian.DTO.PageDTO;
import com.caiqian.DTO.RecordDTO;
import com.caiqian.Service.MaterialService;
import com.caiqian.Service.RecordService;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

/**
 * @author SGN196
 * @date 2019/3/11 0:05
 */

@Controller
@RequestMapping("/record")
public class RecordController
{
    @Autowired
    MaterialService materialService;

    @Autowired
    RecordService recordService;

    @RequestMapping("/toReceiveApply")
    public String toReceiveApply(Model model, HttpSession httpSession){
        UserInfo userInfo = (UserInfo)httpSession.getAttribute("userInfo");
        if(userInfo == null){
            return "emp/login";
        }

        List<MaterialCategory> list = materialService.queryLevelOne();
        model.addAttribute("levelOnex", list);
        return "repo/useMaterialApply";
    }

    @RequestMapping("/toMyApplyList/{id}")
    public String toMyApplyList(@PathVariable("id") Integer id, HttpSession httpSession, PageDTO pageDTO, Model model){
        UserInfo userInfo = (UserInfo)httpSession.getAttribute("userInfo");
        if(userInfo == null){
            return "emp/login";
        }
        PageInfo<MaterialRecord> pageInfo = recordService.queryById(id, pageDTO);
        model.addAttribute("page", pageInfo);

        return "repo/myApplyList";
    }

    @RequestMapping("/toCheckApplyList")
    public String toCheckApplyList(HttpSession session, Model model, PageDTO pageDTO){
        UserInfo userInfo = (UserInfo)session.getAttribute("userInfo");
        if(userInfo == null){
            return "emp/login";
        }
        boolean isAuthority = recordService.isAccessAuthorityRecordOfEmployee(userInfo.getDeptId());
        if(isAuthority)
        {
            PageInfo<MaterialRecord> pageInfo = recordService.queryAll(pageDTO);

            model.addAttribute("page", pageInfo);
            return "repo/checkApplyList";
        }
        else{
            model.addAttribute("PermissionDenied", "权限不足，无法访问");
            return "emp/index";
        }
    }

    @RequestMapping("/toInOutRecord")
    public String toInOutRecord(HttpSession httpSession, Model model){
        UserInfo userInfo = (UserInfo) httpSession.getAttribute("userInfo");
        if(userInfo == null){
            return "emp/login";
        }
        PageInfo<RecordDTO> pageInfo = recordService.queryIORecord(new RecordDTO());
        model.addAttribute("page", pageInfo);

        return "repo/InOutRecord";
    }

    @RequestMapping("/InOutRecord")
    public String InOutRecord(HttpSession httpSession, Model model, RecordDTO recordDTO){
        UserInfo userInfo = (UserInfo) httpSession.getAttribute("userInfo");
        if(userInfo == null){
            return "emp/login";
        }
        PageInfo<RecordDTO> pageInfo = recordService.queryIORecord(recordDTO);
        model.addAttribute("page", pageInfo);
        model.addAttribute("recordDTO", recordDTO);
        return "repo/InOutRecord";
    }


    /**
     *
     * 审核成功，代表出库，仓库中对应的物资，减少相应的数量

     */
    @RequestMapping("/approveRecord/{id}")
    public String approveRecord(@PathVariable("id") Integer id, Model model, PageDTO pageDTO, HttpSession httpSession){
        UserInfo userInfo = (UserInfo)httpSession.getAttribute("userInfo");
        if(userInfo == null){
            return "emp/login";
        }


        MaterialRecord materialRecord = recordService.queryByRecordId(id);
        Integer materialQuantity = materialService.queryQuantityByMaterialId(materialRecord.getMaterialId());
        Integer requiredQuantity = materialRecord.getMaterialNum();

        if(materialQuantity < requiredQuantity){
            model.addAttribute("errorMsg", "操作失败，库存不足");
            PageInfo<MaterialRecord> pageInfo = recordService.queryAll(pageDTO);
            model.addAttribute("page", pageInfo);
            return "repo/checkApplyList";
        }

        boolean flag = recordService.approveRecord(id, userInfo.getId(), materialQuantity - requiredQuantity);

        if(flag){
            model.addAttribute("successMsg", "操作成功");
        }else{
            model.addAttribute("errorMsg", "操作失败");
        }
        PageInfo<MaterialRecord> pageInfo = recordService.queryAll(pageDTO);
        model.addAttribute("page", pageInfo);
        return "repo/checkApplyList";
    }

    /*
     * 人为取消本条，领用物资的申请
     */
    @RequestMapping("/disApproveRecord/{id}")
    public String disApproveRecord(@PathVariable("id") Integer id, Model model, PageDTO pageDTO, HttpSession httpSession){
        UserInfo userInfo = (UserInfo)httpSession.getAttribute("userInfo");
        boolean flag = recordService.disApproveRecord(id, userInfo.getId());
        if(flag){
            model.addAttribute("successMsg", "操作成功");
        }else{
            model.addAttribute("errorMsg", "操作失败");
        }
        PageInfo<MaterialRecord> pageInfo = recordService.queryAll(pageDTO);
        model.addAttribute("page", pageInfo);
        return "repo/checkApplyList";
    }

    @RequestMapping("/deleteById/{id}")
    public String deleteById(@PathVariable("id") Integer id, Model model){
        Integer userId = recordService.queryUserIdByRecordId(id);
        boolean flag = recordService.deleteById(id);

        PageInfo<MaterialRecord> pageInfo = recordService.queryById(userId, new PageDTO());
        model.addAttribute("page", pageInfo);
        return "repo/myApplyList";
    }



    @RequestMapping("/applyForOutRepository")
    public String applyForOutRepository(MaterialRecord materialRecord, Model model){
        if(materialRecord.isAddEmpty()){
           model.addAttribute("materialRecord", materialRecord);
           model.addAttribute("errorMsg", "请完整填写消息");
           return "repo/useMaterialApply";
        }
        materialRecord.setRecordStatus(0);
        materialRecord.setCreateDate(new java.sql.Date(System.currentTimeMillis()));
        materialRecord.setCreateBy(materialRecord.getUserId());
        materialRecord.setCreateDate(new java.sql.Date(System.currentTimeMillis()));

        boolean flag = recordService.addNewRecord(materialRecord);
        if(flag){
            model.addAttribute("successMsg", "申请成功");
            return "repo/useMaterialApply";
        }else{
            model.addAttribute("errorMsg", "申请失败");
            return "repo/useMaterialApply";
        }

    }
}
