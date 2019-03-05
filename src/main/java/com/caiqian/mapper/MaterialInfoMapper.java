package com.caiqian.mapper;

import com.caiqian.Bean.MaterialInfo;
import com.caiqian.DTO.MaterialInfoDTO;

import java.util.ArrayList;

public interface MaterialInfoMapper {

    ArrayList<MaterialInfo> queryAll(MaterialInfoDTO materialInfoDTO);
}