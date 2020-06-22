<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pie Chart</title>
<style type="text/css">
#content_char_list{
	width:500px;
	height:1000px
}
#pie{
	width:500px;
	height:350px
}
#bar{
		width:500px;
		height:350px;
}
</style>
</head>
<body>
<script src="${pageContext.request.contextPath}/dist/echarts.js"></script>
<script src="${pageContext.request.contextPath}/js/demo_F.js"></script>
<div id='content_char_list'>
<div id='pie'></div>
<div id='bar'></div>
</div>
<script >

var pie_data_info=[
    {name:"地区一",value:335},
    {name:"地区二",value:310},
    {name:"地区三",value:234},
]

var bar_data_info=[
	{name:"时间一",value:[20,30,41]},
    {name:"时间二",value:[50,21,11]},
    {name:"时间三",value:[16,18,14]},
]

var Axis_data=[]
for (var i=0;i<bar_data_info.length;i++){
	Axis_data.push(bar_data_info[i]['name']);
}
var legend_data=[];
for (var i=0;i<pie_data_info.length;i++){
	legend_data.push(pie_data_info[i]["name"])
}
var piechart=echarts.init(document.getElementById("pie"));
var pieoption={
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
			show:true,
			text:"总用量",
			textStyle:{color:'red'},
			x:"33%",top:'43%',
			subtext:"纯属虚构",},
		legend:{show:true,
			x:"right",y:"38%",orient:"vertical"
			,data:legend_data,
			textStyle:{color:"red",}
		},
		calculable:true,
		tooltip:{ formatter: '{a} <br/>{b} : {c} ({d}%)',trigger:'item'},
		series:[
	            {
	                name:'访问来源',
	                type:"pie",
	                radius:["30%","50%"],//['80%','60%'],
	                center:["40%","50%"],//第一个x的位置，y的位置
	                label: {
	                    show: false, 
	                },
	                emphasis: {
	                    label: {
	                        show: true,
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
piechart.setOption(pieoption);
</script>

<script>
var barchart=echarts.init(document.getElementById("bar"));
var baroption={
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
	title:{text:"",textStyle:{},padding:[],subtext:"",},
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
    		data:Axis_data,//${xAsis_list}
    },
    series:[]
}
for(var i=0;i<legend_data.length;i++){
	baroption['series'].push(
		{"name":legend_data[i],type:"bar",stack:"总量",data:bar_data_info[i]["value"]}		
	)
}


barchart.setOption(baroption);
echarts.connect([piechart,barchart]);
</script>
</body>
</html>