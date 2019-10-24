$(document).ready(function() {

	//按钮翻转1
    $(".piclist li").on("hover",function(){
		$(this).find("img").addClass("imghover");
		})

	$(".piclist li").mouseleave(function(){
		$(this).find("img").removeClass("imghover");
		})
		
		
//按钮翻转btnImg
    $(".btnImg li").on("hover",function(){
		$(this).find("img").addClass("btnImghover");

		})

	$(".btnImg li").mouseleave(function(){
		$(this).find("img").removeClass("btnImghover");
		})
	//登录标签

	$(".tabM  li").on("click",function(){
        var tab=$(this).index();
		$(this).parent().find("li").removeClass("hover")
		$(this).addClass("hover")
		$(this).parents(".tabbox").find(".Centerbox").css({display:"none"});
		$(this).parents(".tabbox").find(".Centerbox").eq(tab).fadeIn(500);
	})
	
	//办税服务
	$(".bsfwBtn span").on("click",function(){
		$(".bsfwBtn span").removeClass("bsfwHover")
		$(this).addClass("bsfwHover")
		$(".bsfwBtn ul").slideUp(300);
		$(this).next("ul").slideDown(300)
		})
		
		
		 //navigationTop路径
	 $(".nav_01").on("hover",function(){
		 $(".nav_01").children("a").removeClass("navacss");
		 $(".nav_01").children("span").removeClass("navaspan")	;	  
		 $(this).children("a").addClass("navacss");
		 $(this).children("span").addClass("navaspan");
		 })
		 
	$(".nav_01").mouseleave(function(){
		$(".nav_01").children("a").removeClass("navacss");
	    $(".nav_01").children("span").removeClass("navaspan");
		$(this).find(".navitop").fadeOut(500);
		$(".nav_01").find("img").removeClass("navispan90");
		})
	$(".nav_01 span").on("click",function(){
		$(this).children("img").toggleClass("navispan90");
		$(this).find(".navitop").fadeToggle(500);
		
		})	
		
	//控制图片
		
    $(".piclist02 ul").on("hover",function(){
	   $(this).find(".picBut").slideDown(100);		  			
    });
	
	$(".piclist02 ul").on("mouseleave",function(){
	   $(this).find(".picBut").slideUp(100);			
    });
	$(".butdel").on("click",function(){
		
	   $(this).parents("ul").fadeOut(600);
	   $(this).parent().remove();	 
	   
	       
    });
	
	$(".butfd").on("click",function(){
		
	    $(".indebg").fadeIn(100) 
		$(".picsrc").fadeIn(1200) 
	   
	       
    });
	
	$(".piccleas").on("click",function(){
		$(".picsrc").fadeOut(100) 
	    $(".indebg").fadeOut(1200) 
		
	   
	       
    });
	
	$(".book01").live("click",function(){
		$(this).toggleClass("bookmainhover")
		
		
	})
	$(".book02").live("click",function(){
		$(this).toggleClass("book02hover")				
	})
	
	$("#bookxj").live("click",function(){
		$(".book02hover img").remove();
		$(".book02hover").removeClass().addClass("book01").removeClass("book02hover");			
	});
	
	$("#booksj").live("click",function(){
		var bookhtml="<img src='../../images/table02/flash/book.png'/>"
		$(".book02hover img").remove();
		$(".bookmainhover").removeClass().addClass("book02").html(bookhtml)
		$(".bookgif ul").show();		
		$(".bookgif ul").animate({bottom:"600",opacity:"0", width:"10", marginLeft:"-5",left:"50%" },800)	;
		setTimeout(function(){
		$(".bookgif ul").hide();		
			
		$(".bookgif ul").remove();
		$(".bookgif").html("<ul></ul>");
			
			},800)
	})
	
	
	
	
	//温度计 
	$(".thermometer span").on("click",function(){
		var left=$(this).prev("ul").css("opacity")
		
		if(left==0){$(this).prev("ul").animate({opacity:"1", marginLeft:"0"},1000)}
		else($(this).prev("ul").animate({opacity:"0", marginLeft:"-300"},1000))
		
		
		})
		
//架 翻页 

 $(".bookpage span").on("click",function(){
	 var spani=$(this).index(); 
	 $(".bookpage span").removeClass()
	 $(this).addClass("hoverspan");
	// $(".bookdiv .bookmain").hide(1000)
	// $(".bookdiv .bookmain").eq(spani).show(1000)
	
	$(".booktitle").animate({opacity:"0"},1000)
	 $(".bookdiv .bookmain").animate({ width:"180",marginLeft:"-90",marginTop:"200"},1000)
     $(".bookdiv .bookmain ul").animate({opacity:"0"},500)
	 setTimeout(function(){
		$(".bookdiv .bookmain").css({display: "none",})						
		$(".bookdiv .bookmain").eq(spani).css({display: "block"})	
		$(".bookdiv .booktitle").eq(spani).animate({opacity:"1"},1000)		
			},1000)	
     $(".bookdiv .bookmain").eq(spani).animate({ width:"620",marginLeft:"-312",marginTop:"60"},1000);
	 $(".bookdiv .bookmain").eq(spani).find("ul").delay(800).animate({opacity:"1"},500)
	 
	 })		
	 
	 
	 
	 
	 
	 
	 $(".topleftmenu span").on("click",function(){
		$(".topleftmenu ul").slideToggle(800) 
	     
		
		})
	//$(".butleft").on("click",function(){
	 // $(this).parent().next("img").addClass("picjpgleft90")
	   
   // })
	
});



 