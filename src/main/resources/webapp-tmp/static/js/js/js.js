$(document).ready(function(){

//左菜单
$(".left_menu h3").click(function(){
		$(this).next("ul").slideDown()
		$(this).parent("li").siblings().children("ul").slideUp();
		$(this).parent("li").siblings().children("ul").children("li").children("div").slideUp();
		$(".left_menu h3").removeClass("h3_bg3");
		$(this).addClass("h3_bg3")
		$(".left_menu h3").children("a").children("i").removeClass("fa-angle-up").addClass("fa-angle-down")
		$(this).children("a").children("i").removeClass("fa-angle-down").addClass("fa-angle-up")
		})	

		//********
 $(".forjs .quan").hover(function(){
	 var thislt=$(this).index() 
	 $(".stepbox ul li").css({display:'none'})
	 $(".stepbox ul li").eq(thislt).css({display:'block'})
	 })
	


	$("#RadioGroup1_3").click(function(){
		$(".zjqs2").show()
		})
	

//用户菜单

$(".admin a").on("click",function(){	
	$(".use-menu").fadeToggle(500)
	})

$(".use-menu").mouseleave(function(){
	$(".use-menu").fadeOut(500)
	})	
	
//换肤

$(".style1 a").on("click",function(){	
	$(".xzstyle").fadeToggle(500)
	})

$(".xzstyle").mouseleave(function(){
	$(".xzstyle").fadeOut(500)
	})		
	
	
	//头像
	    $(".user").click(
            function() {
            $(this).addClass("forarrow")
			$(".head_wind").show()
			}
        ); 
		$(".user").mouseleave(function(){
			$(this).removeClass("forarrow")
			$(".head_wind").hide()
			})

	//新增按钮
	    $(".addbtn").click(
            function() {
			$(".addbtn_wind").show()
			}
        ); 
		$(".addbtn").mouseleave(function(){
			$(".addbtn_wind").hide()
			})
						
			
    //*****问答展开关闭****
	$(".table_box_title").click(function(){
		$(this).next("table").fadeToggle()
		$(this).children("i").toggleClass("fa-angle-down")
		})
		
		$(".close_allboxbtn").click(function(){
		$(this).next("div").fadeToggle()
		$(this).children("i").toggleClass("fa-angle-down")
		})
		
	//点赞
	$(".search_result li").hover(function(){
		$(this).children().children("em").show()
		$(this).siblings().children("a").children("em").hide()
		})	
	$(".search_result li a").mouseout(function(){
			$(this).children().children("em").hide()
			
			})	
	//修订
   $(".xiuding h2 span>i").click(function(){
	   $(this).next("div").fadeToggle()
	    $(".xiuding h3 a").fadeToggle()
	   })
	
  //TBS
   $(".tabs01 li,.tabs02 li,.tree_menu li").click(function(){
	   $(this).children("a").addClass("active")
	   $(this).siblings().children().removeClass("active")
	   })
 //背景出窗口位置
 	$(".modal-content").each(function(index, element) {
		var thisw=$(this).width()
		var thish=$(this).height()
        $(this).css({'marginLeft':-thisw/2,"marginTop":-thish/2-30})
		
    });
	
	//***
	$(".close,.closebtn").click(function(){
		$(this).parent().parent().fadeOut()
		$("#black_bg").fadeOut()
		})
	//****点赞******
	
	//***
	 $(".xgnrlist ul li").each(function() {
           $(this).children("span").text($(this).index()+1+".")
        });	
	//***列表排版
	
	var length01=$(".big_icons ul li").length
	if(length01<5){
		$(".big_icons ul li").css({"float":"none"})
		}else{
			}

});

//************
function setTab(name,cursel,n){
for(i=1;i<=n;i++){
var menu=document.getElementById(name+i);
var con=document.getElementById("con_"+name+"_"+i);
menu.className=i==cursel?"active":"";
con.style.display=i==cursel?"block":"none";
}
}




/*
$(function() {
	$("#browser").treeview(
	 {
	   collapsed: true,
	   animated: "medium",
	   control:"#sidetreecontrol",
	   persist: "location"
	}
	);
	$("#add").click(function() {
		var branches = $("<li><span class='folder'>New Sublist</span><ul>" + 
			"<li><span class='file'>Item1</span></li>" + 
			"<li><span class='file'>Item2</span></li></ul></li>").appendTo("#browser");
		branches = $("<li class='closed'><span class='folder'>New Sublist</span><ul><li><span class='file'>Item1</span></li><li><span class='file'>Item2</span></li></ul></li>").prependTo("#folder21");
		$("#browser").treeview({
			add: branches
		});
	});
	$("#browser").bind("contextmenu", function(event) {
		if ($(event.target).is("li") || $(event.target).parents("li").length) {
			$("#browser").treeview({
				remove: $(event.target).parents("li").filter(":first")
			});
			return false;
		}
	});
	
	
	
	
	
	
	
})
*/



function TestBlack(TagName){  
//document.getElementsByClassName(TagName);  
var aaa=$(body).hasClass(TagName)
alert(TagName)
 if(aaa.style.display==""){  
  aaa.style.display = "none";  
 }else{  
  aaa.style.display = "";  
 }  
}  




