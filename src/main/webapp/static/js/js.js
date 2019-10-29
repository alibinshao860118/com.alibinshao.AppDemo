
$(document).ready(function() {
	//万志勇滚动
	$(".gd_list").css({width:$(window).width()})
	$(".gd_list li").css({width:$(window).width()});
	
$(".btn_next").click(function(){
	var sh_wd=$(window).width();
	$(".gd_list ul").animate({marginLeft:-sh_wd});
	
	//模拟从服务端取数
	$("body").append("<div class='bg'>"
			 +'<iframe src="load.html" frameborder="none"  style="width:100%; height:100%;"></iframe>'
			 +"</div>");
	//$("body").css({overflow:'hidden'})//定义滚动条不滚动
	 $(".bg").animate({opacity:'0.6'},500);
	 setTimeout("removeLoad2()",500);
	})	
	
	
	

$(".btn_next2").click(function(){
	
	 var tc_width=$(".tc").width()/2;
	 var tc_height=$(".tc").height()/2;
	 $(".tc").animate({marginTop:-(tc_height+20),marginLeft:-tc_width});
	 $("body").append("<div class='bg'></div>");
	//$("body").css({overflow:'hidden'})//定义滚动条不滚动
	 $(".bg").animate({opacity:'0.9'},500);
	 $(".tc").fadeIn();
	
	/*if(confirm("确定需要缴款吗")){
		var sh_wd=$(window).width();
		$(".gd_list ul").animate({marginLeft:-sh_wd*2});		
	}else{
		return;
	}*/
	})		
$(".btn_pre").click(function(){
	$(".gd_list ul").animate({marginLeft:0})
	})		
	
$(".iframe1").css({height:$(window).height()-85})


$(".right_box").css({
	height:$(window).height()-59
	})

	//右边高度
		$(".head_left_btn").toggle(
		function (){
		$(".left_menu").addClass("left_menu2")
		$(".left_box").animate({width:60})
		//----
		var shbox3=$(".right_box").width();
		$(".right_icon_box").animate({left:60,width:shbox3+140})
		},
		function (){
		$(".left_menu").removeClass("left_menu2")
		$(".left_box").animate({width:201})
		//----
	     var shbox3=$(".right_box").width();
		$(".right_icon_box").animate({left:201,width:shbox3-139})
		}
		);
		
		
		
		$(".head_setting").toggle(
		function (){
		$(".head_setting i").animate({width:24})
	    $(".right_icons").addClass("right_icons2")
		$(".right_box2").animate({width:24});
		$(".right_box2 span").animate({ opacity:0},500).hide();
		$(".right_box2 img").animate({width:18});
		},
		function (){
	    $(".head_setting i").animate({width:48})
	    $(".right_icons").removeClass("right_icons2")
		$(".right_box2").animate({width:48})
		$(".right_box2 span").animate({ opacity:1},500).show();
		$(".right_box2 img").animate({width:33})
		}
		);
		
		
	$(".right_icons2 img").live('hover',function(){
		$(this).next().animate({ opacity:1},500).show();
		})	
$(".right_icons2 img").live('mouseleave',function(){
	$(this).next().animate({ opacity:0},500).hide();
	
		})


	
//---------------------效果----------------------------
	$(".left_menu h3").click(function(){
		
		$(this).next("ul").slideToggle()
		$(this).parent("li").siblings().children("ul").slideUp();
		$(this).parent("li").siblings().children("ul").children("li").children("div").slideUp();
		$(this).addClass("h3_bg3").parent("li").siblings().children("h3").removeClass("h3_bg3");
		
		$(this).parent("li").find("div").slideUp()
		
		})	


$(".left_menu2 h3").live('hover',function(){
		$(this).next("ul").show()
		$(this).parent("li").siblings().children("ul").hide()
		$(this).parent("li").siblings().children("ul").children("li").children("div").hide();
		$(this).addClass("h3_bg2").parent("li").siblings().children("h3").removeClass("h3_bg2");
		
		})	
$(".left_menu2 li").live('mouseleave',function(){
		$(this).children("ul").slideUp()
		$(".left_menu2 h3").removeClass("h3_bg2");
		
		})
				
	/*$(".left_menu ul ul li").children("a").click(function(){
		
		$(this).addClass("li_bg1").parent().siblings().children("a").removeClass("li_bg1")
		$(this).next("div").slideToggle().parent("li").siblings().children("div").slideUp()
	
		})	
		
		$(".left_menu div a").click(function(){
		
		$(this).parent().fadeOut()
		})	*/
        $(".left_menu ul ul li").children("a").click(function(){
		
		$(this).addClass("li_bg1").parent().siblings().children("a").removeClass("li_bg1")
		$(this).next("div").slideToggle().parent("li").siblings().children("div").slideUp()
	
		})	
		
		//$(".left_menu ul ul li").mouseover(function(){
		//	$(this).siblings().children("div").slideUp()
	    //})
		
		$(".left_menu div a").click(function(){
		
		//$(this).parent().fadeOut()
		})	
		//********

	
		$(".box_list").click(function(){
			$(this).addClass("box_list_a").siblings().removeClass("box_list_a")
			$(this).children("ul").css({display:"block"}).parent().siblings().children("ul").css({display:"none"})
			})
			
			//底部效果
		$(".foot li i").hover(function(){
			$(this).next("span").animate({ marginTop:-42,opacity:1},200).parent("li").siblings().children("span").animate({ marginTop:-35,opacity:0},100)
			})
			
			$(".foot li i").mouseleave(function(){
			$(this).next("span").animate({marginTop:-35,opacity:0},100)
			})
			
			
	// alert("请用IE9及以上版本或谷歌内核浏览器查看效果更佳")
			
			
			
			

 $(".down").on("click",function(){
	 var tc_width=$(this).next(".tc").width()/2
	 var tc_height=$(this).next(".tc").height()/2
	 $(".tc").animate({marginTop:-(tc_height+20),marginLeft:-tc_width})
	 $("body").append("<div class='bg'></div>");
	//$("body").css({overflow:'hidden'})//定义滚动条不滚动
	 $(".bg").animate({opacity:'0.9'},500)
	 $(this).next(".tc").fadeIn()
	 
	 })
 $(".close_btn").on("click",function(){//alertbtn
	 //$("body").css({overflow:'auto'})
	 $(".bg").animate({opacity:'0'},500,function(){ $(".bg").remove()})
	 $(this).parent(".tc").fadeOut();
	 
	
	 })
	 
	$(".close").live("click",function(){//alertbtn
		 var tabIndex = $(this).parent("li").attr("id").substring(5);
		 
		 var tabIndex1 = $(this).parent("li").prev().attr("id").substring(5);
		 
		 var nextTab = $(this).parent("li").next().attr("id");
		 //alert("tabIndex1:"+tabIndex1);
		 $(this).parent("li").remove();
		 var tabDivFrame = "divFrame"+tabIndex;
		 $("#"+tabDivFrame).remove();
		 
		 
		 if(nextTab === undefined){
			 var tabIndexInt = parseInt(tabIndex) - 1;
			  tabDivFrame = "divFrame"+tabIndex1;
			  $("#"+tabDivFrame).css('display','block');
			  $("#tabli"+tabIndex1).addClass("unlike");
		 }else{
		 }
		 //不存在后续TAB
		 /*if(nextTab === undefined){
				 
		}else{*/
			/*var tabIndexInt = parseInt(tabIndex) - 1;
			  tabDivFrame = "divFrame"+tabIndex1;
			  $("#"+tabDivFrame).css('display','block');
			  $("#tabli"+tabIndex1).addClass("unlike");*/
		//}
		  
	
	 })
	 
	 $(".tabClick").live("click",function(){//
		 var tabIndex = $(this).parent("li").attr("id").substring(5);
		 
		 
		 var nextTab = $(this).parent("li").next().attr("id");
		 
		 
		 
		 $("#tablis").children().removeClass("unlike");
		 $(this).parent("li").addClass("unlike");
		 
		 $("#divTabs").children().css('display','none');
		 var tabDivFrame = "divFrame"+tabIndex;
		 $("#"+tabDivFrame).css('display','block');
	 })
	 
	//inpunt
	$(".input02").focus(function(){
        $(this)
		$(this).parent().parent().parent().parent().parent("div").addClass("inputst")
		})
	$(".input02").blur(function(){
		$(this).parent().parent().parent().parent().parent("div").removeClass("inputst")
		
		})
		
		
	$(".right2_icons li").hover(function(){
		//$(this).children("span").fadeIn().parent("li").siblings().children("span").fadeOut()
		
		})
		
		
			
	
});

