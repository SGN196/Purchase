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

        <jsp:include page="${ctx}/jsp/customer/common/headerCustomer.jsp"></jsp:include>

        <div class="layui-body">


                <!-- 内容主体区域 -->
            <div id="divcss4">
                <div >
                   <label style="font-size: 30px;">甲方需求列表
                       <p style="color: red">${errorMsg}</p>
                       <p style="color: green">${successMsg}</p></label>
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
                        <%--<div class="layui-input-block">--%>
                        <%--<a class="layui-btn" lay-submit="" lay-filter="demo1" href="${ctx}/material/toAddMaterial">新增物资种类</a>--%>
                        <%--</div>--%>

                    </form>
                </div>


                    <hr>
                <table class="layui-table">
                    <thead>
                    <tr>
                        <th>订单编号</th>
                        <th>材料标号</th>
                        <th>材料名称</th>
                        <th>采购数量</th>
                        <th>状态</th>
                        <th>截止日期</th>
                        <th>是否参与</th>
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
                            <td>${obj.userName}</td>
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


            var quoteId = $(obj).parent().parent().prev().prev().prev().prev().prev().prev().prev().html().trim();
            $("[name='quoteId']").val(quoteId);
                                                //向模态框中赋值(与name属性值相关）

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

<div id="ModalFrame"  style="display: none;">


    <form class="layui-form" action="${ctx}/bid/addBid">


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
                    <input type="text" name="bidTotalPrice" id="test1name"  autocomplete="off"
                           class="layui-input"/>
                </div>
            </div>
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
                    <button class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
                </div>
            </div>

    </form>
</div>