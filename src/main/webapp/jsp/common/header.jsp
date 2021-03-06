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
        <a style="color: white" href="${ctx}/employee/toIndex">企业物资管理系统</a>
    </div>

    <ul class="layui-nav layui-layout-right">
        <li class="layui-nav-item">
            <a href="javascript:;">
                <img src="${ctx}/static/plugins/img/linus.jpg" class="layui-nav-img">
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
        <ul class="layui-nav layui-nav-tree" lay-filter="test">
            <li id="materialList" class="layui-nav-item">
                <a class="" href="javascript:;">物资查询</a>
                <dl class="layui-nav-child">
                    <dd><a href="${ctx}/material/toAddMaterial">${PermissionDenied}新增物资种类</a></dd>
                    <dd><a href="${ctx}/material/repertoryList">${PermissionDenied}材料信息查询</a></dd>
                </dl>
            </li>
            <li id="useApply" class="layui-nav-item">
                <a class="" href="javascript:;">物资领用</a>
                <dl class="layui-nav-child">
                    <dd><a href="${ctx}/record/toReceiveApply">领用物资申请</a></dd>
                    <dd><a href="${ctx}/record/toMyApplyList/${sessionScope.userInfo.id}">${PermissionDenied}本人申请列表</a>
                    </dd>
                </dl>
            </li>
            <li id="purchase" class="layui-nav-item">
                <a class="" href="javascript:;">${PermissionDenied}订单管理</a>
                <dl class="layui-nav-child">
                    <dd><a href="${ctx}/purchase/toMaterialPurchase">发布采购需求</a></dd>
                    <dd><a href="${ctx}/purchase/toPurchaseList">采购需求管理</a></dd>
                    <dd><a href="${ctx}/bid/toCompanyList">友商报价管理</a></dd>
                    <dd><a href="${ctx}/order/toOrderFromList">订单管理</a></dd>
                </dl>
            </li>

            <li id="recordList" class="layui-nav-item">
                <a class="" href="javascript:;">${PermissionDenied}仓库物资管理</a>
                <dl class="layui-nav-child">
                    <dd><a href="${ctx}/record/toCheckApplyList">领用物资审批</a></dd>
                    <dd><a href="${ctx}/order/toRepoByOrder">订单入库</a></dd>
                    <dd><a href="${ctx}/record/InOutRecord">进出库记录查询</a></dd>

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
