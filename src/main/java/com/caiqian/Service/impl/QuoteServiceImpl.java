package com.caiqian.Service.impl;


import com.caiqian.Bean.MaterialInfo;
import com.caiqian.Bean.QuoteInfo;
import com.caiqian.Service.QuoteService;
import com.caiqian.constant.CommonCodeConstant;
import com.caiqian.mapper.BidInfoMapper;
import com.caiqian.mapper.QuoteInfoMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;

/**
 * @author SGN196
 * @date 2019/3/17 17:39
 */
@Service
public class QuoteServiceImpl implements QuoteService
{
    @Autowired
    QuoteInfoMapper quoteInfoMapper;

    @Autowired
    BidInfoMapper bidInfoMapper;

    @Override
    public PageInfo<QuoteInfo> queryQuoteByRequire(QuoteInfo quoteInfo)
    {
        PageHelper.startPage(quoteInfo.getPageNum(), CommonCodeConstant.PAGE_SIZE);
        ArrayList<QuoteInfo> list = quoteInfoMapper.queryQuoteByRequire(quoteInfo);
        PageInfo<QuoteInfo> page = new PageInfo<>(list);
        return page;
    }

    @Override
    @Transactional
    public boolean closeQuoteById(Integer id)
    {
        boolean flag = bidInfoMapper.refuseBidByQuoteId(id);
        boolean flag1 = quoteInfoMapper.refuseQuote(id);
        if(flag && flag1)
            return true;
        return false;
    }

    @Override
    public boolean addQuote(QuoteInfo quoteInfo)
    {
        return quoteInfoMapper.addQuote(quoteInfo);
    }
}
