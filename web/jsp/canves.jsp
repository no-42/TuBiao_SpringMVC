<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/4/17
  Time: 14:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style type="text/css">
        #lefttopbox_pie1{
            width: 100%;
            height: 50%;
        }
        #lefttopbox_pie2{
            width: 100%;
            height: 50%;
        }
    </style>
</head>
<body>
<script src="${pageContext.request.contextPath}/dist/echarts.js"></script>
<script src="${pageContext.request.contextPath}/js/demo_F.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
<div id="canvas" style="width: 100%;height: 100%" >
    <div id="lefttopbox_pie1"></div>
    <div id="lefttopbox_pie2"></div>
</div>
<script>
    setInterval("lefttopbox()",10000)
        function lefttopbox(){
     $.post("${pageContext.request.contextPath}/aqi",function (data,status) {
         if (status=="success"){

             process(data);
         }

     },"json");
     $.post("${pageContext.request.contextPath}/aqi",function (data) {
         process2(data)
     },"json")
        }
    function process(data){
        var lefttopbox_pie_data_info=data
        var lefttopbox_pie1_chart=echarts.init(document.getElementById("lefttopbox_pie1"));
        lefttopbox_pie1_chart.clear()
        var legend_data;
        if(res_is_T(lefttopbox_pie_data_info)){
            legend_data= get_legend(lefttopbox_pie_data_info)
            var lefttopbox_pie1_chart_option={
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
                    x:"12.5%",top:'30%',
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
                        data:lefttopbox_pie_data_info//lefttopbox_pie_data_info [2,2,0,1,1,0]
                    }
                ]
            }
            lefttopbox_pie1_chart.setOption(lefttopbox_pie1_chart_option)
        }else{
            var lefttopbox_pie1_div=$("#lefttopbox_pie1")
            lefttopbox_pie1_div.html("访问数据失败")
        }
            }
    function process2(data) {
        var lefttopbox_pie_data_info=data
        var legend_data;
        if(res_is_T(lefttopbox_pie_data_info)){
            var lefttopbox_pie2_chart=echarts.init(document.getElementById("lefttopbox_pie2"));
            lefttopbox_pie2_chart.clear();
            legend_data= get_legend(lefttopbox_pie_data_info)
            lefttopbox_pie2_option={
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
                    bottom: '3%',
                    containLabel: true
                },
                title:{
                    show:true,
                    text:"噪音",
                    textStyle:{color:'white',fontWeight:'bold'},
                    x:"12.5%",top:'30%',
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
                        data:lefttopbox_pie_data_info//lefttopbox_pie_data_info [2,2,0,1,1,0]
                    }
                ],
            }
            lefttopbox_pie2_chart.setOption(lefttopbox_pie2_option);
        }else{
            var lefttopbox_pie2_div=$("#lefttopbox_pie2")
            lefttopbox_pie2_div.html("访问数据失败")
        }

    }


</script>
<script>
    setTimeout(function () {
        var lefttopbox_pie1_chart=echarts.init(document.getElementById("lefttopbox_pie1"));
        var lefttopbox_pie2_chart=echarts.init(document.getElementById("lefttopbox_pie2"))
        lefttopbox_pie1_chart.showLoading()
        lefttopbox_pie2_chart.showLoading()
        setTimeout(function () {
            lefttopbox_pie1_chart.hideLoading();
            lefttopbox_pie2_chart.hideLoading();
            lefttopbox()
        },2000)
    },0)

</script>


                <%--<script>--%>

<%--   --%>

<%--    var lefttopbox_pie1_chart=echarts.init(document.getElementById("lefttopbox_pie1"));--%>
<%--    var lefttopbox_pie2_chart=echarts.init(document.getElementById("lefttopbox_pie2"))--%>

<%--    var lefttopbox_pie_data_info=${data}--%>
<%--    if(res_is_T(lefttopbox_pie_data_info)){--%>
<%--        var legend_data= get_legend(lefttopbox_pie_data_info)--%>

<%--        var lefttopbox_pie1_chart_option={--%>
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
<%--                x:"12.5%",top:'30%',--%>
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
<%--                    data:lefttopbox_pie_data_info//lefttopbox_pie_data_info [2,2,0,1,1,0]--%>
<%--                }--%>
<%--            ],--%>
<%--        };--%>
<%--        lefttopbox_pie1_chart.setOption(lefttopbox_pie1_chart_option);--%>



<%--        lefttopbox_pie2_option={--%>
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
<%--                bottom: '3%',--%>
<%--                containLabel: true--%>
<%--            },--%>
<%--            title:{--%>
<%--                show:true,--%>
<%--                text:"噪音",--%>
<%--                textStyle:{color:'white',fontWeight:'bold'},--%>
<%--                x:"12.5%",top:'30%',--%>
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
<%--                    data:lefttopbox_pie_data_info//lefttopbox_pie_data_info [2,2,0,1,1,0]--%>
<%--                }--%>
<%--            ],--%>
<%--        }--%>
<%--        lefttopbox_pie2_chart.setOption(lefttopbox_pie2_option);--%>
<%--    }else{--%>
<%--      var   canvas_div=  document.getElementById("canvas");--%>
<%--      canvas_div.innerHTML="暂时无更新数据";--%>
<%--    }--%>

<%--</script>--%>



</body>
</html>

