<%--
  Created by IntelliJ IDEA.
  User: 11212
  Date: 2019/3/3
  Time: 21:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>竞标系统主页</title>
        <link rel="stylesheet" href="${ctx}/static/plugins/layui/css/layui.css">
        <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
    </head>
    <body class="layui-layout-body">
        <div class="layui-layout layui-layout-admin">

            <jsp:include page="${ctx}/jsp/customer/common/headerCustomer.jsp"></jsp:include>

            <div class="layui-body">
                <!-- 内容主体区域 -->
                <div style="padding: 15px;">
                    您好，${sessionScope.customerInfo.customerName}，欢迎来到物资采购系统 <br>



                </div>
            </div>


            <!-- 底部固定区域 -->
            <jsp:include page="${ctx}/jsp/customer/common/footerCustomer.jsp"/>

        </div>
        <script src="${ctx}/static/plugins/layui/layui.js"></script>
        <script>
            //JavaScript代码区域
            layui.use('element', function(){
                var element = layui.element;

            });
        </script>
    </body>
</html>