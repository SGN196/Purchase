package com.caiqian.mapper;

import com.caiqian.Bean.MaterialCategory;

public interface MaterialCategoryMapper {
    int insert(MaterialCategory record);

    int insertSelective(MaterialCategory record);
}