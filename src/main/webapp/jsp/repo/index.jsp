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
    <title>库存查询</title>
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
                    <%--<div class="layui-input-block">--%>
                        <%--<a class="layui-btn" lay-submit="" lay-filter="demo1" href="${ctx}/material/toAddMaterial">新增物资种类</a>--%>
                    <%--</div>--%>

                </form>

                <hr>
                <table class="layui-table">
                    <thead>
                    <tr>
                        <th>材料编号</th>
                        <th>材料名称</th>
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
                                <div class="site-demo-button" id="layerDemo" style="margin-bottom: 0;">
                                    <a href="${ctx}/material/toUpdateMaterial/${obj.id}" data-method="notice" class="layui-btn layui-btn-normal layui-btn-xs" ><i class="layui-icon" style="font-size: 20px" >&#xe642</i></a>


                                    <a href="${ctx}/app/delete/${obj.id}" class="layui-btn layui-btn-danger layui-btn-xs" ><i class="layui-icon" style="font-size: 20px" >&#xe640</i></a>
                                    <a href="${ctx}/app/queryById/${obj.id}" class="layui-btn layui-btn-xs" ><i class="layui-icon" style="font-size: 20px" >&#xe615</i></a>
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

    <div>
        <!-- 底部固定区域 -->
        <jsp:include page="${ctx}/jsp/common/footer.jsp"/>
    </div>
    <script src="${ctx}/static/plugins/layui/layui.js"></script>
    <script>
        layui.use(['element', 'form', 'jquery'], function() {
            var element = layui.element;
            var form = layui.form;
            var $ = layui.jquery;

            document.getElementById("materialList").className="layui-nav-item layui-nav-itemed";

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


            //模态框 失败
            <%--var active = {--%>
                <%--notice: function(){--%>
                    <%--//示范一个公告层--%>
                    <%--layer.open({--%>
                        <%--type: 1--%>
                        <%--,title: false //false不显示标题栏--%>
                        <%--,closeBtn: false--%>
                        <%--,area: '500px;'--%>
                        <%--,shade: 0.8--%>
                        <%--,id: 'LAY_layuipro' //设定一个id，防止重复弹出--%>
                        <%--,btn: ['确定', '取消']--%>
                        <%--,btnAlign: 'c'--%>
                        <%--,moveType: 1 //拖拽模式，0或者1--%>
                        <%--,content: '<div style="padding: 50px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;">' +--%>
                        <%--'<div style="text-align: center; font-size: 25px;">修改材料信息<br><br></div>' +--%>
                        <%--'                <div class="layui-form-item">\n' +--%>
                        <%--'                    <label class="layui-form-label">计量单位</label>\n' +--%>
                        <%--'                    <div class="layui-input-inline">\n' +--%>
                        <%--'                        <input type="text" name="materialUnit" value="${materialInfoDTO.materialUnit}" placeholder="计量单位"  autocomplete="off" class="layui-input">\n' +--%>
                        <%--'                    </div>\n' +--%>
                        <%--'                </div>\n' +--%>
                        <%--'                <!------------------------------------------------->\n' +--%>
                        <%--'                <div class="layui-inline">\n' +--%>
                        <%--'                    <label class="layui-form-label">一级分类</label>\n' +--%>
                        <%--'                    <div class="layui-input-block">\n' +--%>
                        <%--'                        <select name="categoryLevel1.id" id="levelOne" lay-filter="levelOnex"  >\n' +--%>
                        <%--'                            <option value="" >-请选择-</option>\n' +--%>
                        <%--'                            <c:forEach items="${levelOnex}" var="obj">\n' +--%>
                        <%--'                                <option value="${obj.id}" <c:if test="${obj.id eq materialInfoDTO.categoryLevel1.id}" >selected</c:if>  >${obj.categoryName }</option>\n' +--%>
                        <%--'                            </c:forEach>\n' +--%>
                        <%--'                        </select>\n' +--%>
                        <%--'                    </div>\n' +--%>
                        <%--'                </div><br>\n' +--%>
                        <%--'                <div class="layui-inline">\n' +--%>
                        <%--'                    <label class="layui-form-label">二级分类</label>\n' +--%>
                        <%--'                    <div class="layui-input-block">\n' +--%>
                        <%--'                        <select name="categoryLevel2.id" lay-filter="levelTwo" id="levelTwo">\n' +--%>
                        <%--'                            <option value="">-请选择-</option>\n' +--%>
                        <%--'                        </select>\n' +--%>
                        <%--'                    </div>\n' +--%>
                        <%--'                <div class="layui-form-item">\n' +--%>
                        <%--'                    <label class="layui-form-label">物资简介</label>\n' +--%>
                        <%--'                    &lt;%&ndash;<div class="layui-input-inline">&ndash;%&gt;\n' +--%>
                        <%--'                        &lt;%&ndash;<input type="textarea" name="materialInfo" placeholder="请输入物资简介" autocomplete="off" class="layui-input">&ndash;%&gt;\n' +--%>
                        <%--'                        &lt;%&ndash;<textarea cols="30" rows="10"&ndash;%&gt;\n' +--%>
                        <%--'                    &lt;%&ndash;</div>&ndash;%&gt;\n' +--%>
                        <%--'                    <div class="layui-input-block">\n' +--%>
                        <%--'                        <textarea name="materialInfo" placeholder="请输入物资简介"   class="layui-textarea">${materialInfoTemp.materialInfo}</textarea>\n' +--%>
                        <%--'                    </div>\n' +--%>
                        <%--'                </div>' +--%>
                        <%--'            </div>' +--%>
                            <%--// '<div style="position: absolute">计量单位：<input type="text"></input><br></div>' +--%>
                            <%--// '一级分类：' +--%>
                            <%--// '二级分类：' +--%>
                            <%--// '' +--%>
                            <%--'</div>'--%>
                        <%--,success: function(layero){--%>
                            <%--var btn = layero.find('.layui-layer-btn');--%>
                            <%--btn.find('.layui-layer-btn0').attr({--%>
                                <%--href: 'http://www.layui.com/'--%>
                                <%--,target: '_blank'--%>
                            <%--});--%>
                        <%--}--%>
                    <%--});--%>
                <%--}--%>

            <%--};--%>



            $('#layerDemo .layui-btn').on('click', function(){
                var othis = $(this), method = othis.data('method');
                active[method] ? active[method].call(this, othis) : '';
            });

        });





    </script>
</div>
</body>
</html>