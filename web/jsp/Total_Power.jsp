<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pie Chart</title>
<style type="text/css">

#pie{
	width:100%;
	height:40%
}
#bar{
    width:100%;
    height:60%

}
</style>
</head>
<body>
<script src="${pageContext.request.contextPath}/dist/echarts.js"></script>
<script src="${pageContext.request.contextPath}/js/demo_F.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
<div id='content_char_list' style="width: 100%;height: 100%" >
<div id='pie'></div>
<div id='bar'></div>
</div>


<script>
    var barchart=echarts.init(document.getElementById("bar"));
    var piechart=echarts.init(document.getElementById("pie"));
    setInterval("f()",10000)
    function f() {
        $.post("${pageContext.request.contextPath}/Ele_year",function (data) {
            var bar_data_info=data;
            if (res_is_T(bar_data_info)){
                barchart.clear()
                var Axis_data=get_Axis(bar_data_info)
                var data_a=[]
                var data_b=[]
                var data_c=[]
                for (var i =0;i<bar_data_info.length;i++){
                    data_a.push(bar_data_info[i]['value'][0]);
                    data_b.push(bar_data_info[i]['value'][1]);
                    data_c.push(bar_data_info[i]['value'][2]);
                }
                var legend_data=["工业区","办公区","生活区"]
                var baroption={
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
                        data:legend_data,//,
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
                    series:[
                        {"name":legend_data[0],type:"bar",stack:'总量',data:data_a},
                        {"name":legend_data[1],type:"bar",stack:'总量',data:data_b},
                        {"name":legend_data[2],type:"bar",stack:'总量',data:data_c},
                    ]
                }
                barchart.setOption(baroption)
            }
        },"json")


        $.post("${pageContext.request.contextPath}/Ele_mounth",function (data) {
            var pie_data_info=data;
            if (res_is_T(pie_data_info)){
                piechart.clear();
                var legend_data=get_legend(pie_data_info);
                pieoption={
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
                        text:"总用电量",
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
                            data:pie_data_info
                        }
                    ],
                };
                piechart.setOption(pieoption)
            }
        },"json")
    }

</script>

<%--<script >--%>
<%--var pie_data_info= ${mouthEl}--%>

<%--var bar_data_info=${yearEl};--%>

