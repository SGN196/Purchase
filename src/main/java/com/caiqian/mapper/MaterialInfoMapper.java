package com.caiqian.mapper;

import com.caiqian.Bean.MaterialInfo;
import com.caiqian.DTO.MaterialInfoDTO;
import com.caiqian.DTO.UpdateMaterialDTO;
import org.apache.ibatis.annotations.Param;

import java.util.ArrayList;
import java.util.List;

public interface MaterialInfoMapper {

    ArrayList<MaterialInfo> queryAll(MaterialInfoDTO materialInfoDTO);

    boolean addMaterial(MaterialInfo materialInfo);

    UpdateMaterialDTO queryByIdToUpdateDTO(Integer id);

    boolean updateMaterialInfoDTO(UpdateMaterialDTO updateMaterialDTO);

    List<MaterialInfo> queryMaterialNameByLevelTwo(Integer id);

    String queryUnitById(Integer id);

    Integer queryQuantityByMaterialId(@Param("materialId") Integer materialId);

    ArrayList<MaterialInfo> queryByName(MaterialInfo materialInfo);

    boolean addMaterialQuantity(@Param("number") Integer number, @Param("id") Integer id, @Param("modifyDate") java.sql.Date modifyDate);

    Boolean approveRecord(@Param("materialId")Integer materialId, @Param("materialNum")Integer materialNum);

    Boolean deleteById(@Param("materialId")Integer id);

    MaterialInfo queryMaterialById(@Param("materialId")Integer id);
}