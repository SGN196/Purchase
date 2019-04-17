package com.caiqian.Service;

import com.caiqian.Bean.MaterialInfo;
import com.caiqian.Bean.UserInfo;
import com.github.pagehelper.PageInfo;

/**
 * @author SGN196
 * @date 2019/3/3 19:34
 */

public interface EmployeeService
{
    UserInfo login(UserInfo userInfo);

    String queryEmployeeDept(Integer deptId);

    boolean isRoot(UserInfo userInfo);

    PageInfo<UserInfo> queryAll(UserInfo userInfo);

    boolean addEmployee(UserInfo addUser);

    boolean acountStart(Integer id);

    boolean acountStop(Integer id);
}
