<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <style type="text/css">
        table {
            border: 1px solid;
            margin: auto;
            width: 800px;
        }

        td, th {
            text-align: center;
            border: 1px solid;
        }

        div {
            text-align: center;
            margin: 50px;
        }
    </style>


</head>
<body>
<div>

    <input type="text" id="username" placeholder="请输入用户名"> <input
        type="password" id="password" placeholder="请输入密码"> <select
        id="objs">
    <option value='' disabled selected style='display: none'>请选择项目</option>
</select> <select id="grades">
    <option value='' disabled selected style='display: none'>请选择等级</option>
</select> <input type="button" id="btn_add" value="添加">
    <button id="delete">批量删除</button>
    <br> <a href="${pageContext.request.contextPath}/download">获取模板</a>
    <input type="file" accept=".txt, .xlsx, .csv" id="myFile">
    <button onclick="upload()" id="btn_file">点击上传</button>
</div>
<table id="table1">
    <caption>信息表</caption>
    <tr>
        <td>编号</td>
        <td>姓名</td>
        <td>密码</td>
        <td>项目名</td>
        <td>邮箱</td>
        <td>手机号</td>
        <td>等级</td>
        <td>操作</td>
        <td><input type="checkbox" id="checkAll" class="chk">全选</td>
    </tr>

</table>
<script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
<script>
    // var confirm=confirm("请问添加")

    $("#checkAll").on("click", function () {
        $(".chk01").prop("checked", $(this).prop("checked"))//多选框的状态与全选框状态保持一致
    })

    $(".chk01").each(function () {
        $(this).click(function () {
            if (!$(this).prop("checked")) {//多选框有一个未选中 全选变为未选中状态
                $("#checkAll").prop("checked", false)
            } else if ($(this).prop("checked")) {
                $(".chk01").each(function (index, ele) {
                    if ($(this).prop("checked")) {
                        if (index == $(".chk01").length - 1) {
                            $("#checkAll").prop("checked", true)//多选框全部选中 全选变为选中状态
                        }
                        return true//each()跳过本次循环
                    } else {
                        return false//each()跳出循环
                    }
                })
            }
        })
    })


    function upload() {

        var formData = new FormData();
        formData.append("uploadFile", $("#myFile")[0].files[0]);
        var fileName = $("#myFile").val();

        console.log(fileName)
        console.log(fileName)
        var fileType = (fileName.substring(fileName.lastIndexOf(".") + 1, fileName.length)).toLowerCase();
        if (fileType != "xlsx") {
            alert("文件格式不正确")
            return false;
        }
        //还可以按照如下方式添加其他数据
        //formData.append("projectID",projectID);
        //formData.append("reportType",type);
        $.ajax({
            type: "post",
            url: "${pageContext.request.contextPath}/insertexcel",
            data: formData,
            async: false,
            cache: false,
            processData: false, // 使数据不做处理
            contentType: false, // 不要设置Content-Type请求头
            success: function (data) {
                if (data["res"]) {
                    alert("文件导入成功")
                    // layer.msg("文件导入成功", {
                    //     icon: OPER_SB,
                    //     shade: [0.3, '#393D49'], // 透明度  颜色
                    //     time:5000
                    // });
                    return false;
                } else {
                    // layer.msg("文件导入失败，请重新上传！", {
                    //     icon: OPER_CG,
                    //     shade: [0.3, '#393D49'], // 透明度  颜色
                    //     time:5000
                    // });
                    alert("文件导入失败")
                    window.location.reload();
                    return false;
                }
            },
            error: function (data) {
                console.log(data["msg"]);
            }
        })

    }


    $("#btn_add").on("click", function () {

        var username = $("#username").val();
        var password = $("#password").val();
        var grade = $("#grades option:selected")
        var obj = $("#objs option:selected")
        if (grade.val() == "") {
            alert("请选择等级")
        } else if (obj.val() == "") {
            alert("请选择项目")
        } else if (username.length < 4) {
            alert("用户名至少4位")
        } else if (password.length < 6) {
            alert("密码至少6位")
        } else {
            $.post("${pageContext.request.contextPath}/registered.nick", {reg_nick: username}, function (data) {
                if (data['res_nick']) {
                    $.get(
                        "${pageContext.request.contextPath}/insert",
                        {
                            "nickname": username,
                            "password": password,
                            "grade": grade.val(),
                            "work_id": obj.val(),
                            "worksite": obj.text()
                        },
                        function (data, status) {
                            if (status == "success") {
                                if (data['res']) {
                                    alert("添加用户成功")
                                } else {
                                    alert("添加失败")
                                }
                            }

                        }, "json"
                    )
                } else {
                    alert("用户名重复")
                }
            }, "json")
        }
    })

</script>
<script>
    $(function () {
        $.get("${pageContext.request.contextPath}/getgrade", function (data) {
            if (data["res"]) {
                var grades = data["data"];
                for (var i = 0; i < grades.length; i++) {
                    $("#grades").append(new Option(grades[i]["name"], grades[i]["grade"]))
                }
            }
        }, "json")

        $.get("${pageContext.request.contextPath}/getworksites", function (data) {
            if (data["res"]) {
                var objs = data['data']
                for (var i = 0; i < objs.length; i++) {
                    $("#objs").append(new Option(objs[i]["worksite"], objs[i]["work_id"]))
                }
            }

        }, "json")


        $.get("${pageContext.request.contextPath}/getUser", function (data) {
            var info = data;
            console.log(info)
            for (var i = 0; i < info.length; i++) {
                var str = "<tr>"
                    + "<td>" + info[i]["id"] + "</td>"
                    + "<td>" + info[i]["nickname"] + "</td>"
                    + "<td>" + info[i]["password"] + "</td>"
                    + "<td>" + info[i]["worksite"] + "</td>"
                    + "<td>" + info[i]["email"] + "</td>"
                    + "<td>" + info[i]["phone"] + "</td>"
                    + "<td>" + info[i]["grade"] + "</td>"
                    + "<td>" + "<a " + "href=" + "${pageContext.request.contextPath}/nickInfo?id=" + info[i]["id"] + '>' + "修改" + "</a>" + "</td>"
                    + "<td>" + "<input type='checkbox'  class=\"chk chk01\" nick_name=" + info[i]["nickname"] + '>' + "</td>"
                    + "</tr>";


                $("#table1").append(str)
            }

        }, "json")


    })


    $("#delete").on("click", function () {

        var delete_list = [];

        var delete_count = 0;
        $(".chk01").each(function () {
            if ($(this).prop("checked")) {
                delete_count++;
                delete_list.push({"nickname": $(this).attr("nick_name")})
            }
        })

        if (delete_count > 0) {
            var delete_flag = confirm("是否删除");
            if (delete_flag) {
                $.post("${pageContext.request.contextPath}/deleteusers", {delete_list}, function (data, status) {
                    if (status == "success") {


                    }
                }, "json")

            }

        } else {
            alert("请勾选要删除的人")
        }


    })
</script>
</body>
</html>