function jkqx(){
	 $(".bg").animate({opacity:'0'},500,function(){ $(".bg").remove()});
	 $(".tc").fadeOut();
};

function jkqd(){
	jkqx();
	var sh_wd=$(window).width();
	$(".gd_list ul").animate({marginLeft:-sh_wd*2});	
};



function onBszm(){
	document.getElementById("div2").style.display='block';
	document.getElementById("div1").style.display='none';
}

function onXtgl(){
	document.getElementById("div1").style.display='block';
	document.getElementById("div2").style.display='none';
}

function removeLoad2(){
	//todo 加载数据
	document.secondFrame.document.getElementById("dataTr1").style.display ="";
	document.secondFrame.document.getElementById("dataTr2").style.display ="";
	
	document.secondFrame.document.getElementById("pageTable").style.display ="";
	$(".bg").remove();
}

/*function onLiClose(){
	 $(this).parent("li").remove();
}*/

/**
 * 身份证校验
 * @param idcard
 * @return
 */
function verifyIdCard(idcard) {
	var area={11:"北京",12:"天津",13:"河北",14:"山西",15:"内蒙古",21:"辽宁",22:"吉林",23:"黑龙江",31:"上海",32:"江苏",33:"浙江",34:"安徽",35:"福建",36:"江西",37:"山东",41:"河南",42:"湖北",43:"湖南",44:"广东",45:"广西",46:"海南",50:"重庆",51:"四川",52:"贵州",53:"云南",54:"西藏",61:"陕西",62:"甘肃",63:"青海",64:"宁夏",65:"新疆",71:"台湾",81:"香港",82:"澳门",91:"国外"} 
	var idcard,Y,JYM;
	var S,M;
	var idcard_array = new Array();
	idcard_array = idcard.split("");
	//地区检验
	if(area[parseInt(idcard.substr(0,2))]==null) return "地区非法!";
	//身份号码位数及格式检验
	switch(idcard.length){
		case 15:
			if ( (parseInt(idcard.substr(6,2))+1900) % 4 == 0 || ((parseInt(idcard.substr(6,2))+1900) % 100 == 0 && (parseInt(idcard.substr(6,2))+1900) % 4 == 0 )){
				ereg=/^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}$/;//测试出生日期的合法性
			} else {
				ereg=/^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}$/;//测试出生日期的合法性
			}
			if(ereg.test(idcard)) return null;
			else return "出生日期超出范围或含有非法字符!";
			break;
		case 18:
			//18位身份号码检测
			//出生日期的合法性检查 
			//闰年月日:((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))
			//平年月日:((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))
			if ( parseInt(idcard.substr(6,4)) % 4 == 0 || (parseInt(idcard.substr(6,4)) % 100 == 0 && parseInt(idcard.substr(6,4))%4 == 0 )){
				ereg=/^[1-9][0-9]{5}[0-9]{4}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}[0-9Xx]$/;//闰年出生日期的合法性正则表达式
			} else {
				ereg=/^[1-9][0-9]{5}[0-9]{4}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}[0-9Xx]$/;//平年出生日期的合法性正则表达式
			}
			if(ereg.test(idcard)){//测试出生日期的合法性
				//计算校验位
				S = (parseInt(idcard_array[0]) + parseInt(idcard_array[10])) * 7
				+ (parseInt(idcard_array[1]) + parseInt(idcard_array[11])) * 9
				+ (parseInt(idcard_array[2]) + parseInt(idcard_array[12])) * 10
				+ (parseInt(idcard_array[3]) + parseInt(idcard_array[13])) * 5
				+ (parseInt(idcard_array[4]) + parseInt(idcard_array[14])) * 8
				+ (parseInt(idcard_array[5]) + parseInt(idcard_array[15])) * 4
				+ (parseInt(idcard_array[6]) + parseInt(idcard_array[16])) * 2
				+ parseInt(idcard_array[7]) * 1 
				+ parseInt(idcard_array[8]) * 6
				+ parseInt(idcard_array[9]) * 3 ;
				Y = S % 11;
				M = "F";
				JYM = "10X98765432";
				M = JYM.substr(Y,1);//判断校验位
				if(M == idcard_array[17]) return null; //检测ID的校验位
				else return "校验位错误!";
			}
			else return "出生日期超出范围或含有非法字符!";
			break;
		default:
			return "位数不对!";
			break;
	}
	return null;
}


