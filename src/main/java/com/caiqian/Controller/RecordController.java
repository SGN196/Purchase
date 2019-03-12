package com.caiqian.Controller;

import com.caiqian.Bean.MaterialCategory;
import com.caiqian.Service.MaterialService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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

    @RequestMapping("/toReceiveApply")
    public String toReceiveApply(Model model){
        List<MaterialCategory> list = materialService.queryLevelOne();
        model.addAttribute("levelOnex", list);
        return "repo/useMaterialApply";
    }

    @RequestMapping("/myApplyList")
    public String myApplyList(){

        return null;
    }
}
