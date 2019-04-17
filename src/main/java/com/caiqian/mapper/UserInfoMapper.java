package com.caiqian.mapper;

import com.caiqian.Bean.UserInfo;
import org.apache.ibatis.annotations.Param;

import java.util.ArrayList;

public interface UserInfoMapper {
    UserInfo queryByNamePwd(UserInfo userInfo);

    ArrayList<UserInfo> queryAll(UserInfo userInfo);

    UserInfo isExists(@Param("userCode") String userCode);

    boolean addEmployee(UserInfo addUser);

    boolean acountStop(@Param("id")Integer id);

    boolean acountStart(@Param("id")Integer id);
}