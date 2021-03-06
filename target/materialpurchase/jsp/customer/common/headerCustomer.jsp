<%--
  Created by IntelliJ IDEA.
  User: 11212
  Date: 2018/11/9
  Time: 21:06
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="layui-header  layui-bg-blue">
    <div class="layui-logo">
        <a style="color: white">友商竞标系统</a>
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
        <li class="layui-nav-item"><a href="${ctx}/customer/logout">退出</a></li>
    </ul>
</div>

<div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
        <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
        <ul class="layui-nav layui-nav-tree" lay-filter="test">
            <li id="bidList" class="layui-nav-item">
                <a class="" href="javascript:;">报价相关</a>
                <dl class="layui-nav-child">
                    <dd><a href="${ctx}/bid/toQuoteList">${PermissionDenied}竞标商品选择</a></dd>

                </dl>
            </li>
            <li id="orderList" class="layui-nav-item">
                <a class="" href="javascript:;">订单管理</a>
                <dl class="layui-nav-child">
                    <dd><a href="${ctx}/bid/toMyBidList">当前竞价清单</a></dd>
                    <dd><a href="${ctx}/order/toMyOrderList">历史订单</a></dd>
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
