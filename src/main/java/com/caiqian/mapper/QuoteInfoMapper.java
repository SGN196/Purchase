package com.caiqian.mapper;

import com.caiqian.Bean.QuoteInfo;
import org.apache.ibatis.annotations.Param;

import java.util.ArrayList;

public interface QuoteInfoMapper {

    boolean addQuote(QuoteInfo quoteInfo);

    ArrayList<QuoteInfo> queryQuoteByRequire(QuoteInfo quoteInfo);

    boolean success(@Param("quoteId")Integer quoteId);

    Integer queryQuantityById(@Param("quoteId")Integer quoteId);

    QuoteInfo queryQuoteById(@Param("quoteId")Integer quoteId);
}