<%--if (res_is_T(pie_data_info)){--%>
<%--    var legend_data=get_legend(pie_data_info)--%>
<%--    var piechart=echarts.init(document.getElementById("pie"));--%>
<%--    piechart.showLoading();--%>
<%--    var pieoption={--%>
<%--        backgroundColor: {--%>
<%--            type: 'linear',--%>
<%--            x: 0,--%>
<%--            y: 0,--%>
<%--            x2: 1,--%>
<%--            y2: 1,--%>
<%--            colorStops: [{--%>
<%--                offset: 0,--%>
<%--                color: '#0f2c70' // 0% 处的颜色--%>
<%--            }, {--%>
<%--                offset: 1,--%>
<%--                color: '#091732' // 100% 处的颜色--%>
<%--            }],--%>
<%--            globalCoord: false // 缺省为 false--%>
<%--        },--%>
<%--        title:{--%>
<%--            textAlign:"auto",--%>
<%--            textVerticalAlign:"middle",--%>
<%--            show:true,--%>
<%--            text:"总用电量",--%>
<%--            textStyle:{color:'red',fontSize:"14"},--%>
<%--            x:"11%",top:'32%',--%>
<%--            subtext:"纯属虚构",},--%>
<%--        legend:{show:true,--%>
<%--            x:"right",y:"20%",orient:"vertical"--%>
<%--            ,data:legend_data,--%>
<%--            textStyle:{color:"red",},--%>
<%--            icon: "circle",--%>
<%--        },--%>
<%--        calculable:true,--%>
<%--        tooltip:{ formatter: '{a} <br/>{b} : {c} ({d}%)',trigger:'item'},--%>
<%--        series:[--%>
<%--            {--%>
<%--                name:'智慧工地',--%>
<%--                type:"pie",--%>
<%--                radius:["70%","90%"],//['80%','60%'],--%>
<%--                center:["20%","50%"],//第一个x的位置，y的位置--%>
<%--                label: {--%>
<%--                    show: false,--%>
<%--                },--%>
<%--                emphasis: {--%>
<%--                    label: {--%>
<%--                        show: false,--%>
<%--                        fontSize: '14',--%>
<%--                    }--%>
<%--                },--%>
<%--                labelLine: {--%>
<%--                    show: false--%>
<%--                },--%>
<%--                data:pie_data_info--%>
<%--            }--%>
<%--        ],--%>
<%--    };--%>
<%--    if (res_is_T(bar_data_info)){--%>
<%--        var Axis_data=get_Axis(bar_data_info)--%>
<%--        var data_a=[]--%>
<%--        var data_b=[]--%>
<%--        var data_c=[]--%>
<%--        for (var i =0;i<bar_data_info.length;i++){--%>
<%--            data_a.push(bar_data_info[i]['value'][0]);--%>
<%--            data_b.push(bar_data_info[i]['value'][1]);--%>
<%--            data_c.push(bar_data_info[i]['value'][2]);--%>
<%--        }--%>
<%--        var barchart=echarts.init(document.getElementById("bar"));--%>
<%--        barchart.showLoading();--%>
<%--        var baroption={--%>
<%--            grid: {--%>
<%--                top:"5%",--%>
<%--                left: '2%',--%>
<%--                // right: '6%',--%>
<%--                bottom: '3%',--%>
<%--                containLabel: true--%>
<%--            },--%>
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
<%--            // title:{text:"",textStyle:{},padding:[],subtext:"",},--%>
<%--            legend:{--%>
<%--                show:false,--%>
<%--                data:legend_data,//area_list:["地区一","地区二","地区三"]--%>
<%--            },--%>
<%--            tooltip:{show:true,trigger:"item"},--%>
<%--            toolbox:{show:true,orient:'vertical',y:"center",--%>
<%--                feature:{mark:{show:true},saveAsImage:{show:true},restore:{show:true},--%>
<%--                    magicType:{show:true,type:['line','bar','stack','tiled']}}},--%>
<%--            yAxis:{--%>
<%--                type:"value",--%>
<%--                name:"",//数量--%>
<%--                splitArea:{show:true},--%>
<%--                axisLabel:{color:'red',fontWeight:"bold"},--%>
<%--            },--%>
<%--            xAxis:{name:"时间",type:"category",axisLabel:{rotate:'15',color:'red',fontWeight:"bold"},--%>
<%--                data:Axis_data,--%>
<%--            },--%>
<%--            series:[--%>
<%--                {"name":legend_data[0],type:"bar",stack:'总量',data:data_a},--%>
<%--                {"name":legend_data[1],type:"bar",stack:'总量',data:data_b},--%>
<%--                {"name":legend_data[2],type:"bar",stack:'总量',data:data_c},--%>
<%--            ]--%>
<%--        }--%>
<%--    }else{--%>
<%--        var bar_div=document.getElementById("bar");--%>
<%--        bar_div.innerHTML="暂时无更新数据";--%>
<%--    }--%>
<%--}else{--%>
<%--    var content_char_list_div=document.getElementById("content_char_list");--%>
<%--    content_char_list_div.innerHTML="暂时无更新数据";--%>
<%--}--%>

<%--    setTimeout(function () {--%>
<%--        piechart.hideLoading();--%>
<%--        barchart.hideLoading();--%>
<%--        piechart.setOption(pieoption);--%>
<%--        barchart.setOption(baroption);--%>
<%--        echarts.connect([piechart,barchart]);--%>
<%--    },2000)--%>
<%--</script>--%>

<%--setTimeout(function () {&ndash;%&gt;--%>
<%--        piechart.hideLoading();--%>
<%--        barchart.hideLoading();--%>
<%--        piechart.setOption(pieoption);--%>
<%--        barchart.setOption(baroption);--%>
<%--        echarts.connect([piechart,barchart]);--%>
<%--    },2000)--%>


<script>
    setTimeout(function () {
        piechart.showLoading()
        barchart.showLoading()
        setTimeout(function () {
            piechart.hideLoading();
            barchart.hideLoading();
            f()
            echarts.connect([piechart,barchart]);
        },2000)
    },0)

</script>
</body>
</html>