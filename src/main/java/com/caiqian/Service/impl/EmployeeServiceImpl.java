package com.caiqian.Service.impl;

import com.caiqian.Bean.UserInfo;
import com.caiqian.Service.EmployeeService;
import com.caiqian.mapper.UserInfoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author SGN196
 * @date 2019/3/3 19:33
 */


@Service
public class EmployeeServiceImpl implements EmployeeService
{
    @Autowired
    private UserInfoMapper userInfoMapper;

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
