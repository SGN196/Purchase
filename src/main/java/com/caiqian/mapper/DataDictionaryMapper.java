package com.caiqian.mapper;

import com.caiqian.Bean.DataDictionary;

import java.util.ArrayList;
import java.util.List;

public interface DataDictionaryMapper {
    ArrayList<Integer> isAccessAuthorityRepertoryListOfEmployee();

    String queryEmployeeDept(Integer deptId);

    ArrayList<Integer> isAccessAuthorityRecordOfEmployee();

    List<DataDictionary> queryDeptName();
}