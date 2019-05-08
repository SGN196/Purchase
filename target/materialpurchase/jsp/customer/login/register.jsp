<%--
  Created by IntelliJ IDEA.
  User: 11212
  Date: 2018/12/11
  Time: 10:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>友商注册界面</title>
    <link rel="stylesheet" href="${ctx}/static/plugins/bootstrap-3.3.7-dist/css/bootstrap.css">
    <style>
        #divcss1 {

            border-radius: 20px;
            left: 50%;
            top: 50%;
            position: absolute;
            transform: translate(-50%, -50%);
        }

        body {
            background-image: url("${ctx}/static/plugins/layui/images/back01.jpg");
            background-size: cover;
        }
    </style>
</head>
<body>
<div id="divcss1">
    <div style="text-align: center">
        <h1>注册</h1>
        <form class="form-inline" action="${ctx}/customer/customerRegister" onsubmit="return checkForm();" method="post">
            <div class="form-group ">
                <label>用&nbsp;户&nbsp;名</label>
                <input class="form-control" type="text" id="devCode" name="devCode" onblur="DevCodeQuery()"
                       placeholder="请输入用户名">

                <div id="prompt"></div>
            </div>
            <br>
            <div class="form-group">
                <label>密&emsp;&emsp;码</label>
                <input class="form-control" id="devPassword1" type="password" name="devPassword" placeholder="请输入密码"
                       autocomplete="off">

                <div id="prompt3"></div>
            </div>
            <br>
            <div class="form-group">
                <label>确认密码</label>
                <input class="form-control" id="devPassword2" type="password" onblur="CheckPassword()"
                       placeholder="请再次输入密码" autocomplete="off">

                <div id="prompt2"></div>
            </div>
            <br>
            <div class="form-group">
                <label>昵&emsp;&emsp;称</label>
                <input class="form-control" type="text" id="devName" name="devName" placeholder="请输入昵称"
                       autocomplete="off">

                <div id="prompt4"></div>
            </div>
            <br>

            <button class="btn btn-default" type="submit" onclick="">注册</button>
            <button class="btn btn-default" type="reset">重置</button>

        </form>

    </div>
</div>


</body>
<script src="${ctx}/static/plugins/jQuery/jquery-3.3.1.js"></script>
<script src="${ctx}/static/plugins/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
<script type="text/javascript">
    function DevCodeQuery() {
        var devCode = $('#devCode').val();
        $.ajax({
            url: '${ctx}/dev/devcodeIsExist/' + devCode,
            type: 'post',
            success: function (data) {
                if (data == 1) {
                    $('#prompt').html('<p style="color: red">当前用户名已经存在</p>');
                } else {
                    $('#prompt').html('<p style="color: green">当前用户名可以使用</p>');
                }

            }
        });
    };

    function CheckPassword() {
        var userpassword01 = document.getElementById('devPassword1').value
        var userpassword02 = document.getElementById('devPassword2').value
        if (userpassword01 != userpassword02) {
            $('#prompt2').html('<p style="color: red">两次密码不一致</p>');
        }
        if (userpassword01 == userpassword02) {
            $('#prompt2').html('<p style="color: green"></p>');
        }
    };

    function checkForm() {


        var usernameRegex = /^\w{3,15}$/;
        var passwordRegex = /^\w{6,12}$/;


        var username = document.getElementById("devCode").value;
        var password1 = document.getElementById('devPassword1').value;
        var password2 = document.getElementById('devPassword2').value;
        var devname = document.getElementById('devName').value;
        if (username == null || password1 == null || password2 == null || devname == null) {
            alert("用户信息未填完");
            return false;
        }
        if (usernameRegex.test(username)) {   //判断用户名是否符合正则表达式
            alert('用户名至少为6位');
            return false;
        }
        if (password1 != password2) { //判断密码一致
            alert('两次密码不一致')
            return false;
        }
        var flag = 0;
        if (username != null) {
            $.ajax({
                url: '${ctx}/dev/devcodeIsExist/' + username,
                type: 'post',
                success: function (data) {
                    alert(data);
                    if (data == 1) {
                        alert('用户名已经存在')
                        return false;
                    }
                    if (data == 0) {
                        return true;
                    }
                }
            });
        }

    };



</script>
</html>
