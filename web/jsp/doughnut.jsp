<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/4/17
  Time: 14:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style type="text/css">
        #leftbottombox_pie1{
            width: 100%;
            height: 50%;

        }
        #leftbottombox_pie2{
            width: 100%;
            height: 50%;

        }
    </style>
</head>
<body>
<script src="${pageContext.request.contextPath}/dist/echarts.js"></script>
<script src="${pageContext.request.contextPath}/js/demo_F.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
<div id='canvas-holder' style="width: 100%;height: 100%" >
    <div id='leftbottombox_pie1'></div>
    <div id='leftbottombox_pie2'></div>
</div>
<script>
var leftbottombox_pie1_chart=echarts.init($("#leftbottombox_pie1")[0])
var leftbottombox_pie2_chart=echarts.init($("#leftbottombox_pie2")[0])
setInterval("doughhnut()",10000)
function doughhnut() {
    $.post("${pageContext.request.contextPath}/aqi_2",function (data ) {
        leftbottombox_pie1_f(data);
    },"json");
    $.post("${pageContext.request.contextPath}/aqi_2",function (data) {
        leftbottombox_pie2_f(data)
    },"json")
}
function leftbottombox_pie1_f(data) {
    var leftbottombox_pie_data_info=data;
    if (res_is_T(leftbottombox_pie_data_info)){
        leftbottombox_pie1_chart.clear()
        var legend_data= get_legend(leftbottombox_pie_data_info)
        leftbottombox_pie1_option={
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
            color:[ 'rgb(0,255,0)', 'rgb(255,255,0)',
                'rgb(255,128,0)', 'rgb(255,0,0)', 'rgb(193,0,193)',
                'rgb(130,0,0)', ],
            grid: {
                top:"5%",
                left: '2%',
                // right: '6%',
                bottom: '3%',
                containLabel: true
            },
            title:{
                show:true,
                text:"AQI",
                textStyle:{color:'white',fontWeight:'bold'},
                x:"12.5%",top:'32%',
                subtext:"纯属虚构",},
            legend:{show:true,
                x:"36%",y:"30%",orient:"vertical"
                ,data:legend_data,//legend_data
                textStyle:{color:'white',fontWeight:'bold'},
                icon: "circle",
                padding:10
            },
            calculable:true,
            tooltip:{ formatter: '{a} <br/>{b} : {c} ({d}%)',trigger:'item'},
            series:[
                {
                    name:'访问来源',
                    type:"pie",
                    radius:["60%","80%"],//['80%','60%'],
                    center:["20%","50%"],//第一个x的位置，y的位置
                    label: {
                        show: false,
                    },
                    emphasis: {
                        label: {
                            show: false,
                            fontSize: '14',
                        }
                    },
                    labelLine: {
                        show: false
                    },
                    data:leftbottombox_pie_data_info//leftbottombox_pie_data_info [2,2,0,1,1,0]
                }
            ],
        };
       leftbottombox_pie1_chart.setOption(leftbottombox_pie1_option)
    }else{
        $("#leftbottombox_pie1").html("数据获取异常");
    }
}
function leftbottombox_pie2_f(data) {

    if(res_is_T(data)){
        leftbottombox_pie2_chart.clear()
        var legend_data= get_legend(data)
        var leftbottombox_pie2_option={
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
            color:[ 'rgb(0,255,0)', 'rgb(255,255,0',
                'rgb(255,128,0)', 'rgb(255,0,0)', 'rgb(193,0,193)',
                'rgb(130,0,0)', ],
            grid: {
                top:"5%",
                left: '2%',
                // right: '6%',
                bottom: '0%',
                containLabel: true
            },
            title:{
                show:true,
                text:"噪音",
                textStyle:{color:'white',fontWeight:'bold'},
                x:"12.5%",top:'32%',
                subtext:"纯属虚构",},
            legend:{show:true,
                x:"36%",y:"30%",orient:"vertical"
                ,data:legend_data,//legend_data
                textStyle:{color:'white',fontWeight:'bold'},
                icon: "circle",
                padding:10
            },
            calculable:true,
            tooltip:{ formatter: '{a} <br/>{b} : {c} ({d}%)',trigger:'item'},
            series:[
                {
                    name:'访问来源',
                    type:"pie",
                    radius:["60%","80%"],//['80%','60%'],
                    center:["20%","50%"],//第一个x的位置，y的位置
                    label: {
                        show: false,
                    },
                    emphasis: {
                        label: {
                            show: false,
                            fontSize: '14',
                        }
                    },
                    labelLine: {
                        show: false
                    },
                    data:data//leftbottombox_pie_data_info [2,2,0,1,1,0]
                }
            ],
        }
        leftbottombox_pie2_chart.setOption(leftbottombox_pie2_option)
    }else{
        $("#leftbottombox_pie2").html("数据获取异常");
    }
    }
