<%--
  Created by IntelliJ IDEA.
  User: MECHREVO
  Date: 2020/5/20
  Time: 12:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>权限不足</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/working.css" />
</head>
<body>
<div id="mainbox">
    <div id="text">
        <p>
        <h1>${msg}</h1></p>
    </div>
    <div id="show"></div>
</div>
<script>
    var t = 3;
    setInterval("refer()", 1000);

    function refer() {
        if(t == 0) {
            window.location.href = "${pageContext.request.contextPath}/login";
        }
        document.getElementById('show').innerHTML = "" + t + "秒后跳转登录";
        t--;
    }
</script>
</body>
</html>
