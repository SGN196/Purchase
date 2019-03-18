package com.caiqian.Service;

import com.caiqian.Bean.QuoteInfo;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;

/**
 * @author SGN196
 * @date 2019/3/17 17:38
 */


public interface QuoteService
{

    boolean addQuote(QuoteInfo quoteInfo);

    PageInfo<QuoteInfo> queryQuoteByRequire(QuoteInfo quoteInfo);
}
