package com.caiqian.Service.impl;

import com.caiqian.Bean.BidInfo;
import com.caiqian.Bean.OrderForm;
import com.caiqian.Bean.QuoteInfo;
import com.caiqian.Service.BidService;
import com.caiqian.constant.CommonCodeConstant;
import com.caiqian.mapper.BidInfoMapper;
import com.caiqian.mapper.OrderFormMapper;
import com.caiqian.mapper.QuoteInfoMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * @author SGN196
 * @date 2019/3/18 22:26
 */

@Service
public class BidServiceImpl implements BidService
{

    @Autowired
    QuoteInfoMapper quoteInfoMapper;

    @Autowired
    BidInfoMapper bidInfoMapper;

    @Autowired
    OrderFormMapper orderFormMapper;


    /**
     * 传入报价单ID
     */
    @Transactional
    @Override
    public boolean confirmBid(Integer id, Integer userId)
    {
        //按照报价单编号查询
        BidInfo bidInfo = bidInfoMapper.queryBidInfoById(id);
        List<BidInfo> list = bidInfoMapper.queryBidListByQuoteId(bidInfo);
        Iterator iterator = list.iterator();
        while(iterator.hasNext())
        {
            BidInfo temp = (BidInfo) iterator.next();
            if (temp.getId() == id) {
                bidInfoMapper.success(temp.getId());
                OrderForm orderForm = new OrderForm(temp, userId);
                Boolean flag = orderFormMapper.add(orderForm);
                Boolean flagx = quoteInfoMapper.success(temp.getQuoteId());
                if(!flag || !flagx)
                {
                    return false;
                }
            }else{
                bidInfoMapper.refuseBidById(temp.getId());
            }
        }

        return true;
    }

    @Override
    public Boolean refuseBidById(Integer id)
    {
        return bidInfoMapper.refuseBidById(id);
    }

    @Override
    public Boolean deleteById(Integer id )
    {
        return bidInfoMapper.deleteById(id);
    }

    @Override
    public BidInfo queryBidInfoById(Integer id)
    {

        return bidInfoMapper.queryBidInfoById(id);
    }

    @Override
    public boolean addBidItem(BidInfo bidInfo)
    {
        return bidInfoMapper.addBidItem(bidInfo);
    }

    @Override
    public PageInfo<QuoteInfo> queryQuoteByRequire(QuoteInfo quoteInfo)
    {
        PageHelper.startPage(quoteInfo.getPageNum(), CommonCodeConstant.PAGE_SIZE);
        ArrayList<QuoteInfo> list = quoteInfoMapper.queryQuoteByRequire(quoteInfo);
        PageInfo<QuoteInfo> page = new PageInfo<>(list);
        return page;
    }

    @Override
    public PageInfo<BidInfo> queryBidList(BidInfo bidInfo)
    {

        PageHelper.startPage(bidInfo.getPageNum(), CommonCodeConstant.PAGE_SIZE);
        ArrayList<BidInfo> list = bidInfoMapper.queryBidList(bidInfo);
        PageInfo<BidInfo> page = new PageInfo<>(list);
        return page;
    }
}
