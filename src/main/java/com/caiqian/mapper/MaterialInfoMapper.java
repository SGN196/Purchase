package com.caiqian.mapper;

import com.caiqian.Bean.MaterialInfo;
import com.caiqian.DTO.MaterialInfoDTO;
import com.caiqian.DTO.UpdateMaterialDTO;

import java.util.ArrayList;
import java.util.List;

public interface MaterialInfoMapper {

    ArrayList<MaterialInfo> queryAll(MaterialInfoDTO materialInfoDTO);

    boolean addMaterial(MaterialInfo materialInfo);

    UpdateMaterialDTO queryByIdToUpdateDTO(Integer id);

    boolean updateMaterialInfoDTO(UpdateMaterialDTO updateMaterialDTO);

    List<MaterialInfo> queryMaterialNameByLevelTwo(Integer id);

    String queryUnitById(Integer id);
}