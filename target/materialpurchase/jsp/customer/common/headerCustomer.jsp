<%--
  Created by IntelliJ IDEA.
  User: 11212
  Date: 2018/11/9
  Time: 21:06
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="layui-header">
    <div class="layui-logo">友商竞标系统</div>
    <!-- 头部区域（可配合layui已有的水平导航） -->
    <%--<ul class="layui-nav layui-layout-left">--%>
    <%--<li class="layui-nav-item"><a href="">控制台</a></li>--%>
    <%--<li class="layui-nav-item"><a href="">商品管理</a></li>--%>
    <%--<li class="layui-nav-item"><a href="">用户</a></li>--%>
    <%--<li class="layui-nav-item">--%>
    <%--<a href="javascript:;">其它系统</a>--%>
    <%--<dl class="layui-nav-child">--%>
    <%--<dd><a href="">邮件管理</a></dd>--%>
    <%--<dd><a href="">消息管理</a></dd>--%>
    <%--<dd><a href="">授权管理</a></dd>--%>
    <%--</dl>--%>
    <%--</li>--%>
    <%--</ul>--%>
    <ul class="layui-nav layui-layout-right">
        <li class="layui-nav-item">
            <a href="javascript:;">
                <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
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
        <ul class="layui-nav layui-nav-tree"  lay-filter="test">
            <li id="bidList" class="layui-nav-item">
                <a class="" href="javascript:;">报价相关</a>
                <dl class="layui-nav-child">
                    <dd><a href="${ctx}/bid/toQuoteList">${PermissionDenied}竞标商品选择</a></dd>

                </dl>
            </li>
            <li id="orderList" class="layui-nav-item">
                <a class="" href="javascript:;">订单管理</a>
                <dl class="layui-nav-child">
                    <dd><a href="${ctx}/bid/toMyBidList">我的竞价清单</a></dd>
                    <dd><a href="${ctx}/order/toMyOrderList">成功订单</a></dd>
                </dl>
            </li>

            <li class="layui-nav-item">
                <a></a>

            </li>


            <li class="layui-nav-item">
                <a class="" href="javascript:;">个人设置</a>
                <dl class="layui-nav-child">
                    <dd><a href="${ctx}/app/index/devId/${sessionScope.devUser.id}">APP维护</a></dd>

                </dl>
            </li>
            <%--<li class="layui-nav-item"><a href="">云市场</a></li>--%>
            <%--<li class="layui-nav-item"><a href="">发布商品</a></li>--%>
        </ul>
    </div>
</div>
