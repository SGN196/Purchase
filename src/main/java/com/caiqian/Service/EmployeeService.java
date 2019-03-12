package com.caiqian.Service;

import com.caiqian.Bean.UserInfo;

/**
 * @author SGN196
 * @date 2019/3/3 19:34
 */

public interface EmployeeService
{
    UserInfo login(UserInfo userInfo);

    String queryEmployeeDept(Integer deptId);
}
