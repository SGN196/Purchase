package com.caiqian.mapper;

import com.caiqian.Bean.UserInfo;

public interface UserInfoMapper {
    int insert(UserInfo record);

    int insertSelective(UserInfo record);
}