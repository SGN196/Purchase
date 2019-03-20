package com.caiqian.Controller;

import com.caiqian.Bean.MaterialCategory;
import com.caiqian.Bean.QuoteInfo;
import com.caiqian.Bean.UserInfo;
import com.caiqian.Service.MaterialService;
import com.caiqian.Service.QuoteService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * @author SGN196
 * @date 2019/3/17 16:17
 */

@Controller
@RequestMapping("/purchase")
public class PurchaseController
{

    @Autowired
    MaterialService materialService;

    @Autowired
    QuoteService quoteService;

    @RequestMapping("/toMaterialPurchase")
    public String toMaterialPurchase(HttpSession httpSession, Model model){
        UserInfo userInfo = (UserInfo)httpSession.getAttribute("userInfo");
        if(userInfo == null){
            return "emp/login";
        }
        List<MaterialCategory> list = materialService.queryLevelOne();
        model.addAttribute("levelOnex", list);
        return "purchase/materialPurchase";
    }

    @RequestMapping("/launchRequirement")
    public String launchRequirement(QuoteInfo quoteInfo, Model model, HttpSession httpSession){
        UserInfo userInfo = (UserInfo)httpSession.getAttribute("userInfo");
        if(userInfo == null){
            return "emp/login";
        }
        List<MaterialCategory> list = materialService.queryLevelOne();
        model.addAttribute("levelOnex", list);

        try {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日");
            Date date = sdf.parse(quoteInfo.getTempDate());
            quoteInfo.setQuoteEndtime(new java.sql.Date(date.getTime()));
        } catch (ParseException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        quoteInfo.setCreateDate(new java.sql.Date(System.currentTimeMillis()));
        quoteInfo.setQuoteStatus(1);
        if(quoteInfo.isEmptyRequire()){
            model.addAttribute("errorMsg", "参数为空");
            return "purchase/materialPurchase";
        }

        boolean flag = quoteService.addQuote(quoteInfo);
        model.addAttribute("successMsg", "发布成功");

        return "purchase/materialPurchase";
    }


    @RequestMapping("/toPurchaseList")
    public String toPurchaseList(QuoteInfo quoteInfo, Model model, HttpSession httpSession){

        UserInfo userInfo = (UserInfo)httpSession.getAttribute("userInfo");
        if(userInfo == null){
            return "emp/login";
        }


        PageInfo<QuoteInfo> pageInfo = quoteService.queryQuoteByRequire(quoteInfo);
        model.addAttribute("page", pageInfo);
        model.addAttribute("quoteInfo", quoteInfo);
        return "purchase/purchaseList";
    }


}
