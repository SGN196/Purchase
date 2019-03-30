package com.caiqian.Service.impl;

import com.caiqian.Bean.DataDictionary;
import com.caiqian.Bean.MaterialInfo;
import com.caiqian.Bean.UserInfo;
import com.caiqian.Service.EmployeeService;
import com.caiqian.constant.CommonCodeConstant;
import com.caiqian.mapper.DataDictionaryMapper;
import com.caiqian.mapper.UserInfoMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.xml.crypto.Data;
import java.util.ArrayList;

/**
 * @author SGN196
 * @date 2019/3/3 19:33
 */


@Service
public class EmployeeServiceImpl implements EmployeeService
{
    @Autowired
    private UserInfoMapper userInfoMapper;

    @Autowired
    private DataDictionaryMapper dataDictionaryMapper;


    @Override
    public String queryEmployeeDept(Integer deptId)
    {
        String deptName = dataDictionaryMapper.queryEmployeeDept(deptId);
        return deptName;
    }

    @Override
    public boolean isRoot(UserInfo userInfo)
    {
        if(userInfo.getDeptId() == 1)
            return true;
        else
            return false;
    }

    @Override
    public PageInfo<UserInfo> queryAll(UserInfo userInfo)
    {
        PageHelper.startPage(userInfo.getPageNum(), CommonCodeConstant.PAGE_SIZE);
        ArrayList<UserInfo> list =  userInfoMapper.queryAll(userInfo);
        PageInfo<UserInfo> page = new PageInfo<>(list);
        return page;
    }

    @Override
    public UserInfo login(UserInfo userInfo)
    {
        userInfo = userInfoMapper.queryByNamePwd(userInfo);
        if(userInfo != null && userInfo.getIsUse() == 1){
            return userInfo;
        }else{
            return null;
        }

    }
}
