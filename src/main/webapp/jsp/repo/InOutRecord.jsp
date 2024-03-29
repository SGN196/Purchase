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
    <title>进出库记录</title>
    <link rel="stylesheet" href="${ctx}/static/plugins/layui/css/layui.css">
    <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
    <style>
        #divcss4{
            text-align: center;
        }

    </style>
</head>
<body class="layui-layout-body">
    <div class="layui-layout layui-layout-admin">

        <jsp:include page="${ctx}/jsp/common/header.jsp"></jsp:include>

        <div class="layui-body">


                <!-- 内容主体区域 -->
            <div id="divcss4">
                <div style="font-size: 30px;" >
                   <label>进出库记录
                       <p style="color: red">${errorMsg}</p>
                       <p style="color: green">${successMsg}</p>
                   </label>
                </div>

                <div style="padding: 15px;">
                    <form class="layui-form" action="${ctx}/record/InOutRecord" method="get">
                        <div class="layui-inline">
                            <label class="layui-form-label">进出库记录编号</label>
                            <div class="layui-input-inline">
                                <input type="text" name="id" value="${recordDTO.id}" autocomplete="off"
                                       class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">材料编号</label>
                            <div class="layui-input-inline">
                                <input type="text" name="materialId" value="${recordDTO.materialId}" autocomplete="off"
                                       class="layui-input">
                            </div>
                        </div>

                        <br>
                        <div class="layui-inline">
                            <label class="layui-form-label">材料名称</label>
                            <div class="layui-input-inline">
                                <input type="text" name="materialName" value="${recordDTO.materialName}" autocomplete="off"
                                       class="layui-input">
                            </div>
                        </div>


                        <div class="layui-inline">
                            <label class="layui-form-label">审批人</label>
                            <div class="layui-input-inline">
                                <input type="text" name="userName" value="${recordDTO.userName}" autocomplete="off"
                                       class="layui-input">
                            </div>
                        </div>      <br>


                        <div class="layui-inline">
                            <div class="layui-input-block">
                                <button class="layui-btn" lay-submit="" lay-filter="demo1">立即查询</button>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <div class="layui-input-inline">
                                <input type="hidden" name="pageNum" value="1">
                            </div>
                        </div>

                    </form>
                </div>



                <hr>
                <table class="layui-table">
                    <thead>
                    <tr>
                        <th>进出库记录编号</th>

                        <th>材料标号</th>
                        <th>材料名称</th>
                        <th>数量</th>
                        <th>进/出库</th>
                        <th>审批人</th>
                        <th>时间</th>
                        <th>详细信息</th>

                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${page.list}" var="obj">
                        <tr>
                            <td>${obj.id}</td>
                            <td>${obj.materialId}</td>
                            <td>${obj.materialName}</td>
                            <td>${obj.materialNum} </td>
                            <td>
                                <p style="color:red;"><c:if test="${obj.recordStatus eq 1}"> 出库 </c:if></p>
                                <p style="color:green;"><c:if test="${obj.recordStatus eq 66}">入库</c:if></p>
                            </td>
                            <td>${obj.userName}</td>
                            <td>${obj.modifyDate}</td>

                            <td>
                                <div class="site-demo-button" id="layerDemo" style="margin-bottom: 0;">
                                    <div class="layui-anim layui-anim-up">
                                        <a class="layui-btn layui-btn-radius">详情</a>
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


        <!-- 底部固定区域 -->
        <jsp:include page="${ctx}/jsp/common/footer.jsp"/>
    </div>
    <script src="${ctx}/static/plugins/layui/layui.js"></script>
    <script>
        layui.use(['element', 'form', 'jquery'], function() {
            var element = layui.element;
            var form = layui.form;
            var $ = layui.jquery;

            document.getElementById("recordList").className="layui-nav-item layui-nav-itemed";


            $('a[page]').click(function () {

                var pageNum = 1;
                var currPage = '${page.pageNum}';
                var totalPages ='${page.pages}';
                var v = $(this).attr('page');

                switch (v) {
                    case "first": pageNum = 1; break;
                    case "prev":
                        pageNum = parseInt(currPage) - 1;
                        if(pageNum < 1)
                            pageNum = 1;
                        break;
                    case 'next':
                        pageNum = parseInt(currPage) + 1;
                        if(pageNum > totalPages){
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

            $('#layerDemo .layui-btn').on('click', function(){
                var othis = $(this), method = othis.data('method');
                active[method] ? active[method].call(this, othis) : '';
            });

        });


    </script>

</body>
</html>