/**
 * Created by Administrator on 2017/7/3/003.
 */
$(function () {
    var basePath = $("#basePath").val();
    $(".datepicker").datepicker({
        language: "zh-CN",
        autoclose: true,//选中之后自动隐藏日期选择框
        clearBtn: true,//清除按钮
        todayBtn: 'linked',//今日按钮
        format: "yyyy-mm-dd"//日期格式，详见 http://bootstrap-datepicker.readthedocs.org/en/release/options.html#format
    });
    $('input').iCheck({
        checkboxClass: 'icheckbox_flat-red',
        radioClass: 'iradio_flat-red'
    });

    //提交修改个人信息的表单
    $(".btn-submit").on("click",function () {
        $.ajax({
            url:basePath + "/user/update",
            type:"put",
            data:$("#form-update-user").serialize(),
            success:function () {
                $(".modal-body").text("修改成功！");
                $('#alertModal').modal('show');
            }
        })
    })
});