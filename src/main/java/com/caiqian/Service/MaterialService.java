package com.caiqian.Service;

import com.caiqian.Bean.MaterialCategory;
import com.caiqian.Bean.MaterialInfo;
import com.caiqian.DTO.MaterialInfoDTO;
import com.github.pagehelper.PageInfo;

import java.util.ArrayList;
import java.util.List;

/**
 * @author SGN196
 * @date 2019/3/4 19:03
 */

public interface MaterialService
{
    boolean isAccessAuthorityRepertoryOfEmployee(Integer id);

    PageInfo<MaterialInfo> query(MaterialInfoDTO materialInfoDTO);

    List<MaterialCategory> queryLevelTwoByLevelOne(Integer id);

    List<MaterialCategory> queryLevelOne();
}
