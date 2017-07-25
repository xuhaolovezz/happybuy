/**
 * Created by Administrator on 2017/7/4/004.
 */
$(function () {
   var basePath = $("#basePath").val();

    //将某个地址设置为收货地址
    $(".set-default-address").on("click",function () {
        var addressId = $(this).parent().attr("data-addressId");
        $.ajax({
            url:basePath + "/address/setDefaultAddress",
            type:"put",
            data:{"addressId":addressId},
            success:function () {
                window.location.reload(true);
            }
        })
    })

    var provinceList;
    //查询所有省份
    function queryAllProvince() {
        $.ajax({
            url:basePath + "/address/findAllProvince",
            type:"get",
            success:function (data) {
                return data;
            }
        })
    }
    function findCityByProvince(index) {
        $("#city").empty();
        $.each(provinceList[index].cityList,function (i,city) {
            $("#city").append("<option value='"+city.id+"'>"+city.name+"</option>" +
                ""
            );
        });
    }
    function findCityByProvince2(index) {
        $("#city2").empty();
        $.each(provinceList[index].cityList,function (i,city) {
            $("#city2").append("<option value='"+city.id+"'>"+city.name+"</option>" +
                ""
            );
        });
    }

    //新增地址
    $(".newaddress").on("click",function () {
        // alert(provinceList)
        $.ajax({
            url:basePath + "/address/findAllProvince",
            type:"get",
            success:function (data) {
                provinceList = data;
                $.each(provinceList,function (i,pro) {
                    $("#province").append("<option value='"+pro.id+"'>"+pro.name+"</option>" +
                        "");
                });
                $.each(provinceList,function (i,pro) {
                    if(pro.id == $("#province").val()){
                        findCityByProvince(i);
                    }
                });
            }
        })
        //选择省份时加载其收货地区
        $("#province").on("change",function () {
            var index = $(this).find("option:selected").index();
            findCityByProvince(index);
        });
    });
    //提交添加收货地址的表单
    $("#btn-addAddress").on("click",function () {
        $.ajax({
            url:basePath + "/address/addAddress",
            type:"post",
            data:$("#form-addAddress").serialize(),
            success:function () {
                window.location.reload(true);
            }
        })
    });
    //编辑收货地址
    $(".edit-address").on("click",function () {
        var addressId = $(this).parent().attr("data-addressId");
        $("#addressId").val(addressId);
        $.ajax({
            url:basePath + "/address/findAddressById?addressId="+addressId,
            type:"get",
            success:function (data) {
                $("#detailedAddress").val(data.detailedAddress);
                $("#address-name").val(data.name);
                $("#address-phone").val(data.phone);
                $.ajax({
                    url:basePath + "/address/findAllProvince",
                    type:"get",
                    success:function (address) {
                        provinceList = address;
                        $.each(provinceList,function (i,pro) {
                            $("#province2").append("<option value='"+pro.id+"'>"+pro.name+"</option>" +
                                "");
                        });
                        $("#province2").val(data.province.id);
                        $.each(provinceList,function (i,pro) {
                            if(pro.id == $("#province2").val()){
                                findCityByProvince2(i);
                            }
                        });
                        $("#city2").val(data.city.id);
                    }
                });
                //选择省份时加载其收货地区
                $("#province2").on("change",function () {
                    var index = $(this).find("option:selected").index();
                    findCityByProvince2(index);
                });
            }
        })
    });
    //提交修改收货地址的表单
    $("#btn-updateAddress").on("click",function () {
        $.ajax({
            url:basePath + "/address",
            type:"put",
            data:$("#form-updateAddress").serialize(),
            success:function () {
                window.location.reload(true);
            }
        })
    });
    //删除收货地址
    $(".delete-address").on("click",function () {
        var addressId = $(this).parent().attr("data-addressId");
        $.ajax({
            url:basePath + "/address/"+addressId,
            type:"delete",
            success:function () {
                window.location.reload(true);
            }
        })
    });
});