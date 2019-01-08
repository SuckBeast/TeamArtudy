<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	/*인트로 애니메이션*/
	$('#bg').css("background-image", "url(img/introBgART1.png)").delay(100).animate({ 
		opacity:1
	},1500).delay(100).animate({
		opacity:0
	},1500);
	
	var cnt = 2;
	
	function introAnimation(cnt){
		$('#bg').css("background-image", "url(img/introBgART"+cnt+".png)");
 		$("#bg").delay(100).animate({ 
			opacity:1
		},1500).delay(100).animate({
			opacity:0
		},1500);
	}
	
	playBg = setInterval(() => {
		introAnimation(cnt);
		
		if(cnt>4){
			$("#introPage").hide();
			$("#wrap ").css({
				//overflow:"visible"
				height:"auto"
			});	
			clearInterval(playBg);
		}
		cnt++;
		
	}, 3200);
	 
 	/* if(sessionStorage.getItem("noIntro")!="intro"){
		introAnimation();
	}else{
		$("#introPage").hide();
		$("#wrap ").css({
			//overflow:"visible"
			height:"auto"
		});	
	}	
	function setSession(){
		sessionStorage.setItem("noIntro", "intro" );
	}  */
	

	/*인트로 닫기 버튼*/
	$("#introPage .closeBth").click(function(){
		mainclose();
		setSession();
	});
	$(".movieArrow").css({
		"animation-play-state":"running"
	});
	setTimeout(function(){
		setSession();
	},16000);

	function mainclose(code){
		$("#introPage").fadeOut(600,function(){
			$("#wrap ").css({
				overflow:"visible"
			});
		});
	}
	});
</script>
<style>
#introPage { background:url("img/introBg.png") repeat; width:100%; height:100%; position:absolute; top:0; z-index:99;}
#introPage div { width:1860px; height:950px; position:absolute; z-index:-1; margin:0 auto;}
#introPage div.text { text-align:center; left:0; top: 0;}
#introPage div.text .line p { position:absolute; opacity:1;}
#introPage div.text .line .bg { margin-top:0; left:0; opacity:1;}
#introPage div.text .line .bg img { width:100%;height:100%;}
#bg{}


</style>
</head>
<body>
<div id="wrap">
		<section id="introPage">
			<div class="text01 text">
				<div class="line">
					<div id="bg"></div>
<!-- 					<p class="bg1 bg"><img src="img/introBgART.png" alt="" /></p>
					<p class="bg2 bg"><img src="img/introBgART2.png" alt="" /></p>
					<p class="bg3 bg"><img src="img/introBgART3.png" alt="" /></p>
					<p class="bg4 bg"><img src="img/introBgART4.png" alt="" /></p> -->
				</div>
			</div>
			<p class="closeBth">
				<button></button>
			</p>
		</section>
		</div>
</body>
</html>