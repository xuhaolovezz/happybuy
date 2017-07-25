$(function(){
	
	$(".c-left p").on('click',function(){
		var i=$(this).index();
		$('.c-left p a').removeClass('focus');
		$(this).children('a').addClass('focus');
		if(i<2&&i>0){
			i=i-1;
		}
		else if(i<9){
			i=i-2;
		}
		else{
			i=i-3;
		}
		$(".c-right").hide();
		$(".c-right").eq(i).show();
	})
	

	
})
