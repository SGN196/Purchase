package com.caiqian.Service.impl;

import com.caiqian.Bean.DataDictionary;
import com.caiqian.Bean.UserInfo;
import com.caiqian.Service.EmployeeService;
import com.caiqian.mapper.DataDictionaryMapper;
import com.caiqian.mapper.UserInfoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.xml.crypto.Data;

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
