package com.caiqian.mapper;

import com.caiqian.Bean.UserInfo;

import java.util.ArrayList;

public interface UserInfoMapper {
    UserInfo queryByNamePwd(UserInfo userInfo);

    ArrayList<UserInfo> queryAll(UserInfo userInfo);
}