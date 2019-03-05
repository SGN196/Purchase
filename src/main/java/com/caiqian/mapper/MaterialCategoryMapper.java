package com.caiqian.mapper;

import com.caiqian.Bean.MaterialCategory;

import java.util.List;

public interface MaterialCategoryMapper {

    List<MaterialCategory> queryLevelTwoByLevelOne(Integer id);

    List<MaterialCategory> queryLevelOne();
}