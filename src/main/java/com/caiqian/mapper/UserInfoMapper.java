package com.caiqian.mapper;

import com.caiqian.Bean.UserInfo;

public interface UserInfoMapper {
    UserInfo queryByNamePwd(UserInfo userInfo);
}