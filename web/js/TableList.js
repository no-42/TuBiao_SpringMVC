window.onload=function(){
    $.ajax({
        type:"post",
        url:"/TuBiao_MVC_war_exploded/getUser",
        error:function () {
            alert("服务器错误")
        },
        dataType:"json",
        success:function (data) {
            $("#Table").empty();
            var str="";
            console.log(data.length+"条数据");
            for (var i=0;i<data.length;i++){
                var list=data[i];
                str="<tr><td>"+list.nickname+"</td><td>"+list.password+"</td><td>"+list.worksite+"</td><td>"+list.grade+"</td></tr>";
                $('#Table').append(str);
                str="";
            }
        }
    })
}
