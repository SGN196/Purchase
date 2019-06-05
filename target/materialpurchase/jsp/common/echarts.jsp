<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <!-- 引入 ECharts 文件 -->
    <script src="${ctx}/static/xxx/echarts.min.js"></script>
    <script src="${ctx}/static/plugins/jQuery/jquery-1.8.3.js"></script>
    <link rel="stylesheet" href="${ctx}/static/plugins/layui/css/layui.css">
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <jsp:include page="${ctx}/jsp/common/header.jsp"></jsp:include>
    <!-- 为ECharts准备一个具备大小（宽高）的Dom -->
    <div id="echart" style="margin-left:255px; margin-top:55px; height:450px; width:950px;">

    </div>
    <jsp:include page="${ctx}/jsp/common/footer.jsp"/>
</div>
<script src="${ctx}/static/plugins/layui/layui.js"></script>
<script>

    var echarts = echarts.init(document.getElementById('echart'));

    initEcharts();

    function initEcharts() {
        echarts.clear();
        echarts.showLoading({text: '正在努力的读取数据中...'});
        $.ajax({
            url: '${ctx}/material/option',
            type: "post",
            success: function (data) {
                var option = eval("(" + data + ")");
                echarts.setOption(option);
                echarts.hideLoading();
            }


        })

    }


    layui.use(['element', 'form', 'jquery'], function () {
        var element = layui.element;
        var form = layui.form;
        var $ = layui.jquery;

        $('#layerDemo .layui-btn').on('click', function () {
            var othis = $(this), method = othis.data('method');
            active[method] ? active[method].call(this, othis) : '';
        });

    });
</script>
</body>
</html>