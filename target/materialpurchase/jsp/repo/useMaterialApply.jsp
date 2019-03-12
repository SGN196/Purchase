<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<html>
<head>
    <title>领用物资申请</title>
    <link rel="stylesheet" href="${ctx}/static/plugins/layui/css/layui.css">
    <style>
        #divcss4{
            left: 50%;
            top: 50%;
            position: absolute;

            transform: translate(-50%,-50%);
        }
        #divcss5{
            left: 50%;
            top: 20%;
            position: absolute;

            transform: translate(-50%,-50%);
            font-size: 30px;
        }
    </style>

</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">

    <jsp:include page="/jsp/common/header.jsp"></jsp:include>
    
    <div class="layui-body">
        <!-- 内容主体区域 -->
        <label id="divcss5">领用物资</label>
        <div id="divcss4">

            <form method="get" action="${ctx}/material/addMaterial" class="layui-form">
                <div class="layui-form-item">
                    <label class="layui-form-label">领用人</label>
                    <div class="layui-input-inline">
                        <label >${sessionScope.userInfo.userName}</label>
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">一级分类</label>
                    <div class="layui-input-block">
                        <select name="categoryLevel1.id" id="levelOne" lay-filter="levelOnex"  >
                            <option value="" >-请选择-</option>
                            <c:forEach items="${levelOnex}" var="obj">
                                <option value="${obj.id}" <c:if test="${obj.id eq materialInfoTemp.levelOne}" >selected</c:if>  >${obj.categoryName }</option>
                            </c:forEach>
                        </select>
                    </div>
                </div><br>
                <div class="layui-inline">
                    <label class="layui-form-label">二级分类</label>
                    <div class="layui-input-block">
                        <select name="categoryLevel2.id" lay-filter="levelTwox" id="levelTwo">
                            <option value="">-请选择-</option>
                        </select>
                    </div>
                </div>
                <br>
                <div class="layui-inline">
                    <label class="layui-form-label">物品名称</label>
                    <div class="layui-input-block">
                        <select name="materialName" lay-filter="materialNamex" id="materialName">
                            <option value="">-请选择-</option>
                        </select>
                    </div>
                </div>
                <br>

                <div class="layui-form-item">
                    <label class="layui-form-label">计量单位</label>
                    <div class="layui-input-inline">
                        <label id="materialUnit"></label>
                    </div>
                </div>

                <!------------------------------------------------->





                <%-------------------------------------------------%>
                <div class="layui-form-item">
                    <label class="layui-form-label">申请原因</label>
                    <%--<div class="layui-input-inline">--%>
                        <%--<input type="textarea" name="materialInfo" placeholder="请输入物资简介" autocomplete="off" class="layui-input">--%>
                        <%--<textarea cols="30" rows="10"--%>
                    <%--</div>--%>
                    <div class="layui-input-block">
                        <textarea name="materialInfo" placeholder="请输入申请原因"   class="layui-textarea">${materialInfoTemp.materialInfo}</textarea>
                    </div>
                </div>
                <div style="text-align: center">
                    <p style="color: green; " >${addMaterialMsg}</p>
                    <p style="color: red;" >${ErraddMaterialMsg}</p>
                </div>
                <br>
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>

                    </div>

                </div>
            </form>

        </div>
    </div>

    <!-- 底部固定区域 -->
    <jsp:include page="/jsp/common/footer.jsp"/>

</div>
<script src="${ctx}/static/plugins/layui/layui.js"></script>
<script>
    //JavaScript代码区域
    layui.use(['element', 'form', 'jquery'], function(){
        var element = layui.element;
        var form = layui.form;
        var $ = layui.jquery;

        document.getElementById("useApply").className="layui-nav-item layui-nav-itemed";

        form.on('select(levelOnex)', function () {
            var levelOneId = $('#levelOne').val();
            if(levelOneId == ''){
                return;
            }else {
                $.ajax({
                    url:'${ctx}/material/category/queryLevelTwoByLevelOne/' + levelOneId,
                    type:'get',
                    success:function (data) {
                        var html = '<option value="" >-请选择-</option>';
                        var len = data.length;
                        for(var i = 0; i < len; i++) {
                            html += '<option value="' + data[i].id + '">' + data[i].categoryName + '</option>';
                        }
                        $('#levelTwo').html(html);
                        form.render();
                    }

                });
            }
        });
        form.on('select(levelTwox)', function () {
            var levelTwoId = $('#levelTwo').val();
            if(levelTwoId == ''){
                return;
            }else{
                $.ajax({
                    url:'${ctx}/material/category/queryMaterialNameByLevelTwo/' + levelTwoId,
                    type:'get',
                    success:function (data) {
                        var html = '<option value="" >-请选择-</option>';
                        var len = data.length;
                        for(var i = 0; i < len; i++) {
                            html += '<option value="' + data[i].id + '">' + data[i].materialName + '</option>';
                        }
                        $('#materialName').html(html);
                        form.render();
                    }

                });
            }

        });

        form.on('select(materialNamex)', function () {
            var materialId = $('#materialUnit').val();
            if(materialId == ''){
                return;
            }else{
                $.ajax({
                    url:'${ctx}/material/category/queryUnitById/' + materialId,
                    type:'get',
                    success:function (data) {
                        var html = data;
                        var len = data.length;

                        $('#materialUnit').html(html);
                        form.render();
                    }

                });
            }

        });

    });


</script>

</body>
</html>
