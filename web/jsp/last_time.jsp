<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/4/20
  Time: 18:52
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>最近24小时</title>
    <style type="text/css">
    </style>
</head>
<body>
<script src="${pageContext.request.contextPath}/dist/echarts.js"></script>
<script src="${pageContext.request.contextPath}/js/demo_F.js"></script>
<div id="bottom_line" style="height: 100%;width: 100%"></div>

<script>
    var xAxis_value=[0,1,2,3,4,5];//${lately_xAxis_value}
    var PM25_value=[10,30,50,40,20,15];//${lately_PM25_value}
    var PM10_value=[5,10,20,36,49,20];//${lately_PM10_value}

    var bottom_line_chart=echarts.init(document.getElementById("bottom_line"));
    var bottom_line_option={
        backgroundColor: {
            type: 'linear',
            x: 0,
            y: 0,
            x2: 1,
            y2: 1,
            colorStops: [{
                offset: 0,
                color: '#0f2c70' // 0% 处的颜色
            }, {
                offset: 1,
                color: '#091732' // 100% 处的颜色
            }],
            globalCoord: false // 缺省为 false
        },
        //指定国际标准颜色
        color:[ 'rgb(255,255,0)', 'rgb(40,181,146)'],
        grid: {
            top:"25%",
            left: '2%',
            right: '5%',
            bottom: '2%',
            containLabel: true
        },

        title:{
            text:"最近24小时",
            textStyle:{
                color:"#f3f3f3",
                fontWeight:"bold"
            },
        },
        tooltip:{trigger:'axis'},
        legend:{data:["PM2.5","PM10"],
            icon:"roundRect",
            left:"70%",top:"5.5%",
            textStyle:{
                color:"white"
            }
        },
        xAxis:{type:"category",axisLabel:{color:'white',fontWeight:"bold",formatter:"{value} 点"}, boundaryGap: false,
                data:xAxis_value,
                splitLine:{show:true,lineStyle:{width:"2",type:"solid",color:"blue"}
            }
        },
        yAxis:[{type:"value",
            splitArea:{show:true},
            axisLabel:{color:'blue',fontWeight:"bold"},},
            {
                name:"单位: pp/m2",//数量,
                nameTextStyle:{color:"white"}
            }
        ],
        series:[
            {
                name:"PM2.5",
                data:PM25_value,
                type:'line',
                areaStyle:{},
                smooth: true
            },
            {
                name:"PM10",
                data:PM10_value,
                type:'line',
                areaStyle: {},
                smooth: true
            }

        ]
    }
    bottom_line_chart.setOption(bottom_line_option)
</script>

</body>
</html>
