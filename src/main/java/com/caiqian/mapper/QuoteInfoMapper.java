package com.caiqian.mapper;

import com.caiqian.Bean.QuoteInfo;

import java.util.ArrayList;

public interface QuoteInfoMapper {

    boolean addQuote(QuoteInfo quoteInfo);

    ArrayList<QuoteInfo> queryQuoteByRequire(QuoteInfo quoteInfo);
}