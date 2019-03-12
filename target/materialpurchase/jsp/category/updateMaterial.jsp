<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>材料属性修改</title>
    <link rel="stylesheet" href="${ctx}/static/plugins/layui/css/layui.css">
    <style>
        #divcss4{
            left: 50%;
            top: 50%;
            position: absolute;

            transform: translate(-50%,-50%);
        }
    </style>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">

    <jsp:include page="/jsp/common/header.jsp"></jsp:include>
    
    <div class="layui-body">
        <div id="divcss4">
            <div class="layui-form-item">
                <label class="layui-form-label">材料编号</label>
                <div class="layui-input-inline">
                    <%--<input type="la" name="materialName" value="${materialInfoDTO.materialName}" autocomplete="off"--%>
                    <%--class="layui-input">--%>
                    <label >${updateMaterialDTO.id}</label>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">材料名称</label>
                <div class="layui-input-inline">
                    <%--<input type="la" name="materialName" value="${materialInfoDTO.materialName}" autocomplete="off"--%>
                    <%--class="layui-input">--%>
                    <label >${updateMaterialDTO.materialName}</label>
                </div>
            </div>
            <form class="layui-form" action="${ctx}/material/updateMaterial" method="get">

                <input type="hidden"  name="id" value="${updateMaterialDTO.id}"/>
                <input type="hidden"  name="materialName" value="${updateMaterialDTO.materialName}"/>



                <div class="layui-form-item">
                    <label class="layui-form-label">计量单位</label>
                    <div class="layui-input-inline">
                        <input type="text" name="materialUnit" value="${updateMaterialDTO.materialUnit}" autocomplete="off"
                               class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">一级分类</label>
                    <div class="layui-input-block">
                        <select name="levelOne" id="levelOne" lay-filter="levelOnex">
                            <option value="">-请选择-</option>
                            <c:forEach items="${levelOneList}" var="obj">
                                <option value="${obj.id}" <c:if test="${obj.id eq updateMaterialDTO.levelOne}">selected</c:if> >
                                        ${obj.categoryName }
                                </option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">二级分类</label>
                    <div class="layui-input-block">
                        <select name="levelTwo" lay-filter="levelTwo" id="levelTwo">
                            <option value="">-请选择-</option>
                        </select>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">物资简介</label>
                    <%--<div class="layui-input-inline">--%>
                    <%--<input type="textarea" name="materialInfo" placeholder="请输入物资简介" autocomplete="off" class="layui-input">--%>
                    <%--<textarea cols="30" rows="10"--%>
                    <%--</div>--%>
                    <div class="layui-input-block">
                        <textarea name="materialInfo" placeholder="请输入物资简介"   class="layui-textarea">${updateMaterialDTO.materialInfo}</textarea>
                    </div>
                </div>
                <div style="text-align: center">
                    <p style="color: green; " >${updateMaterialMsg}</p>
                    <p style="color: red;" >${ErrUpdateMaterialMsg}</p>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit="" lay-filter="demo1">立即修改</button>
                        <a href="${ctx}/material/repertoryList"><button class="layui-btn" >返回</button></a>
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

        document.getElementById("materialList").className="layui-nav-item layui-nav-itemed";

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
</body>
</html>
