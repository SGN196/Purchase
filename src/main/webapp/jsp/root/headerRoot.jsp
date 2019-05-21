<%--
  Created by IntelliJ IDEA.
  User: 11212
  Date: 2018/11/9
  Time: 21:06
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="layui-header layui-bg-blue">
    <div class="layui-logo">
        <a style="color: white">后台管理界面</a>
    </div>
    <ul class="layui-nav layui-layout-right">
        <li class="layui-nav-item">
            <a href="javascript:;">
                <img src="${ctx}/static/plugins/img/linus.jpg" class="layui-nav-img">
                欢迎你：${sessionScope.customerInfo.customerName} <br>
            </a>
            <dl class="layui-nav-child">
                <dd><a href="">基本资料</a></dd>
                <dd><a href="">安全设置</a></dd>
            </dl>
        </li>
        <li class="layui-nav-item"><a href="${ctx}/employee/logout">退出</a></li>
    </ul>
</div>

<div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
        <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
        <ul class="layui-nav layui-nav-tree"  lay-filter="test">
            <li id="root" class="layui-nav-item">
                <a class="" href="javascript:;">${PermissionDenied}超级管理员</a>
                <dl class="layui-nav-child">
                    <dd><a href="${ctx}/root/toAddEmployee">新增员工账号</a></dd>
                    <dd><a href="${ctx}/root/toEmpAcount">员工账号启停</a></dd>
                    <dd><a href="${ctx}/root/toCustomerAcount">友商账号管理</a></dd>
                    <dd><a href="${ctx}/root/toCloseOrderForm">删除订单</a></dd>
                    <dd><a href="${ctx}/root/toMaterialQuantitySet">库存管理</a></dd>


                </dl>
            </li>

            <li class="layui-nav-item">
                <a></a>
            </li>



            <li class="layui-nav-item">
                <a class="" href="javascript:;">个人设置</a>
                <dl class="layui-nav-child">
                    <dd><a href="${ctx}/app/index/devId/${sessionScope.devUser.id}">个人设置</a></dd>

                </dl>
            </li>
            <%--<li class="layui-nav-item"><a href="">云市场</a></li>--%>
            <%--<li class="layui-nav-item"><a href="">发布商品</a></li>--%>
        </ul>
    </div>
</div>
