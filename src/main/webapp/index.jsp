<%--
  Created by IntelliJ IDEA.
  User: 11212
  Date: 2019/3/3
  Time: 2:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>企业首页</title>

    <style>
        body{
            background: #009688;
        }
        #divcss1{
            text-align: center;
            background-color: #fff;
            border-radius: 20px;

            position: absolute;
            left: 50%;
            top: 50%;
            transform: translate(-50%,-50%);
        }
    </style>
</head>
<body>

    <div id="divcss1">
   这是一个没有特效的首页<br>
        <a href="${ctx}/employee/toLogin">企业内部系统</a><br>
        <a href="${ctx}/customer/toLogin">竞标系统</a>
    </div>
</body>
</html>
