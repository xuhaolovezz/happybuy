$(function(){
    var basePath = $("#basePath").val();
	$(".i1").on('click',function(){
		$('.i1').css('background-color','#AE0000');
		$('#i2').css('background-color','#FF0036');
		$('.left').show();
		$('.right').hide();
		});
		
	$("#i2").on('click',function(){
		$('.i1').css('background-color','#FF0036');
		$('#i2').css('background-color','crimson');
		$('.left').hide();
		$('.right').show();
	});

	$(".s1").on('mouseover',function(){
		$(this).css('border-color','#FF0036');
		var i=$(this).attr("src");
		$('.img-b img').attr('src',i);
	})
	
	$(".s1").on('mouseout',function(){
		$(this).css('border-color','#F7F7F7');
	})
	
	$(".g4").on('click',function(){
		var i=$(this).attr("src");
		$(this).parent().parent().parent().find('.g5 img').attr('src',i);
        $(this).parent().parent().parent().find('.g5 img').show();
	})
	
	$(".g5 img").on('click',function(){
		$(this).hide();
	})
    function accAdd(a,b){
        var c, d, e;
        try {
            c = a.toString().split(".")[1].length;
        } catch (f) {
            c = 0;
        }
        try {
            d = b.toString().split(".")[1].length;
        } catch (f) {
            d = 0;
        }
        return e = Math.pow(10, Math.max(c, d)), (mul(a, e) + mul(b, e)) / e;
    }
    function mul(a, b) {
        var c = 0,
            d = a.toString(),
            e = b.toString();
        try {
            c += d.split(".")[1].length;
        } catch (f) {}
        try {
            c += e.split(".")[1].length;
        } catch (f) {}
        return Number(d.replace(".", "")) * Number(e.replace(".", "")) / Math.pow(10, c);
    }
    //商品数量-1
    $(".commodity-number-sub").on("click",function () {
        var oldNumber = $(this).next().val();
        var number;
        var commodityId = $(this).parent().attr("data-commId");
        if(oldNumber > 1){
            number = oldNumber - 1;
            $(this).next().val(number);
            updateCommodityNumber(this,commodityId,number,oldNumber);
        }
    });

    //商品数量+1
    $(".commodity-number-add").on("click",function () {
        // var number = $(".commodity-number").val();
        var oldNumber = $(this).prev().val();
        var number;
        var commodityId = $(this).parent().attr("data-commId");
        if(oldNumber > 0){
            number = Number(oldNumber)+Number(1);
            $(this).prev().val(number);
            updateCommodityNumber(this, commodityId, number,oldNumber);
        }
    });
    var oNumber;
    $(".commodity-number").on("focus",function () {
        oNumber = $(this).val();
    });
    $(".commodity-number").on("change",function () {
        var commodityId = $(this).parent().attr("data-commId");
        var number = $(this).val();
        if(oNumber != number){
            updateCommodityNumber(this,commodityId,number,oNumber);
        }
    });
    function updateCommodityNumber(that, commodityId, commodityNumber, oldNumber) {
        var shopCartId = $("#shopCartId").val();
        var stock = $(that).parent().attr("data-stock");
        if (commodityNumber > 200) {
            $(".modal-body").text("商品数量不能超过200！");
            $('#alertModal').modal('show');
            $(that).parent().children().eq(2).val(oldNumber);
        }
    }

});