</script>

<script>
    setTimeout(function () {
        // var lefttopbox_pie1_chart=echarts.init($("#leftbottombox_pie1")[0]);
        // var lefttopbox_pie2_chart=echarts.init($("#leftbottombox_pie2")[0]);
        leftbottombox_pie1_chart.showLoading()
        leftbottombox_pie2_chart.showLoading()
        setTimeout(function () {
            leftbottombox_pie1_chart.hideLoading();
            leftbottombox_pie2_chart.hideLoading();
            doughhnut()
        },2000)
    },0)

</script>

            <%--<script>--%>
<%--    var leftbottombox_pie_data_info=${yeardate}--%>
<%--    //  [ {name:"良好",valu e:2},--%>
<%--    //     {name:"中等",value:2},--%>
<%--    //     {name:"对敏感人群不健康",value:0},--%>
<%--    //     {name:"不健康",value:1},--%>
<%--    //     {name:"非常不健康",value:1},--%>
<%--    //     {name:"有毒害",value:0},--%>
<%--    // ]--%>

<%--    if (res_is_T(leftbottombox_pie_data_info)){--%>

<%--        var legend_data= get_legend(lefttopbox_pie_data_info)--%>
<%--        var leftbottombox_pie1_chart=echarts.init(document.getElementById("leftbottombox_pie1"))--%>
<%--        leftbottombox_pie1_option={--%>
<%--            backgroundColor: {--%>
<%--                type: 'linear',--%>
<%--                x: 0,--%>
<%--                y: 0,--%>
<%--                x2: 1,--%>
<%--                y2: 1,--%>
<%--                colorStops: [{--%>
<%--                    offset: 0,--%>
<%--                    color: '#0f2c70' // 0% 处的颜色--%>
<%--                }, {--%>
<%--                    offset: 1,--%>
<%--                    color: '#091732' // 100% 处的颜色--%>
<%--                }],--%>
<%--                globalCoord: false // 缺省为 false--%>
<%--            },--%>
<%--            //指定国际标准颜色--%>
<%--            color:[ 'rgb(0,255,0)', 'rgb(255,255,0)',--%>
<%--                'rgb(255,128,0)', 'rgb(255,0,0)', 'rgb(193,0,193)',--%>
<%--                'rgb(130,0,0)', ],--%>
<%--            grid: {--%>
<%--                top:"5%",--%>
<%--                left: '2%',--%>
<%--                // right: '6%',--%>
<%--                bottom: '3%',--%>
<%--                containLabel: true--%>
<%--            },--%>
<%--            title:{--%>
<%--                show:true,--%>
<%--                text:"AQI",--%>
<%--                textStyle:{color:'white',fontWeight:'bold'},--%>
<%--                x:"12.5%",top:'32%',--%>
<%--                subtext:"纯属虚构",},--%>
<%--            legend:{show:true,--%>
<%--                x:"36%",y:"30%",orient:"vertical"--%>
<%--                ,data:legend_data,//legend_data--%>
<%--                textStyle:{color:'white',fontWeight:'bold'},--%>
<%--                icon: "circle",--%>
<%--                padding:10--%>
<%--            },--%>
<%--            calculable:true,--%>
<%--            tooltip:{ formatter: '{a} <br/>{b} : {c} ({d}%)',trigger:'item'},--%>
<%--            series:[--%>
<%--                {--%>
<%--                    name:'访问来源',--%>
<%--                    type:"pie",--%>
<%--                    radius:["60%","80%"],//['80%','60%'],--%>
<%--                    center:["20%","50%"],//第一个x的位置，y的位置--%>
<%--                    label: {--%>
<%--                        show: false,--%>
<%--                    },--%>
<%--                    emphasis: {--%>
<%--                        label: {--%>
<%--                            show: false,--%>
<%--                            fontSize: '14',--%>
<%--                        }--%>
<%--                    },--%>
<%--                    labelLine: {--%>
<%--                        show: false--%>
<%--                    },--%>
<%--                    data:leftbottombox_pie_data_info//leftbottombox_pie_data_info [2,2,0,1,1,0]--%>
<%--                }--%>
<%--            ],--%>
<%--        };--%>
<%--        leftbottombox_pie1_chart.setOption(leftbottombox_pie1_option)--%>


<%--        var leftbottombox_pie2_chart=echarts.init(document.getElementById("leftbottombox_pie2"))--%>
<%--        leftbottombox_pie2_option={--%>
<%--            backgroundColor: {--%>
<%--                type: 'linear',--%>
<%--                x: 0,--%>
<%--                y: 0,--%>
<%--                x2: 1,--%>
<%--                y2: 1,--%>
<%--                colorStops: [{--%>
<%--                    offset: 0,--%>
<%--                    color: '#0f2c70' // 0% 处的颜色--%>
<%--                }, {--%>
<%--                    offset: 1,--%>
<%--                    color: '#091732' // 100% 处的颜色--%>
<%--                }],--%>
<%--                globalCoord: false // 缺省为 false--%>
<%--            },--%>
<%--            //指定国际标准颜色--%>
<%--            color:[ 'rgb(0,255,0)', 'rgb(255,255,0',--%>
<%--                'rgb(255,128,0)', 'rgb(255,0,0)', 'rgb(193,0,193)',--%>
<%--                'rgb(130,0,0)', ],--%>
<%--            grid: {--%>
<%--                top:"5%",--%>
<%--                left: '2%',--%>
<%--                // right: '6%',--%>
<%--                bottom: '0%',--%>
<%--                containLabel: true--%>
<%--            },--%>
<%--            title:{--%>
<%--                show:true,--%>
<%--                text:"噪音",--%>
<%--                textStyle:{color:'white',fontWeight:'bold'},--%>
<%--                x:"12.5%",top:'32%',--%>
<%--                subtext:"纯属虚构",},--%>
<%--            legend:{show:true,--%>
<%--                x:"36%",y:"30%",orient:"vertical"--%>
<%--                ,data:legend_data,//legend_data--%>
<%--                textStyle:{color:'white',fontWeight:'bold'},--%>
<%--                icon: "circle",--%>
<%--                padding:10--%>
<%--            },--%>
<%--            calculable:true,--%>
<%--            tooltip:{ formatter: '{a} <br/>{b} : {c} ({d}%)',trigger:'item'},--%>
<%--            series:[--%>
<%--                {--%>
<%--                    name:'访问来源',--%>
<%--                    type:"pie",--%>
<%--                    radius:["60%","80%"],//['80%','60%'],--%>
<%--                    center:["20%","50%"],//第一个x的位置，y的位置--%>
<%--                    label: {--%>
<%--                        show: false,--%>
<%--                    },--%>
<%--                    emphasis: {--%>
<%--                        label: {--%>
<%--                            show: false,--%>
<%--                            fontSize: '14',--%>
<%--                        }--%>
<%--                    },--%>
<%--                    labelLine: {--%>
<%--                        show: false--%>
<%--                    },--%>
<%--                    data:leftbottombox_pie_data_info//leftbottombox_pie_data_info [2,2,0,1,1,0]--%>
<%--                }--%>
<%--            ],--%>
<%--        }--%>
<%--        leftbottombox_pie2_chart.setOption(leftbottombox_pie2_option);--%>
<%--    }else{--%>
<%--        var canvas_holder_div=document.getElementById("canvas-holder");--%>
<%--        canvas_holder_div.innerHTML="暂时无更新数据";--%>
<%--    }--%>


<%--</script>--%>

</body>
</html>

