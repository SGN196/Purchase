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
    <title>employee login</title>
    <link rel="stylesheet" href="${ctx}/static/plugins/layui/css/layui.css"/>

    <style>
        body{

        }
        #divcss1{

            left: 50%;
            top: 50%;
            position: absolute;
            transform: translate(-50%,-50%);
        }
        #divcss2{
            left: 50%;
            position: absolute;
            top: 30%;
            transform: translate(-50%,-50%);
        }
    </style>
</head>
<body>
    ${errMsg}

        <div id="divcss2">

        </div>
        <div id="divcss1">
            <h2>&nbsp;&emsp;&emsp;&emsp;&emsp;&emsp;企业内部系统</h2><br>
            <form class="layui-form" action="${ctx}/dev/login" lay-ignore method="post">
                <div class="layui-form-item">
                    <label class="layui-form-label">用户名</label>
                    <div class="layui-input-inline">
                        <input type="text" name="devCode"  required  lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">密码</label>
                    <div class="layui-input-inline">
                        <input type="password" name="devPassword" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
                    </div>

                </div>


                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit lay-filter="formDemo">登录</button>
                        <button class="layui-btn"  ><a href="${ctx}/dev/toRegister">注册</a></button>
                    </div>
                </div>
            </form>
        </div>
    <script src="${ctx}/static/plugins/layui/layui.js"></script>
</body>
</html>
