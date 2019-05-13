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
    <title>采购需求管理</title>
    <link rel="stylesheet" href="${ctx}/static/plugins/layui/css/layui.css">
    <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
    <style>
        #divcss4{
            text-align: center;
        }
        #divcss5{

            top: 20%;


            transform: translate(-50%,-50%);
            font-size: 50px;
        }
    </style>
</head>
<body class="layui-layout-body">
    <div class="layui-layout layui-layout-admin">

        <jsp:include page="${ctx}/jsp/common/header.jsp"></jsp:include>

        <div class="layui-body">


                <!-- 内容主体区域 -->
            <div id="divcss4">
                <div >
                    <cite style="font-size: 40px">采购需求管理</cite>
                </div>

                <div style="padding: 15px;">
                    <form class="layui-form" action="${ctx}/purchase/toPurchaseList" method="get">
                        <div class="layui-inline">
                            <label class="layui-form-label">订单编号</label>
                            <div class="layui-input-inline">
                                <input type="text" name="id" value="${quoteInfo.id}" autocomplete="off"
                                       class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">材料标号</label>
                            <div class="layui-input-inline">
                                <input type="text" name="materialId" value="${quoteInfo.materialId}" autocomplete="off"
                                       class="layui-input"/>
                            </div>
                        </div>
                        <br>
                        <div class="layui-inline">
                            <div class="layui-input-inline">
                                <input type="hidden" name="pageNum" value="1">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">材料名称</label>
                            <div class="layui-input-inline">
                                <input type="text" name="materialName" value="${quoteInfo.materialName}" autocomplete="off"
                                       class="layui-input"/>
                            </div>
                        </div>

                        <div class="layui-inline">
                            <label class="layui-form-label">采购状态</label>
                            <div class="layui-input-block">
                                <select name="quoteStatus" id="levelOne" lay-filter="levelOnex">
                                    <option value="">请选择</option>
                                    <option <c:if test="${1 eq quoteInfo.quoteStatus}">selected</c:if> value="1">采购中</option>
                                    <option <c:if test="${0 eq quoteInfo.quoteStatus}">selected</c:if> value="0">采购完成</option>
                                    <option <c:if test="${88 eq quoteInfo.quoteStatus}">selected</c:if> value="88">采购失败</option>
                                    <%--<c:if test="${obj.id eq materialInfoDTO.levelOne}">selected</c:if> >${obj.categoryName }</option>--%>

                                </select>
                            </div>
                        </div>     <br>
                        <div class="layui-inline">
                            <label class="layui-form-label">负责人</label>
                            <div class="layui-input-inline">
                                <input type="text" name="userName" value="${quoteInfo.userName}" autocomplete="off"
                                       class="layui-input"/>
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
                </div>


                    <hr>
                <table class="layui-table">
                    <thead>
                    <tr>
                        <th>需求编号</th>
                        <th>材料标号</th>
                        <th>材料名称</th>
                        <th>采购数量</th>
                        <th>状态</th>
                        <th>截止日期</th>
                        <th>负责人</th>
                        <th>操作</th>


                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${page.list}" var="obj">
                        <tr>
                            <td>${obj.id}</td>
                            <td>${obj.materialId}</td>
                            <td>${obj.materialName}</td>
                            <td>${obj.quoteQuantity}</td>
                            <td>
                                    <c:if test="${obj.quoteStatus eq 0}"><p style="color: green">采购成功</p>  </c:if>
                                    <c:if test="${obj.quoteStatus eq 1}">采购中</c:if>
                                    <c:if test="${obj.quoteStatus eq 99}"><p style="color: red">审核失败</p> </c:if>

                            </td>
                            <td>${obj.quoteEndtime}</td>
                            <td>${obj.userName}</td>
                            <td>
                                <div class="site-demo-button" id="layerDemo" style="margin-bottom: 0;">
                                    <a href="${ctx}" data-method="notice" class="layui-btn layui-btn-normal layui-btn-xs" ><i class="layui-icon" style="font-size: 20px" >&#xe642</i></a>


                                    <a href="${ctx}/bid/deleteById/${obj.id}" class="layui-btn layui-btn-danger layui-btn-xs" ><i class="layui-icon" style="font-size: 20px" >&#xe640</i></a>
                                    <a href="" class="layui-btn layui-btn-xs" ><i class="layui-icon" style="font-size: 20px" >&#xe615</i></a>
                                </div>
                            </td>

                        </tr>
                    </c:forEach>
                    <form action="${ctx}/record/toMyApplyList/${sessionScope.userInfo.id}" method="post">
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

            document.getElementById("purchase").className="layui-nav-item layui-nav-itemed";

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