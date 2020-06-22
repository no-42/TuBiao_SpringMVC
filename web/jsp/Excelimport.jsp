<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>上传文件</title>
</head>
<body>
<script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
<a href="${pageContext.request.contextPath}/download">获取模板</a>
<form class="form form-horizontal" id="form-article-add" enctype="multipart/form-data">
    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2">文件：</label>
        <div class="formControls col-xs-8 col-sm-9"> <span class="btn-upload form-group">
				<input class="input-text upload-url" type="text" name="uploadfile" id="uploadfile" readonly
                       nullmsg="请添加附件！" style="width:200px">
				<a href="javascript:void();" class="btn btn-primary radius upload-btn"><i
                        class="Hui-iconfont">&#xe642;</i> 浏览文件</a>
					<input type="file" multiple name="file" class="input-file" id="file">
				</span></div>
    </div>
    <div class="row cl">
        <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
            <button onClick="importUsers();" class="btn btn-primary radius" type="button"><i class="Hui-iconfont">&#xe632;</i>
                导入数据
            </button>
            <button onClick="cancel();" class="btn btn-default radius" type="button">&nbsp;&nbsp;取消&nbsp;&nbsp;</button>
        </div>
    </div>
</form>
<script>
    /*导入数据*/
    function importUsers(){
        //var clientid = $("#clientid").val();
        var FormDatas=new FormData($("#form-article-add")[0]);
        var fileName=$("#file").val();
        if(fileName == '') {
            layer.msg('请选择文件！',{
                icon:MSG_CHECK,
                time:MSG_TIME
            });
            return false;
        }
        //验证文件格式
        var fileType = (fileName.substring(fileName.lastIndexOf(".") + 1, fileName.length)).toLowerCase();
        if (fileType != 'xlsx') {
            layer.msg('文件格式不正确！',{
                icon:MSG_CHECK,
                time:MSG_TIME
            });
            return false;
        }
        $.ajax({
            type:'post',
            url:'${pageContext.request.contextPath}/insertexcel',
            async : false,
            cache : false,
            contentType : false,
            processData : false,
            data:FormDatas,
            success: function(data){
                if(data["res"]){
                    layer.msg("文件导入成功", {
                        icon: OPER_SB,
                        shade: [0.3, '#393D49'], // 透明度  颜色
                        time:5000
                    });
                    return false;
                }else{
                    layer.msg("文件导入失败，请重新上传！", {
                        icon: OPER_CG,
                        shade: [0.3, '#393D49'], // 透明度  颜色
                        time:5000
                    });
                    window.location.reload();
                    return false;
                }
            },
            error : function(data){
                console.log(data.msg);
            }
        });
    }
</script>
</body>
</html>
