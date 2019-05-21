package com.caiqian.mapper;

import com.caiqian.Bean.BidInfo;
import org.apache.ibatis.annotations.Param;

import java.util.ArrayList;
import java.util.List;

public interface BidInfoMapper {

    boolean addBidItem(BidInfo bidInfo);

    BidInfo queryBidInfoById(@Param("bidId") Integer bidId);


    /**
     * 修改供应商报价单3连
     */
    boolean success(@Param("bidId") Integer bidId);

    boolean transport(@Param("bidId") Integer id);

    boolean refuseBidById(@Param("bidId") Integer id);


    Boolean deleteById(@Param("bidId") Integer bidId);

    List<BidInfo> queryBidListById(@Param("bidId") Integer bidId);



    ArrayList<BidInfo> queryBidList(BidInfo bidInfo);

    ArrayList<BidInfo> queryBidListByQuoteId(BidInfo bidInfo);

    boolean refuseBidByQuoteId(@Param("quoteId")Integer id);
}