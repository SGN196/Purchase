package com.caiqian.Service.impl;

import com.caiqian.Bean.BidInfo;
import com.caiqian.Bean.QuoteInfo;
import com.caiqian.Service.BidService;
import com.caiqian.constant.CommonCodeConstant;
import com.caiqian.mapper.BidInfoMapper;
import com.caiqian.mapper.QuoteInfoMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

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
