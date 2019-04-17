<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<html>
<head>
    <title>新增员工账号</title>
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

        <jsp:include page="${ctx}/jsp/root/headerRoot.jsp"></jsp:include>

        <div class="layui-body">
            <!-- 内容主体区域 -->

            <div id="divcss4">
                <cite style="font-size: 30px">
                    &emsp;&emsp; 新增员工账号

                </cite>
                <p style="color: green; font-size: 25px;" >${SuccessMsg}</p>
                <p style="color: red; font-size: 25px;" >${ErrorMsg}</p>
                <hr>
                <form method="post" action="${ctx}/root/toAddEmployee" class="layui-form">
                    <label id="divcss5"></label>

                    <div class="layui-form-item">
                        <label class="layui-form-label">员工账号<br>(默认姓名) </label>
                        <div class="layui-input-inline">
                            <input type="text" name="userCode" value="${addUser.userCode}" placeholder="请输入员工账号" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">员工姓名</label>
                        <div class="layui-input-inline">
                            <input type="text" name="userName" value="${addUser.userName}" placeholder="员工姓名"  autocomplete="off" class="layui-input">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label">密码</label>
                        <div class="layui-input-inline">
                            <input type="text" name="password"  value="${addUser.password}" placeholder="默认：123456"  autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">部门</label>
                        <div class="layui-input-block">
                            <select name="deptId" id="deptId" lay-filter="deptId"  >
                                <option value="" >-请选择-</option>
                                <c:forEach items="${deptIdX}" var="obj">
                                    <option value="${obj.valueId}" <c:if test="${obj.valueId eq addUser.deptId}" >selected</c:if>  >${obj.valueName }</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div><br>
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
        <jsp:include page="${ctx}/jsp/root/footerRoot.jsp"/>
    </div>




<script src="${ctx}/static/plugins/layui/layui.js"></script>
<script>
    //JavaScript代码区域
    layui.use(['element', 'form', 'jquery'], function(){
        var element = layui.element;
        var form = layui.form;
        var $ = layui.jquery;

        document.getElementById("root").className="layui-nav-item layui-nav-itemed";

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


    });


</script>
</body>
</html>
