package com.caiqian.mapper;

import com.caiqian.Bean.BidInfo;

import java.util.ArrayList;

public interface BidInfoMapper {

    boolean addBidItem(BidInfo bidInfo);

    ArrayList<BidInfo> queryBidList(BidInfo bidInfo);
}