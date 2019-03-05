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
    <title>员工后台主页</title>
    <link rel="stylesheet" href="${ctx}/static/plugins/layui/css/layui.css">
    <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body class="layui-layout-body">
    <div class="layui-layout layui-layout-admin">

        <jsp:include page="${ctx}/jsp/common/header.jsp"></jsp:include>

        <div class="layui-body">
            <!-- 内容主体区域 -->
            <div style="padding: 15px;">
                <form class="layui-form" action="${ctx}/material/repertoryList" method="get">
                    <div class="layui-inline">
                        <label class="layui-form-label">材料编号</label>
                        <div class="layui-input-inline">
                            <input type="text" name="id" value="${materialInfoDTO.id}" autocomplete="off"
                                   class="layui-input">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">材料名称</label>
                        <div class="layui-input-inline">
                            <input type="text" name="materialName" value="${materialInfoDTO.materialName}" autocomplete="off"
                                   class="layui-input">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <div class="layui-input-inline">
                            <input type="hidden" name="pageNum" value="1">
                        </div>
                    </div>
                    <!------------------------------------------------->
                    <div class="layui-inline">
                        <label class="layui-form-label">一级分类</label>
                        <div class="layui-input-block">
                            <select name="levelOne" id="levelOne" lay-filter="levelOnex">
                                <option value="">-请选择-</option>
                                <c:forEach items="${levelOneList}" var="obj">
                                    <option value="${obj.id}"
                                            <c:if test="${obj.id eq materialInfoDTO.levelOne}">selected</c:if> >${obj.categoryName }</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">二级分类</label>
                        <div class="layui-input-block">
                            <select name="levelTwo" lay-filter="levelTwo" id="levelTwo">
                                <option value="">-请选择-</option>
                            </select>
                        </div>
                    </div>
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
                        <th>材料编号</th>
                        <th>材料名称</th>
                        <th>库存数量</th>
                        <th>计量单位</th>

                        <th>所属分类（一级、二级）</th>
                        <th>操作</th>

                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${page.list}" var="obj">
                        <tr>
                            <td>${obj.id}</td>
                            <td>${obj.materialName}</td>
                            <td>${obj.materialQuantity}</td>
                            <td>${obj.materialUnit}</td>

                            <td>${obj.categoryLevel1.categoryName} -> ${obj.categoryLevel2.categoryName}</td>
                                <%--<td>--%>
                                <%--<c:if test="${obj.status eq 1}">待审核 </c:if>--%>
                                <%--<c:if test="${obj.status eq 2}">审核通过</c:if>--%>
                                <%--<c:if test="${obj.status eq 3}">审核不通过</c:if>--%>
                                <%--<c:if test="${obj.status eq 4}">已上架</c:if>--%>
                                <%--<c:if test="${obj.status eq 5}">已下架</c:if>--%>
                                <%--</td>--%>

                            <td>
                                <a href="${ctx}/app/toEdit/${obj.id}" class="layui-btn layui-btn-normal layui-btn-xs" ><i class="layui-icon" style="font-size: 20px" >&#xe642</i></a>
                                <a href="${ctx}/app/delete/${obj.id}" class="layui-btn layui-btn-danger layui-btn-xs" ><i class="layui-icon" style="font-size: 20px" >&#xe640</i></a>
                                <a href="${ctx}/app/queryById/${obj.id}" class="layui-btn                  layui-btn-xs" ><i class="layui-icon" style="font-size: 20px" >&#xe615</i></a>
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

        });





    </script>
</div>x
</body>
</html>