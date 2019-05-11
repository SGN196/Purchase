package com.caiqian.Controller;

import com.caiqian.Bean.BidInfo;
import com.caiqian.Bean.CustomerInfo;
import com.caiqian.Bean.QuoteInfo;
import com.caiqian.Bean.UserInfo;
import com.caiqian.Service.BidService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author SGN196
 * @date 2019/3/18 21:24
 */

@RequestMapping("/bid")
@Controller
public class BidController
{

    @Autowired
    BidService bidService;


    /**
     * 友商报价驳回功能，应该放在订单取消模块，不能放在这里
     * */
    @RequestMapping("/refuseBidById/{id}")
    @ResponseBody
    public String refuseBidById(@PathVariable("id") Integer id, HttpSession httpSession, Model model){
        CustomerInfo customerInfo = (CustomerInfo)httpSession.getAttribute("customerInfo");
        if(customerInfo == null){
            return "customer/login/login";
        }
        boolean flag = bidService.refuseBidById(id);

        return null;
    }

    /*
     * 确定报价单，同时生成订单，把其他报价单，设置为空白
     * 传入的是报价单ID
     */
    @ResponseBody
    @RequestMapping("/confirmBid/{id}")
    public String confirmBid(@PathVariable("id") String id, HttpSession httpSession, Model model){
        UserInfo userInfo = (UserInfo)httpSession.getAttribute("userInfo");
        if(userInfo == null){
            return "emp/login";
        }
        Integer bidId = Integer.valueOf(id);
        boolean flag = bidService.confirmBid(bidId, userInfo.getId());
        if(flag)
            return "OK";
        else
            return "ERROR";
    }



    @RequestMapping("/deleteById/{id}")
    public String deleteById(@PathVariable("id") Integer id, HttpSession httpSession, Model model){
        CustomerInfo customerInfo = (CustomerInfo)httpSession.getAttribute("customerInfo");
        if(customerInfo == null){
            return "customer/login/login";
        }
        BidInfo bidInfo = bidService.queryBidInfoById(id);

        if(bidInfo == null){

        }else{
            if(bidInfo.getBidStatus() == 0){
                Boolean flag = bidService.deleteById(bidInfo.getId());
            }
        }




        PageInfo<BidInfo> pageInfo = bidService.queryBidList(bidInfo);
        model.addAttribute("page", pageInfo);
        model.addAttribute("bidInfo", bidInfo);
        return "purchase/purchaseList";
    }

    @RequestMapping("/toMyBidList")
    public String toMyBidList(HttpSession httpSession, Model model, BidInfo bidInfo){
        CustomerInfo customerInfo = (CustomerInfo)httpSession.getAttribute("customerInfo");
        if(customerInfo == null){
            return "customer/login/login";
        }
        bidInfo.setBidStatus(1);
        bidInfo.setCreateBy(customerInfo.getId());
        PageInfo<BidInfo> pageInfo = bidService.queryBidList(bidInfo);
        model.addAttribute("page", pageInfo);
        model.addAttribute("bidInfo", bidInfo);



        return "customer/bid/myBidList";
    }


    @RequestMapping("/toCompanyList")
    public String toCompanyList(HttpSession httpSession, Model model, BidInfo bidInfo){
        UserInfo userInfo = (UserInfo)httpSession.getAttribute("userInfo");
        if(userInfo == null){
            return "emp/login";
        }
        PageInfo<BidInfo> pageInfo = bidService.queryBidList(bidInfo);
        model.addAttribute("page", pageInfo);
        model.addAttribute("bidInfo", bidInfo);


        return "order/companyList";
    }


    @RequestMapping("/toQuoteList")
    public String toQuoteList(HttpSession httpSession, QuoteInfo quoteInfo, Model model){
        CustomerInfo customerInfo = (CustomerInfo)httpSession.getAttribute("customerInfo");
        if(customerInfo == null){
            return "customer/login/login";
        }

        quoteInfo.setQuoteStatus(1); //只输出待成交的需求

        PageInfo<QuoteInfo> pageInfo = bidService.queryQuoteByRequire(quoteInfo);
        model.addAttribute("page", pageInfo);
        model.addAttribute("quoteInfo", quoteInfo);

        return "customer/bid/bidList";
    }

    @RequestMapping("/addBid")
    public String addBid(HttpSession httpSession, BidInfo bidInfo, Model model){
        CustomerInfo customerInfo = (CustomerInfo)httpSession.getAttribute("customerInfo");
        if(customerInfo == null){
            return "customer/login/login";
        }
        QuoteInfo quoteInfo = new QuoteInfo();
        quoteInfo.setQuoteStatus(1);
        PageInfo<QuoteInfo> pageInfo = bidService.queryQuoteByRequire(quoteInfo);
        model.addAttribute("page", pageInfo);
        model.addAttribute("quoteInfo", quoteInfo);


        if(bidInfo.isAddEmpty()){
            model.addAttribute("errorMsg", "信息没有填全");
            return "customer/bid/bidList";
        }


        try {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日");
            Date date = sdf.parse(bidInfo.getTempTime());
            bidInfo.setTimeDeliver(new java.sql.Date(date.getTime()));
        } catch (ParseException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        bidInfo.setCreateBy(customerInfo.getId());
        bidInfo.setBidStatus(1);
        bidInfo.setCreateDate(new java.sql.Date(System.currentTimeMillis()));

        boolean flag = bidService.addBidItem(bidInfo);

        if(flag){
            model.addAttribute("successMsg", "成功参与竞价");
        }else{
            model.addAttribute("errorMsg", "系统错误");

        }
        return "customer/bid/bidList";
    }

}
