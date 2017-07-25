/**
 * Created by Administrator on 2017/6/27/027.
 */
$(function () {
    var basePath = $("#basePath").val();
    $("#checkAll").on('click',function () {
        $(".checkLog").iCheck('check');
    });
    $('input').iCheck({
        checkboxClass: 'icheckbox_flat-red',
        radioClass: 'iradio_flat-red'
    });

    //管理员退出
    $("#btn-logout").on("click",function () {
        $.ajax({
            url:basePath + "/admin/logout",
            type:"post",
            success:function () {
                window.location.href = basePath + "/index.jsp";
            }
        })
    });
   $("#btn-delLog").on("click",function () {
       if(window.confirm("确认要删除这些日志吗？")){
           var ids = new Array();
           $(".checkLog").each(function (i,e) {
               //如果当前被选中
               if($(this).is(":checked")){
                   var id = "'" + $(this).parent().parent().attr("value") + "'";
                   ids.push(id);
               }
           })
           $.ajax({
               url: basePath + "/log/deleteLoginLogs",
               data:{"idString":ids.toString()},
               type:"post",
               success:function () {
                   window.location.reload(true);
               }
           })
       }
   })
});