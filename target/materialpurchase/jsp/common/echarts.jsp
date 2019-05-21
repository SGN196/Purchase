<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="shiro" uri="/WEB-INF/tlds/shiros.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fns" uri="/WEB-INF/tlds/fns.tld" %>
<%@ taglib prefix="sys" tagdir="/WEB-INF/tags/sys" %>
<%@ taglib prefix="act" tagdir="/WEB-INF/tags/act" %>
<%@ taglib prefix="table" tagdir="/WEB-INF/tags/table" %>
<%@ taglib prefix="t" uri="/menu-tags"%>
<html>
<head>
	<meta charset="utf-8">
	<title>ECharts111</title>
	<meta name="decorator" content="ani"/>






</head>
<body class="bg-white">
<link rel="stylesheet" href="${ctx}/static/plugins/layui/theme.default/layer.css">
<link rel="stylesheet" href="${ctx}/static/plugins/toastr/toastr.css">
<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
<div id="main" style="width: 100%;height: 100%"></div>
<script src="${ctx}/static/plugins/jQuery/jquery-1.8.3.js"></script>
<!-- 引入 echarts.js -->
<script src="${ctx}/static/plugins/echarts3/echarts.min.js"></script>
<%--<script src="${ctx}/static/plugins/jeeplus/vendor.js"></script>--%>
<script src="${ctx}/static/layui/layer/layer.js"></script>
<script src="${ctx}/static/plugins/toastr/toastr.min.js"></script>
<script src="${ctx}/static/plugins/jeeplus/jeeplus.js"></script>
<script type="text/javascript">
    // 基于准备好的dom，初始化echarts实例4
    var myChart = echarts.init(document.getElementById('main'));
    window.onresize = myChart.resize;
    $(function () {

        jp.get("${ctx}${dataURL}", function (option) {
            // 指定图表的配置项和数据
            // 使用刚指定的配置项和数据显示图表。
            myChart.setOption(option);
            alert(22);
        })
    })


</script>
</body>
</html>