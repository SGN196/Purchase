<%--
  Created by IntelliJ IDEA.
  User: 11212
  Date: 2018/11/9
  Time: 21:06
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="layui-header">
    <a href="${ctx}/employee/login"><div class="layui-logo">企业物资管理系统</div></a>
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
                欢迎你：${sessionScope.userInfo.userName} <br>
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
            <li id="useApply" class="layui-nav-item">
                <a class="" href="javascript:;">领用物资</a>
                <dl class="layui-nav-child">
                    <dd><a href="${ctx}/record/toReceiveApply">领用物资申请</a></dd>
                    <dd><a href="${ctx}/record/toMyApplyList/${sessionScope.userInfo.id}">${PermissionDenied}本人申请列表</a></dd>
                </dl>
            </li>
            <li id="materialList" class="layui-nav-item">
                <a class="" href="javascript:;">物资种类</a>
                <dl class="layui-nav-child">
                    <dd><a href="${ctx}/material/repertoryList">${PermissionDenied}物资查询</a></dd>
                    <dd><a href="${ctx}/material/toAddMaterial">${PermissionDenied}新增物资种类</a></dd>
                </dl>
            </li>
            <li id="recordList" class="layui-nav-item">
                <a class="" href="javascript:;">${PermissionDenied}库存审核</a>
                <dl class="layui-nav-child">
                    <dd><a href="${ctx}/record/toCheckApplyList">领用物资审批</a></dd>
                    <dd><a href="${ctx}/record/toInOutRecord">进出库记录</a></dd>
                    <dd><a href="${ctx}/order/toRepoByOrder">订单入库</a></dd>
                </dl>
            </li>
            <li id="purchase" class="layui-nav-item">
                <a class="" href="javascript:;">${PermissionDenied}采购系统</a>
                <dl class="layui-nav-child">
                    <dd><a href="${ctx}/purchase/toMaterialPurchase">发布采购需求</a></dd>
                    <dd><a href="${ctx}/purchase/toPurchaseList">需求管理</a></dd>
                    <dd><a href="${ctx}/order/toOrderFromList">订单管理</a></dd>
                </dl>
            </li>

            <li id="customer" class="layui-nav-item">
                <a class="" href="javascript:;">${PermissionDenied}报价审核</a>
                <dl class="layui-nav-child">
                    <dd><a href="${ctx}/bid/toCompanyList">友商报价管理</a></dd>
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
