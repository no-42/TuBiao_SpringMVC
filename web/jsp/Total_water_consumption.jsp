<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Total_water</title>
    <style type="text/css">

        #water_pie{
            width:100%;
            height:40%
            /*width:500px;*/
            /*height: 300px;*/
        }
        #water_bar{
            width:100%;
            height:60%
            /*width:500px;*/
            /*height: 300px;*/
        }
    </style>
</head>
<body>
<script src="${pageContext.request.contextPath}/dist/echarts.js"></script>
<script src="${pageContext.request.contextPath}/js/demo_F.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
<div id='water_content_char_list' style="width: 100%;height: 100%" >
    <div id='water_pie'></div>
    <div id='water_bar'></div>
</div>
<script>
    <%--var url=${url}--%>
    var water_piechart=echarts.init(document.getElementById("water_pie"));
    var water_barchart=echarts.init(document.getElementById("water_bar"));


    <%--var water_pie_data_info=${mouthwater}--%>
    <%--var water_bar_data_info=${yearwater}--%>
    // setInterval("f()",1000*60*30)
    setInterval("f2()",10000)
    function f2() {
        $.post("${pageContext.request.contextPath}/water_year",function (data) {

            var water_bar_data_info=data;
            var legend_data=["地区一","地区二","地区三"];
            if(res_is_T(water_bar_data_info)){
                water_barchart.clear()
                var data_a=[]
                var data_b=[]
                var data_c=[]
                for (var i =0;i<water_bar_data_info.length;i++){
                    data_a.push(water_bar_data_info[i]['value'][0]);
                    data_b.push(water_bar_data_info[i]['value'][1]);
                    data_c.push(water_bar_data_info[i]['value'][2]);
                }
                var Axis_data=get_Axis(water_bar_data_info);
                var water_baroption={
                    grid: {
                        top:"5%",
                        left: '2%',
                        // right: '6%',
                        bottom: '3%',
                        containLabel: true
                    },
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
                    // title:{text:"",textStyle:{},padding:[],subtext:"",},
                    legend:{
                        show:false,
                        data:legend_data,//area_list:["地区一","地区二","地区三"]
                    },
                    tooltip:{show:true,trigger:"item"},
                    toolbox:{show:true,orient:'vertical',y:"center",
                        feature:{mark:{show:true},saveAsImage:{show:true},restore:{show:true},
                            magicType:{show:true,type:['line','bar','stack','tiled']}}},
                    yAxis:{
                        type:"value",
                        name:"",//数量
                        splitArea:{show:true},
                        axisLabel:{color:'red',fontWeight:"bold"},
                    },
                    xAxis:{name:"时间",type:"category",axisLabel:{rotate:'15',color:'red',fontWeight:"bold"},
                        data:Axis_data,
                    },
                    series:[  {"name":legend_data[0],type:"bar",stack:'总量',data:data_a},
                        {"name":legend_data[1],type:"bar",stack:'总量',data:data_b},
                        {"name":legend_data[2],type:"bar",stack:'总量',data:data_c},]
                }
                water_barchart.setOption(water_baroption)
            }else{
                var water_bar_div=document.getElementById("water_bar").
                    innerHTML="暂无更新数据";
            }
        },"json")
        $.post("${pageContext.request.contextPath}/water_mouth",function (data) {
            var water_pie_data_info=data;
            if(res_is_T(water_pie_data_info)){
                water_piechart.clear()
                var legend_data=get_legend(water_pie_data_info);
                var water_pieoption={
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
                    title:{
                        textAlign:"auto",
                        textVerticalAlign:"middle",
                        show:true,
                        text:"总用水量",
                        textStyle:{color:'red',fontSize:"14"},
                        x:"11%",top:'32%',
                        subtext:"纯属虚构",},
                    legend:{show:true,
                        x:"right",y:"20%",orient:"vertical"
                        ,data:legend_data,
                        textStyle:{color:"red",},
                        icon: "circle",
                    },
                    calculable:true,
                    tooltip:{ formatter: '{a} <br/>{b} : {c} ({d}%)',trigger:'item'},
                    series:[
                        {
                            name:'智慧工地',
                            type:"pie",
                            radius:["70%","90%"],//['80%','60%'],
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
                            data:water_pie_data_info
                        }
                    ],
                };
                water_piechart.setOption(water_pieoption)
            }
        },"json")
    }

    // if(res_is_T(water_pie_data_info)){
    //     var legend_data=get_legend(water_pie_data_info);
    //     // water_piechart.showLoading()
    //     var water_pieoption={
    //         backgroundColor: {
    //             type: 'linear',
    //             x: 0,
    //             y: 0,
    //             x2: 1,
    //             y2: 1,
    //             colorStops: [{
    //                 offset: 0,
    //                 color: '#0f2c70' // 0% 处的颜色
    //             }, {
    //                 offset: 1,
    //                 color: '#091732' // 100% 处的颜色
    //             }],
    //             globalCoord: false // 缺省为 false
    //         },
    //         title:{
    //             textAlign:"auto",
    //             textVerticalAlign:"middle",
    //             show:true,
    //             text:"总用水量",
    //             textStyle:{color:'red',fontSize:"14"},
    //             x:"11%",top:'32%',
    //             subtext:"纯属虚构",},
    //         legend:{show:true,
    //             x:"right",y:"20%",orient:"vertical"
    //             ,data:legend_data,
    //             textStyle:{color:"red",},
    //             icon: "circle",
    //         },
    //         calculable:true,
    //         tooltip:{ formatter: '{a} <br/>{b} : {c} ({d}%)',trigger:'item'},
    //         series:[
    //             {
    //                 name:'智慧工地',
    //                 type:"pie",
    //                 radius:["70%","90%"],//['80%','60%'],
    //                 center:["20%","50%"],//第一个x的位置，y的位置
    //                 label: {
    //                     show: false,
    //                 },
    //                 emphasis: {
    //                     label: {
    //                         show: false,
    //                         fontSize: '14',
    //                     }
    //                 },
    //                 labelLine: {
    //                     show: false
    //                 },
    //                 data:water_pie_data_info
    //             }
    //         ],
    //     };
    //     if ( res_is_T(water_bar_data_info)){
    //         var data_a=[]
    //         var data_b=[]
    //         var data_c=[]
    //         for (var i =0;i<water_bar_data_info.length;i++){
    //             data_a.push(water_bar_data_info[i]['value'][0]);
    //             data_b.push(water_bar_data_info[i]['value'][1]);
    //             data_c.push(water_bar_data_info[i]['value'][2]);
    //         }
    //         var Axis_data=get_Axis(water_bar_data_info);
    //
    //         water_barchart.showLoading();
    //         var water_baroption={
    //             grid: {
    //                 top:"5%",
    //                 left: '2%',
    //                 // right: '6%',
    //                 bottom: '3%',
    //                 containLabel: true
    //             },
    //             backgroundColor: {
    //                 type: 'linear',
    //                 x: 0,
    //                 y: 0,
    //                 x2: 1,
    //                 y2: 1,
    //                 colorStops: [{
    //                     offset: 0,
    //                     color: '#0f2c70' // 0% 处的颜色
    //                 }, {
    //                     offset: 1,
    //                     color: '#091732' // 100% 处的颜色
    //                 }],
    //                 globalCoord: false // 缺省为 false
    //             },
    //             // title:{text:"",textStyle:{},padding:[],subtext:"",},
    //             legend:{
    //                 show:false,
    //                 data:legend_data,//area_list:["地区一","地区二","地区三"]
    //             },
    //             tooltip:{show:true,trigger:"item"},
    //             toolbox:{show:true,orient:'vertical',y:"center",
    //                 feature:{mark:{show:true},saveAsImage:{show:true},restore:{show:true},
    //                     magicType:{show:true,type:['line','bar','stack','tiled']}}},
    //             yAxis:{
    //                 type:"value",
    //                 name:"",//数量
    //                 splitArea:{show:true},
    //                 axisLabel:{color:'red',fontWeight:"bold"},
    //             },
    //             xAxis:{name:"时间",type:"category",axisLabel:{rotate:'15',color:'red',fontWeight:"bold"},
    //                 data:Axis_data,
    //             },
    //             series:[  {"name":legend_data[0],type:"bar",stack:'总量',data:data_a},
    //                 {"name":legend_data[1],type:"bar",stack:'总量',data:data_b},
    //                 {"name":legend_data[2],type:"bar",stack:'总量',data:data_c},]
    //         }
    //
    //     }else{
    //         var water_bar_div=document.getElementById("water_bar").
    //             innerHTML="暂无更新数据";
    //     }
    // }else {
    //     var water_content_char_list_div=document.getElementById("water_content_char_list").
    //         innerHTML="暂无更新数据";
    // }
    setTimeout(function () {
        water_barchart.showLoading()
        water_piechart.showLoading()
        setTimeout(function () {
            water_barchart.hideLoading()
            water_piechart.hideLoading()
            f2()
            // water_piechart.setOption(water_pieoption);
            // water_barchart.setOption(water_baroption);
            echarts.connect([water_piechart,water_barchart]);
        },2500)
    },0)




</script>
</body>
</html>