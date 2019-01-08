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
		var intro = $("#introPage .text");
		var winW = $(window).width();
		var winH = $(window).height();
		var introText_W =  intro.width();
		var introText_H =  intro.height();
		$("#introPage .text").css({
			left: (winW - introText_W)/ 2,
			top: (winH - introText_H)/ 2
		});
});
$(function() {
	$("#introPage div.text01 dt, #introPage div.text01 dd").delay(4000).fadeOut(600);
	$("#introPage div.text02 ").delay(6000).fadeIn(600);
	$("#introPage div.text02 ").delay(4000).fadeOut(600);
	$("#introPage div.introLogo ").delay(13000).fadeIn(600);
	$("div.text01 .line .left").delay(100).animate({
		left : "0",
		opacity : 1
	}, 2000).delay(2000).animate({
		left : "50%",
		opacity : 0
	}, 2000).delay(100).animate({
		left : "0",
		opacity : 1
	}, 2000).delay(2000).animate({
		left : "50%",
		opacity : 0
	}, 2000).delay(100).animate({
		left : "0",
		opacity : 1
	}, 2000);

	$("div.text01 .line .right").delay(100).animate({
		right : "0",
		opacity : 1
	}, 2000).delay(2000).animate({
		right : "50%",
		opacity : 0
	}, 2000).delay(100).animate({
		right : "0",
		opacity : 1
	}, 2000).delay(2000).animate({
		right : "50%",
		opacity : 0
	}, 2000).delay(100).animate({
		right : "0",
		opacity : 1
	}, 2000);
});
</script>
<style>
#introPage { background:url("img/introBg.png") repeat; width:100%; height:100%; position:absolute; top:0; z-index:99;}
#introPage div { width:1040px; height:266px; position:absolute; margin:0 auto;}
#introPage div.text { text-align:center; left: 431.5px; top: 331.5px;}
#introPage div.text .line p { position:absolute; opacity:1;}
#introPage div.text .line .left { left:50%; opacity:0;}
#introPage div.text .line .right { right:50%; opacity:0;}
#introPage div.text dl { text-transform:uppercase;  color:#bc9e69; text-align:center; margin:99px 0 0 0;}
#introPage div.text dl dt { font-size:48px; letter-spacing:5px; display:inline-block; width:0; text-align:center;   white-space: nowrap;  overflow: hidden;   }
#introPage div.text dl dt span { font-weight:300; }
#introPage div.text dl dd { font-size:18px; 	margin:26px auto 0; 	text-align: center; 	width: 0px; 	white-space: nowrap;  	overflow: hidden; }
#introPage div.text01 dl dt { animation: introText 2s forwards steps(31,end); animation-delay: 1s;/*animation-delay:0.5s; animation-play-state:paused;*/}
#introPage div.text01 dl dd { 	animation: introText 2s forwards steps(31,end); 	animation-delay: 3s; }
#introPage div.text02 { display:none; }
#introPage div.text02 dl dt { animation: introText 2s forwards steps(31,end); animation-delay: 1s;/*animation-delay:0.5s; animation-play-state:paused;*/}
#introPage div.text02 dl dd { 	animation: introText 2s forwards steps(31,end); 	animation-delay: 3s; }
#introPage div.introLogo { margin:-160px 0 0 0; display:none;}
#introPage div.introLogo .mark { margin:0 0 43px 0; }
#introPage .closeBth { width:9px ;height:10px; left:50%;bottom:40px; position:absolute;}
#introPage .closeBth button { background:url("img/introClose.png") no-repeat center; border:none; width:9px; height:10px; }
@keyframes introText {
    from {
        width: 10px;
    }
    to {
        width: 100%;
    }
}
</style>
</head>
<body>
<section id="introPage">
		<div class="text01 text">
				<div class="line">
					<p class="left"><img src="img/introLeftLine.png" alt="" /></p>
					<p class="right"><img src="img/introRightLine.png" alt="" /></p>
				</div>
				<dl>
					<dt>안녕하세요 <span>on Design</span></dt>
					<dd>design of dalidesigns is different</dd>
				</dl>
			</div>
			<div class="text02 text">
				<dl>
					<dt>leading <span>DALI DESIGNS</span></dt>
					<dd>Add value to the design</dd>
				</dl>
			</div>
			<div class="introLogo text">
				<p class="mark"><img src="img/intromark.png" alt="" /></p>
				<p class="logo"><img src="img/introLogo.png" alt="DALI DESIGNS" /></p>
			</div>
			<p class="closeBth">
				<button></button>
			</p>
			</section>
</body>
</html>