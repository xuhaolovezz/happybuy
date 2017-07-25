/**
 * Created by Administrator on 2017/6/26/026.
 */
//获得URL地址栏的参数
function GetQueryString(name)
{
    var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
    var r = window.location.search.substr(1).match(reg);
    if(r!=null)return  unescape(r[2]); return null;
}
$(function () {
    var basePath = $("#basePath").val();
    $("#form-login").validate({
        submitHandler:function () {
            var action = $("#form-login").attr("action");
            $.ajax({
                url:basePath +action,
                type:"post",
                data:$("#form-login").serialize(),
                success:function (data) {
                    if(data == "login_user"){
                        var returnURL=GetQueryString("returnURL");
                        if(returnURL !=null && returnURL.toString().length>1)
                        {
                            if(returnURL.substring(0,9) == "/register" ||returnURL.substring(0,5) == "/login" || returnURL.substring(0,14) == "/user/Activate"){
                                window.location.href = basePath + "/index.jsp";
                            } else {
                                window.location.href = basePath + returnURL;
                            }
                        } else {
                            window.location.href = basePath + "/index.jsp";
                        }
                    } else if(data == "login_admin"){
                        window.location.href = basePath + "/admin/commodityList/1";
                    } else if(data == "failure"){
                        $(".modal-body").text("用户名或者密码错误！");
                        $('#alertModal').modal('show');
                    } else {
                        $(".modal-body").text("您的账号未激活！");
                        $('#alertModal').modal('show');
                    }
                }
            })
        },
        focusInvalid:true,
        rules:{
            username:{
                required:true
            },
            password:{
                required:true
            }
        },
        messages:{
            username:{
                required:"请输入用户名"
            },
            password:{
                required:"请输入密码"
            }
        }
    })
});