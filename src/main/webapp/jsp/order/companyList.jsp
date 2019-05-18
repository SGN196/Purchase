<%--
  Created by IntelliJ IDEA.
  User: 11212
  Date: 2019/3/4
  Time: 19:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>友商报价页面</title>

    <link rel="stylesheet" href="${ctx}/static/plugins/layui/css/layui.css">
    <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
    <script src="${ctx}/static/plugins/jQuery/jquery-3.3.1.js"></script>
    <style>
        #divcss4 {
            text-align: center;
        }
    </style>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">

    <jsp:include page="${ctx}/jsp/common/header.jsp"></jsp:include>

    <div class="layui-body">
        <div id="divcss4">
            <!-- 内容主体区域 -->
            <div>
                <label style="font-size: 30px;">友商报价页面
                    <p style="color: red">${errorMsg}</p>
                    <p style="color: green">${successMsg}</p>
                </label>
            </div>
            <div style="padding: 15px;">
                <form class="layui-form" action="${ctx}/bid/toCompanyList" method="post">
                    <div class="layui-inline">
                        <label class="layui-form-label">需求编号</label>
                        <div class="layui-input-inline">
                            <input type="text" name="quoteId" value="${bidInfo.quoteId}" autocomplete="off"
                                   class="layui-input">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">报价单编号</label>
                        <div class="layui-input-inline">
                            <input type="text" name="id" value="${bidInfo.id}" autocomplete="off"
                                   class="layui-input">
                        </div>
                    </div><br>
                    <div class="layui-inline">
                        <label class="layui-form-label">竞价状态</label>
                        <div class="layui-input-inline">
                            <input type="text" name="bidStatus" value="${bidInfo.bidStatus}" autocomplete="off"
                                   class="layui-input">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">友商名称</label>
                        <div class="layui-input-inline">
                            <input type="text" name="customerName" value="${bidInfo.customerName}" autocomplete="off"
                                   class="layui-input">
                        </div>
                    </div>
                    <br>
                    <div class="layui-inline">
                        <div class="layui-input-inline">
                            <input type="hidden" name="pageNum" value="1">
                        </div>
                    </div>
                    <!------------------------------------------------->

                    <div class="layui-inline">
                        <div class="layui-input-block">
                            <button class="layui-btn" lay-submit="" lay-filter="demo1">立即查询</button>
                        </div>
                    </div>
                </form>

                <hr>
                <table class="layui-table">
                    <thead>
                    <tr>
                        <th>需求编号</th>
                        <th>报价单编号</th>
                        <th>友商名称</th>
                        <th>友商总报价</th>

                        <th>材料名称</th>
                        <th>采购数量</th>

                        <th>预计交货时间</th>
                        <th>报价单状态</th>
                        <th>操作</th>

                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${page.list}" var="obj">
                        <tr>
                            <td>${obj.quoteId}</td>
                            <td>${obj.id}</td>
                            <td>${obj.customerName}</td>
                            <td>${obj.bidTotalPrice}</td>

                            <td>${obj.materialName}</td>
                            <td>${obj.quoteQuantity}</td>

                            <td>${obj.timeDeliver}</td>
                            <td>
                                <c:if test="${obj.bidStatus eq 1}">竞价中 </c:if>
                                <p style="color:red;"><c:if test="${obj.bidStatus eq 0}">竞价失败</c:if></p>
                                <p style="color:green;"><c:if test="${obj.bidStatus eq 66}">竞价成功</c:if></p>
                            </td>

                            <td>
                                <div class="site-demo-button" id="layerDemo" style="margin-bottom: 0;">

                                    <div class="layui-anim layui-anim-up">
                                        <c:if test="${obj.bidStatus eq 1}"><a href="#" onclick="confirmBid(${obj.id})"
                                                                              class="layui-btn layui-btn-radius">确定订单</a></c:if>
                                    </div>
                                </div>
                            </td>

                        </tr>
                    </c:forEach>
                    <tr>
                        <td>
                            共${page.total} 条记录 第 ${page.pageNum}/ ${page.pages}页
                        </td>
                        <td colspan="8">
                            <a href="javascript:void(0);" page="first">首页</a>
                            <a href="javascript:void(0);" page="prev">上一页</a>
                            <a href="javascript:void(0);" page="next">下一页</a>
                            <a href="javascript:void(0);" page="last">尾页</a>

                        </td>
                    </tr>
                    </tbody>

                </table>


            </div>
        </div>
    </div>

    <!-- 底部固定区域 -->
    <jsp:include page="${ctx}/jsp/common/footer.jsp"/>
</div>
<script src="${ctx}/static/plugins/layui/layui.js"></script>
<script>
    layui.use(['element', 'form', 'jquery'], function () {
        var element = layui.element;
        var form = layui.form;
        var $ = layui.jquery;

        document.getElementById("purchase").className = "layui-nav-item layui-nav-itemed";
        $('a[page]').click(function () {

            var pageNum = 1;
            var currPage = '${page.pageNum}';
            var totalPages = '${page.pages}';
            var v = $(this).attr('page');

            switch (v) {
                case "first":
                    pageNum = 1;
                    break;
                case "prev":
                    pageNum = parseInt(currPage) - 1;
                    if (pageNum < 1)
                        pageNum = 1;
                    break;
                case 'next':
                    pageNum = parseInt(currPage) + 1;
                    if (pageNum > totalPages) {
                        pageNum = totalPages;
                    }
                    break;
                case "last":
                    pageNum = totalPages;
                    break;
            }
            $('input[name=pageNum]').val(pageNum);
            $('form').submit();
        })
        $('#layerDemo .layui-btn').on('click', function () {
            var othis = $(this), method = othis.data('method');
            active[method] ? active[method].call(this, othis) : '';
        });
    });
    function confirmBid(id) {
        if (confirm('确定将该报价生成订单吗')) {
            $.ajax({
                url: '${ctx}/bid/confirmBid/' + id,
                type: 'post',
                success: function (data) {
                    if (data == "OK") {
                        alert("确定成功");
                        window.location.reload();
                    } else {
                        alert("发生错误");
                        window.location.reload();
                    }
                }
            });
        };
    }
</script>
</body>
</html>