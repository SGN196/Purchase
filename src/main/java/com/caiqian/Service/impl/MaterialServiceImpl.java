package com.caiqian.Service.impl;

import com.caiqian.Bean.DataDictionary;
import com.caiqian.Bean.MaterialCategory;
import com.caiqian.Bean.MaterialInfo;
import com.caiqian.DTO.MaterialInfoDTO;
import com.caiqian.DTO.UpdateMaterialDTO;
import com.caiqian.Service.MaterialService;
import com.caiqian.constant.CommonCodeConstant;
import com.caiqian.mapper.DataDictionaryMapper;
import com.caiqian.mapper.MaterialCategoryMapper;
import com.caiqian.mapper.MaterialInfoMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.lang.reflect.Array;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

/**
 * @author SGN196
 * @date 2019/3/4 19:03
 */

@Service
public class MaterialServiceImpl implements MaterialService
{
    @Autowired
    DataDictionaryMapper dataDictionaryMapper;


    @Autowired
    MaterialInfoMapper materialInfoMapper;

    @Autowired
    MaterialCategoryMapper materialCategoryMapper;


    @Override
    public MaterialInfo queryMaterialById(Integer id)
    {
        return materialInfoMapper.queryMaterialById(id);
    }

    @Override
    public boolean isAccessAuthorityRepertoryOfEmployee(Integer id)
    {
        ArrayList<Integer> arrayList = dataDictionaryMapper.isAccessAuthorityRepertoryListOfEmployee();
        if(arrayList.contains(id)){
            return true;
        }
        return false;
    }

    @Override
    public Boolean deleteById(Integer id)
    {
        return materialInfoMapper.deleteById(id);
    }

    @Override
    public Integer queryQuantityByMaterialId(Integer materialId)
    {
        return materialInfoMapper.queryQuantityByMaterialId(materialId);
    }

    @Override
    public boolean updateMaterialInfoDTO(UpdateMaterialDTO updateMaterialDTO)
    {
        return materialInfoMapper.updateMaterialInfoDTO(updateMaterialDTO);
    }

    @Override
    public UpdateMaterialDTO queryByIdToUpdateDTO(Integer id)
    {
        return materialInfoMapper.queryByIdToUpdateDTO(id);
    }


    @Override
    public boolean isExistByName(MaterialInfo materialInfoObj)
    {
        if(materialInfoObj.getMaterialName() == null){
            materialInfoObj.setMaterialName("fwefwjoifwjfwoifejfuwfwefwefjewifjweofwjofweifjofejfi");
        }
        ArrayList<MaterialInfo> list =  materialInfoMapper.queryByName(materialInfoObj);
        if(list.isEmpty())
            return false;
        else
            return true;
    }

    @Override
    public boolean addMaterialItem(MaterialInfo materialInfo)
    {
        materialInfo.setMaterialQuantity(0);
        materialInfo.setCreateDate(new Date(System.currentTimeMillis()));
        return materialInfoMapper.addMaterial(materialInfo);
    }

    @Override
    public PageInfo<MaterialInfo> query(MaterialInfoDTO materialInfoDTO)
    {
        PageHelper.startPage(materialInfoDTO.getPageNum(), CommonCodeConstant.PAGE_SIZE);
        ArrayList<MaterialInfo> list =  materialInfoMapper.queryAll(materialInfoDTO);
        PageInfo<MaterialInfo> page = new PageInfo<>(list);
        return page;
    }

    @Override
    public List<MaterialCategory> queryLevelTwoByLevelOne(Integer id)
    {
        return materialCategoryMapper.queryLevelTwoByLevelOne(id);
    }

    @Override
    public List<MaterialInfo> queryMaterialNameByLevelTwo(Integer id)
    {
        return materialInfoMapper.queryMaterialNameByLevelTwo(id);
    }

    @Override
    public String queryUnitById(Integer id)
    {
        return materialInfoMapper.queryUnitById(id);
    }

    @Override
    public List<MaterialCategory> queryLevelOne()
    {
        return materialCategoryMapper.queryLevelOne();
    }
}
