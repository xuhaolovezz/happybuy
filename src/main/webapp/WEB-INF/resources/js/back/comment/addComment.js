/**
 * Created by Administrator on 2017/7/3/003.
 */
$(function () {
    var basePath = $("#basePath").val();
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

    /**
     * 初始化图片上传插件
     */
    $(".commentPicture").fileinput({
        showUpload: false,
        // showCaption: false,
        language: 'zh', //设置语言
        maxFileCount:4,//允许最大上传文件个数
        maxFileSize: 10240,//单位为kb，如果为0表示不限制文件大小
        dropZoneEnabled: false,//是否显示拖拽区域
        msgFilesTooMany: "选择上传的文件数量({n}) 超过允许的最大数值{m}！",
        browseClass: "btn btn-primary",
        allowedFileExtensions : ['jpg', 'png','gif'],//接收的文件后缀
        previewFileIcon: "<i class='glyphicon glyphicon-king'></i>"
    });


});