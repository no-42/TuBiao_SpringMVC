<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <!-- <script type="text/javascript"
	src="${pageContext.request.contextPath}/js/boxsize.js"></script> -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/boxsize.css"/>
    <%--	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css" />--%>
</head>
<body>
<script src="${pageContext.request.contextPath}/js/demo_F.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>

<script>
    //该页面可调用数据：data-饼图-每月aqi；yeardate-饼图-每年数据；mouthwater-饼图-每月水量；
    //yearwater-柱状-每年水量 ;mouthEl-饼图-每月用电；yearEl-柱状图-每年用电;noise-饼图-每月噪音；noiseyear-饼图-每年噪音
    <%--$(function () {--%>
    <%--    $.post("${pageContext.request.contextPath}/Ele_year",function (data) {--%>
    <%--        bar_data_info=data;--%>
    <%--        console.log("bar_data_info")--%>

    <%--        console.log(bar_data_info)--%>
    <%--    },"json")--%>
    <%--})--%>

</script>
<div id="mainbox">
    <div id="toptext"></div>
    <div id="secondtoptext"></div>
    <div id="lefttopbox">
        <jsp:include page="canves.jsp">
            <jsp:param value='${data}' name="data"/>
        </jsp:include>
    </div>
    <div id="leftbottombox">
        <jsp:include page="doughnut.jsp">
            <jsp:param value='${yeardate }' name="yeardate"/>
        </jsp:include>
    </div>
    <div id="box">
        <jsp:include page="box.jsp">
            <jsp:param value='${lately_xAxis_value }' name="xAxis_value"/>
        </jsp:include>
    </div>
    <div id="secondbox">
        <jsp:include page="last_time.jsp">
            <jsp:param value='${lately_xAxis_value }' name="xAxis_value"/>
            <jsp:param value='${lately_PM25_value }' name="PM25_value"/>
            <jsp:param value='${lately_PM10_value }' name="PM10_value"/>
        </jsp:include>
    </div>
    <div id="righttopbox">
        <jsp:include page="Total_Power.jsp">
            <jsp:param value='${mouthEl }' name="mouthEl"/>
            <jsp:param value='${yearEl }' name="yearEl"/>
        </jsp:include>
    </div>
    <div id="rightbottombox">
        <jsp:include page="Total_water_consumption.jsp">
            <jsp:param value='${mouthwater }' name="mouthwater"/>
            <jsp:param value='${yearwater }' name="yearwater"/>
        </jsp:include>
    </div>
</div>

<script>


</script>
</body>
</html>