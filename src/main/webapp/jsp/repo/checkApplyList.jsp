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
    <title>审批领用申请</title>
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
                   <label>审批领用申请
                       <p style="color: red">${errorMsg}</p>
                       <p style="color: green">${successMsg}</p>
                   </label>
                </div>
                <hr>
                <table class="layui-table">
                    <thead>
                    <tr>
                        <th>订单（可能存在材料不足的情况）编号</th>

                        <th>材料标号</th>
                        <th>材料名称</th>

                        <th>申请数量</th>
                        <th>申请原因</th>
                        <th>拒绝原因</th>
                        <th>操作</th>

                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${page.list}" var="obj">
                        <tr>
                            <td>${obj.id}</td>
                            <td>${obj.materialId}</td>
                            <td>${obj.materialName}</td>
                            <td>${obj.materialNum}</td>
                            <td>${obj.useReason}</td>
                            <td><input id="reason" name="reason" type="text" placeholder="若拒绝，请填写原因"/></td>
                            <td>
                                <div class="site-demo-button" id="layerDemo" style="margin-bottom: 0;">

                                    <div class="layui-anim layui-anim-up">

                                        <a href="${ctx}/record/approveRecord/${obj.id}" 	class="layui-btn layui-btn-radius">批准</a>

                                    </div>
                                </div>
                            </td>

                        </tr>
                    </c:forEach>
                    <form action="${ctx}/record/toCheckApplyList" method="post">
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
                        <div class="layui-inline">
                            <div class="layui-input-inline">
                                <input type="hidden" name="pageNum">
                            </div>
                        </div>
                    </form>
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

            form.on('select(levelOnex)', function () {
                var levelOneId = $('#levelOne').val();
                if(levelOneId == ''){
                    return;
                }else{
                    $.ajax({
                        url:'${ctx}/material/category/queryLevelTwoByLevelOne/' + levelOneId,
                        type:'get',
                        success:function (data) {
                            var html = '<option value""> -请选择- </option>';
                            var len = data.length;

                            for(var i = 0; i < len; i++){
                                html += '<option value="' + data[i].id + '">' + data[i].categoryName + '</option>';
                            }
                            $('#levelTwo').html(html);
                            form.render();
                        }
                    })
                }
            });
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