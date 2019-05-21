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
    <title>员工账号管理</title>
    <link rel="stylesheet" href="${ctx}/static/plugins/layui/css/layui.css">
    <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body class="layui-layout-body">
    <div class="layui-layout layui-layout-admin">

        <jsp:include page="${ctx}/jsp/root/headerRoot.jsp"></jsp:include>

        <div class="layui-body">
            <!-- 内容主体区域 -->
            <div style="padding: 15px; text-align: center;">
                <cite style="font-size: 40px">员工账号管理</cite>
                <form class="layui-form" action="${ctx}/root/toEmpAcount" method="get">
                    <div class="layui-inline">
                        <label class="layui-form-label">员工账号</label>
                        <div class="layui-input-inline">
                            <input type="text" name="userCode" value="${userInfoQuery.userCode}" autocomplete="off"
                                   class="layui-input">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">员工姓名</label>
                        <div class="layui-input-inline">
                            <input type="text" name="userName" value="${userInfoQuery.userName}" autocomplete="off"
                                   class="layui-input">
                        </div>
                    </div>
                    <br>

                    <div class="layui-inline">
                        <label class="layui-form-label">所属部门</label>
                        <div class="layui-input-inline">
                            <input type="text" name="deptName" value="${userInfoQuery.deptName}" autocomplete="off"
                                   class="layui-input">
                        </div>
                    </div>

                    <div class="layui-inline">
                        <label class="layui-form-label">账号状态</label>
                        <div class="layui-input-inline">
                            <input type="text" name="isUse" value="${userInfoQuery.isUse}" autocomplete="off"
                                   class="layui-input">
                        </div>
                    </div>
                    <br>

                    <!------------------------------------------------->

                    <div class="layui-inline">
                        <div class="layui-input-inline">
                            <input type="hidden" name="pageNum">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <div class="layui-input-block">
                            <button class="layui-btn" lay-submit="" lay-filter="demo1">立即查询</button>
                        </div>
                    </div>
                    <%--<div class="layui-input-block">--%>
                        <%--<a class="layui-btn" lay-submit="" lay-filter="demo1" href="${ctx}/material/toAddMaterial">新增物资种类</a>--%>
                    <%--</div>--%>

                </form>

                <hr>
                <table class="layui-table">
                    <thead>
                    <tr>
                        <th>员工账号</th>
                        <th>员工姓名</th>
                        <th>所属部门</th>
                        <th>账号状态</th>

                        <th>操作</th>

                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${page.list}" var="obj">
                        <tr>
                            <td>${obj.userCode}</td>
                            <td>${obj.userName}</td>
                            <td>${obj.deptId}</td>

                            <td>
                                <c:if test="${obj.isUse eq 1}"><p style="color: green">启用中</p> </c:if>
                            <c:if test="${obj.isUse eq 0}"><p style="color: red">未启用</p></c:if>
                            </td>

                            <td>
                                <div class="site-demo-button" id="layerDemo" style="margin-bottom: 0;">

                                    <div class="layui-anim layui-anim-up">

                                        <c:if test="${obj.isUse eq 0}"> <a href="${ctx}/employee/AcountStart/${obj.id}" 	class="layui-btn layui-btn-radius">启用</a></c:if>
                                        <c:if test="${obj.isUse eq 1}"><a href="${ctx}/employee/AcountStop/${obj.id}" 	class="layui-btn layui-btn-radius layui-btn-danger">停用</a></c:if>
                                    </div>

                                        <%--<a href="${ctx}/record/deleteById/${obj.id}" class="layui-btn layui-btn-danger layui-btn-xs" ><i class="layui-icon" style="font-size: 20px" >&#xe640</i></a>--%>

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
       <jsp:include page="${ctx}/jsp/root/footerRoot.jsp"/>
    </div>
    <script src="${ctx}/static/plugins/layui/layui.js"></script>
    <script>
        layui.use(['element', 'form', 'jquery'], function() {
            var element = layui.element;
            var form = layui.form;
            var $ = layui.jquery;

            document.getElementById("root").className="layui-nav-item layui-nav-itemed";

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



            $(function () {
                var levelOne = $('#levelOne').val();
                if(levelOne != '' && levelOne != null){
                    var levelTwo = '${materialInfoDTO.levelTwo}';
                    if(levelTwo != '' && levelTwo != null && levelTwo != undefined){
                        $.ajax({
                            url:'${ctx}/material/category/queryLevelTwoByLevelOne/' + levelOne,
                            type:'get',
                            success:function(data) {
                                var html = '<option value="" >-请选择-</option>';
                                var len = data.length;

                                for(var i = 0; i < len; i++){
                                    html += '<option value="' + data[i].id + '"';
                                    if(levelTwo == data[i].id){
                                        html += ' selected ';
                                    }
                                    html += '>' + data[i].categoryName + '</option>';
                                }
                                $('#levelTwo').html(html);
                                form.render();

                            }
                        });
                    }
                }
            });


            $('#layerDemo .layui-btn').on('click', function(){
                var othis = $(this), method = othis.data('method');
                active[method] ? active[method].call(this, othis) : '';
            });

        });





    </script>

</body>
</html>