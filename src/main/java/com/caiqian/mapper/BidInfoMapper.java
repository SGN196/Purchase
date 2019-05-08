package com.caiqian.mapper;

import com.caiqian.Bean.BidInfo;
import org.apache.ibatis.annotations.Param;

import java.util.ArrayList;

public interface BidInfoMapper {

    boolean addBidItem(BidInfo bidInfo);

    ArrayList<BidInfo> queryBidList(BidInfo bidInfo);

    boolean success(@Param("bidId") Integer bidId);

    BidInfo queryBidInfoById(@Param("bidId") Integer id);

    Boolean deleteById(@Param("bidId") Integer id);
}