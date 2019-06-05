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
    <title>甲方需求列表</title>
    <link rel="stylesheet" href="${ctx}/static/plugins/layui/css/layui.css">
    <style>
        #divcss4{
            text-align: center;
        }
    </style>
</head>
<body class="layui-layout-body">
    <div class="layui-layout layui-layout-admin">
        <jsp:include page="${ctx}/jsp/customer/common/headerCustomer.jsp"></jsp:include>
        <div class="layui-body">
                <!-- 内容主体区域 -->
            <div id="divcss4">
                <div >
                    <cite style="font-size: 40px">甲方需求列表
                       <p style="color: red">${errorMsg}</p>
                       <p style="color: green">${successMsg}</p>
                    </cite>
                </div>
                <div style="padding: 15px;">
                    <form class="layui-form" action="${ctx}/bid/toQuoteList" method="get">
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
                        </div><br>
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
                            <label class="layui-form-label">负责人</label>
                            <div class="layui-input-inline">
                                <input type="text" name="userName" value="${quoteInfo.userName}" autocomplete="off"
                                       class="layui-input"/>
                            </div>
                        </div>
                        <br>
                        <div class="layui-inline">
                            <div class="layui-input-block">
                                <button class="layui-btn" lay-submit="" lay-filter="demo1">立即查询</button>
                            </div>
                        </div>
                    </form>
                </div>
                <hr>
                <table class="layui-table">
                    <thead>
                    <tr>
                        <th>采购需求单编号</th>
                        <th>材料标号</th>
                        <th>材料名称</th>
                        <th>采购数量</th>
                        <th>状态</th>
                        <th>截止日期</th>
                        <%--<th>是否参与</th>--%>
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
                                    <c:if test="${obj.quoteStatus eq 1}">采购中</c:if>
                            </td>
                            <td>${obj.quoteEndtime}</td>
                            <%--<td>${obj.userName}</td>--%>
                            <td>
                                <div class="site-demo-button" id="layerDemo" style="margin-bottom: 0;">
                                    <button type="button" onclick="openModak(this)" class="layui-btn layui-btn-radius layui-btn-normal">开始竞价</button>
                                    <a href="" class="layui-btn layui-btn-xs" ><i class="layui-icon" style="font-size: 20px" >&#xe615</i></a>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                    <form action="${ctx}/bid/toQuoteList" method="post">
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
    <script type="text/javascript" src="${ctx}/static/plugins/layui/layui.js"></script>
    <script type="text/javascript" src="${ctx}/static/plugins/jQuery/jquery-3.3.1.js"></script>
    <script>
        function openModak(obj){

            var quoteId = $(obj).parent().parent().prev().prev().prev().prev().prev().prev().html().trim();

            $("[name='quoteId']").val(quoteId); //向模态框中赋值(与name属性值相关）

            layui.use(['layer'],function () {
                var layer = layui.layer,$=layui.$;
                layer.open({
                    type:1,//类型
                    area:['450px','350px'],//定义宽和高
                    title:'订单报价',//题目
                    shadeClose:false,//点击遮罩层关闭
                    content: $('#ModalFrame')//打开的内容
                });
            })
        }

        layui.use(['laydate', 'element', 'form', 'jquery'], function() {
            var element = layui.element;
            var form = layui.form;
            var $ = layui.jquery;
            var laydate = layui.laydate;

            laydate.render({
                elem: '#test11'
                ,format: 'yyyy年MM月dd日'
            });


            document.getElementById("bidList").className="layui-nav-item layui-nav-itemed";


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

        // $("#ModalFrame").click(function(){
        //     var cash = $("#bid_total_price").val();
        //     if(cash == "" || cash == null){
        //         alert('111111');
        //         return false;
        //     }
        // })
        function checkForm(){
            var cash = document.getElementById("userid").value;
            alert(cash);
            console.log(cash);
            if(cash == ""){
                alert("价格不能为空");
                return false;
            }
            alert("提交成功");
            return true;
        }
    </script>

</body>
</html>

<div id="ModalFrame"  style="display: none;">

    <form class="layui-form" onsubmit="return checkForm()" action="${ctx}/bid/addBid">

            <div class="layui-inline">
                <label class="layui-form-label">订单编号</label>
                <div class="layui-input-inline">
                    <input type="text" name="quoteId" disabled="disabled"  id="quoteId" autocomplete="off"
                           class="layui-input"/>
                </div>
            </div><br>
            <input type="hidden" name="quoteId" value="${quoteId}">
            <div class="layui-inline">
                <label class="layui-form-label">你的报价</label>
                <div class="layui-input-inline">
                    <input type="text" name="bidTotalPrice" id="bid_total_price"  autocomplete="off"
                           class="layui-input"/>
                </div>
            </div>
            <span></span>
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">预计交货日期</label>
                    <div class="layui-input-inline">
                        <input name="tempTime" type="text" class="layui-input" id="test11" placeholder="yyyy年MM月dd日">
                    </div>
                </div>
            </div>
            <div class="layui-inline">
                <div class="layui-input-block">
                    <button class="layui-btn" id="commitButton" lay-submit="" lay-filter="demo1">立即提交</button>
                </div>
            </div>

    </form>

</div>