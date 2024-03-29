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
    <title>友商账号管理</title>
    <link rel="stylesheet" href="${ctx}/static/plugins/layui/css/layui.css">
    <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body class="layui-layout-body">
    <div class="layui-layout layui-layout-admin">

        <jsp:include page="${ctx}/jsp/root/headerRoot.jsp"></jsp:include>

        <div class="layui-body">
            <!-- 内容主体区域 -->
            <div style="padding: 15px; text-align: center;">
                <cite style="font-size: 40px">友商账号管理</cite>
                <form class="layui-form" action="${ctx}/root/toCustomerAcount" method="get">
                    <div class="layui-inline">
                        <label class="layui-form-label">友商账号</label>
                        <div class="layui-input-inline">
                            <input type="text" name="customerCode" value="${customerInfo.customerCode}" autocomplete="off"
                                   class="layui-input">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">友商姓名</label>
                        <div class="layui-input-inline">
                            <input type="text" name="customerName" value="${customerInfo.customerName}" autocomplete="off"
                                   class="layui-input">
                        </div>
                    </div>

                    <div class="layui-inline">
                        <label class="layui-form-label">账号状态</label>
                        <div class="layui-input-inline">
                            <input type="text" name="isUse" value="${customerInfo.isUse}" autocomplete="off"
                                   class="layui-input">
                        </div>
                    </div>




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
                        <th>友商账号</th>
                        <th>友商姓名</th>
                        <th>账号状态</th>

                        <th>操作</th>

                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${page.list}" var="obj">
                        <tr>
                            <td>${obj.customerCode}</td>
                            <td>${obj.customerName}</td>

                            <td>
                                <c:if test="${obj.isUse eq 0}"><p style="color: red"> 不使用</p> </c:if>
                                <c:if test="${obj.isUse eq 1}"><p style="color: green"> 使用中</p></c:if>
                                <c:if test="${obj.isUse eq 99}"><p style="color: red"> 账号停用</p></c:if>
                            </td>

                            <td>
                                <div class="site-demo-button" id="layerDemo" style="margin-bottom: 0;">
                                    <c:if test="${obj.isUse eq 0}"> <a href="${ctx}/customer/AcountStart/${obj.id}" 	class="layui-btn layui-btn-radius">启用</a></c:if>
                                    <c:if test="${obj.isUse eq 1}"><a href="${ctx}/customer/AcountStop/${obj.id}" 	class="layui-btn layui-btn-radius layui-btn-danger">停用</a></c:if>
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

</body>
</html>