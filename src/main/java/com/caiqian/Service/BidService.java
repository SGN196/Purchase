package com.caiqian.Service;

import com.caiqian.Bean.BidInfo;
import com.caiqian.Bean.QuoteInfo;
import com.github.pagehelper.PageInfo;

/**
 * @author SGN196
 * @date 2019/3/18 22:25
 */

public interface BidService
{
    PageInfo<QuoteInfo> queryQuoteByRequire(QuoteInfo quoteInfo);

    boolean addBidItem(BidInfo bidInfo);

    PageInfo<BidInfo> queryBidList(BidInfo bidInfo);

    BidInfo queryBidInfoById(Integer id);

    Boolean deleteById(Integer id);

    Boolean refuseBidById(Integer id);

    boolean confirmBid(Integer id, Integer userId);
}
