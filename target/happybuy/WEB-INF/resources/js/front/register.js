/**
 * Created by Administrator on 2017/6/26/026.
 */
$(function () {
    var basePath = $("#basePath").val();

    $("#form-saveUser").validate({
        submitHandler:function () {
            $.ajax({
                url:basePath +"/user/regUser",
                type:"post",
                data:$("#form-saveUser").serialize(),
                success:function (data) {
                    $(".modal-body").text("注册成功！需要去邮箱点击激活链接才能够使用账号！");
                    $('#alertModal').modal('show');
                }
            })
        },
        focusInvalid:true,
        rules:{
            username:{
                required:true,
                username:true,
                remote:{  //异步验证用户名是否存在
                    url:basePath + "/user/existUserName", //请求地址
                    type:"post",  //指定传输方式
                    dataType: "json",           //接受数据格式
                    data: {                     //要传递的数据
                        username: function() {
                            return $("#username").val();
                        }
                    }
                }
            },
            password:{
                required:true,
                username:true
            },
            rePass:{
                required:true,
                equalTo:password
            },
            email:{
                required:true,
                email:true
            },
            service:{
                required:true
            }
        },
        messages:{
            username:{
                required:"请输入用户名"
            },
            password:{
                required:"请输入密码"
            },
            rePass:{
                required:"再次确认密码",
                equalTo:"两次输入密码不同"
            },
            email:{
                required:"请输入邮箱"
            },
            service:{
                required:"请选择条款"
            }
        }
    })
})