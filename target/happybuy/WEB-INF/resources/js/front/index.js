$(function(){
	/*图片轮播*/
	var j=1;
	function time(){
		if(j!=5){
			$('.h1').eq(j-1).hide();
			$('.numbox a').eq(j-1).css('background-color','#FFFFFF');
			$('.h1').eq(j).show();
			$('.numbox a').eq(j).css('background-color','#FF0036');
			j++;
		}
		else{
			$('.h1').eq(4).hide();
			$('.numbox a').eq(4).css('background-color','#FFFFFF');
			$('.h1').eq(0).show();
			$('.numbox a').eq(0).css('background-color','#FF0036');
			j=1;
		}
	}
	
	var s=setInterval(function(){time()},5000);
	
	$(".h1").on('mouseover',function(){
		clearInterval(s);
	})
	$(".h1").on('mouseout',function(){
		s=setInterval(function(){time()},5000);
	})
	
	
	$(".numbox a").on('mouseover',function(){
		var i=$(this).index();
		$(".h1").hide();
		clearInterval(s);
		$(".numbox a").css('background-color','#FFFFFF');
		$(this).css('background-color','#FF0036');
		$(".h1").eq(i).show();
		
	})
	$(".numbox a").on('mouseout',function(){
		var i=$(this).index();	
		j=i+1;
		setTimeout(function(){
			$('.numbox a').eq(j-1).css('background-color','#FFFFFF');
		},5000);	
		s=setInterval(function(){time()},5000);
		
		
	})

	/*导航栏*/
	$(".inner").on('mouseover',function(){
		var i=$(this).index();
		$(".colums").eq(i).show();
	})
	$(".inner").on('mouseout',function(){
		var i=$(this).index();
		$(".colums").eq(i).hide();
	})
	
	

})
