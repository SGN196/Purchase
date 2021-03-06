<%--
  Created by IntelliJ IDEA.
  User: 11212
  Date: 2019/3/3
  Time: 14:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>友商竞标系统</title>
    <link rel="stylesheet" href="${ctx}/static/plugins/layui/css/layui.css"/>

    <style>
        #divcss1{
            background-color: white;
            border-radius: 20px;
            left: 50%;
            top: 50%;
            position: absolute;
            transform: translate(-50%,-50%);
        }
        #divcss2{
            color: red;
        }
        body{
            background-image:url("${ctx}/static/plugins/layui/images/back01.jpg");
            background-size:cover;
        }
    </style>
</head>
<body >



<div id="divcss1">
    <h2>&nbsp;&emsp;&emsp;&emsp;&emsp;&emsp;友商竞标系统</h2><br>
    <form class="layui-form" action="${ctx}/customer/login" lay-ignore method="post">
        <div class="layui-form-item">
            <label class="layui-form-label">用户名</label>
            <div class="layui-input-inline">
                <input type="text" name="customerCode"  required  lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">密码</label>
            <div class="layui-input-inline">
                <input type="password" name="customerPassword" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
            </div>

        </div>


        <div class="layui-form-item">
            <div class="layui-input-block">
                <div id="divcss2">
                    ${errMsg}
                </div>
                <button class="layui-btn" lay-submit lay-filter="formDemo">登录</button>
                <button class="layui-btn"  ><a href="${ctx}/customer/toRegister">注册</a></button>

            </div>
        </div>
    </form>
</div>
<script src="${ctx}/static/plugins/layui/layui.js"></script>
</body>
</html>
