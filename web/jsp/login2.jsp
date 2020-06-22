
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="${pageContext.request.contextPath}/css/style2.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="${pageContext.request.contextPath}/css/rotating.css" rel="stylesheet" type="text/css" media="all"/>

</head>
<div id="particles-js">
    <div class="main">
        <h1>登录注册表单切换</h1>
        <div class="w3_login">
            <div class="w3_login_module">
                <div class="module form-module">
                    <div class="toggle">
                        <i class="fa fa-times fa-pencil"></i>
                        <div class="tooltip">点击切换</div>
                    </div>
                    <div class="form">
                        <h2>登录账号</h2>
                        <%--                    <form action="../login.do" method="post">--%>
                        <form id="login_form" onsubmit="false">
                            <input type="text" id="login_nick" name="login_nick" placeholder="用户名" required=" "/>
                            <input type="password" id="login_password" name="login_password" placeholder="密码"
                                   required=" "/>
                            <input type="button" class="input_btn" value="登录" name="Submit" id="login_btn" onclick="login_ajax()">
                        </form>
                    </div>
                    <div class="form">
                        <h2>创建一个账号</h2>
                        <form  id="register_form" onsubmit="false">
                            <ul>
                                <li>
                                    <span id="reg_nick_res" style="color: red"></span>
                                    <input type="text" id="reg_nick" name="reg_nick" placeholder="用户名" required=" "
                                           maxlength="16"/>
                                </li>
                                <li>
                                    <span id="reg_password_res" style="color: red"></span>
                                    <input type="password" id="reg_password" name="reg_password" placeholder="密码"
                                           required=" " maxlength="16"/>
                                </li>
                                <input type="email" id="reg_Email" name="reg_Email" placeholder="Email" required=" "/>
                                <input type="text" id="reg_Phone" name="reg_Phone" placeholder="电话" required=" "/>
                                <label for="grade">等级</label>
                                <select id="grade">
                                    <option value="0">游客</option>
                                    <option value="1">一级</option>
                                </select>
                                <%--                                <input type="submit" value="注册"  />--%>
                                <input type="button" id="register_btn" value="注册"/>
                            </ul>
                        </form>
                    </div>
                    <div class="cta"><a href="#">忘记密码?</a></div>
                </div>
            </div>
        </div>
    </div>
    <div class="sk-rotating-plane"></div>
</div>

<script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
<script src="${pageContext.request.contextPath}/js/particles.min.js"></script>
<script src="${pageContext.request.contextPath}/js/app.js"></script>
<script src="${pageContext.request.contextPath}/js/func.js"></script>

<script>
    function login_ajax() {
        var login_nick = $("#login_nick").val();
        var login_password = $("#login_password").val();

        if (login_nick.length < 4) {
            alert("用户名至少4位");
        } else {
            if (login_password.length < 6) {
                alert("密码至少6位")
            } else {
                $.post("${pageContext.request.contextPath}/login", {
                    nickname: login_nick,
                    password: login_password
                }, function (data) {
                    $(".w3_login_module").addClass("active");
                    setTimeout(function(){
                        $(".sk-rotating-plane").addClass("active");
                        $(".w3_login_module").css("display","none");
                    },500)
                    setTimeout(function(){
                        $(".w3_login_module").removeClass("active");
                        $(".sk-rotating-plane").removeClass("active");
                        $(".w3_login_module").css("display","block");

                        if (data["nickExist"]) {
                            if (data['login_res'] == "T") {
                                window.location.href = "${pageContext.request.contextPath}/excel";
                            } else {
                                alert("密码输入错误");
                            }
                        } else {
                            alert("用户名不存在")
                        }
                    },3000)
                }, "json")
            }
        }
    }

    $("#register_btn").on("click",function () {
        var reg_nick = $("#reg_nick").val();
        var reg_password = $("#reg_password").val();
        var reg_Email=$("#reg_Email").val();
        var reg_Phone=$("#reg_Phone").val();
        var reg_nick_res=$("#reg_nick_res");
        var reg_password_res=$("#reg_password_res");
        if(reg_nick.length<4||reg_password.length<6){
            alert("用户名或密码不符合规则");
            reg_nick_res.html("用户名至少4位");
            reg_password_res.html("密码至少6位");
        }else{
            $.post(
                <%--"${pageContext.request.contextPath}/registered.do",--%>
                "${pageContext.request.contextPath}/register",
                {
                    "nickname":reg_nick,
                    "password":reg_password,
                    "email":reg_Email,
                    "phone":reg_Phone,
                },function (info) {
                    if (info["res"]){
                        alert("注册成功");
                        window.location.href="${pageContext.request.contextPath}/login"
                    }else {
                        alert("注册失败");
                    }
                },"json")
        }
    })

    $("#reg_nick").on("blur",function () {
        var reg_nick = $("#reg_nick").val();
        var reg_nick_res=$("#reg_nick_res");
        if (reg_nick.length < 4){
            reg_nick_res.html("用户名至少4位");
        }else{
            $.post("${pageContext.request.contextPath}/registered.nick",{reg_nick:reg_nick},function (data) {
                if (data['res_nick']){
                    reg_nick_res.html("用户名可以注册");
                    reg_nick_res.css("color","green");
                }else{
                    reg_nick_res.html("用户名已经被使用");
                }
            },"json")
        }
    });

</script>

</body>
</html>
