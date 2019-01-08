<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="board.*" %>
<%@ page import="java.util.*" %>

<jsp:useBean id="dao" class="board.DAO"/>

<%	
	int total = dao.count();
	System.out.print(total);
	ArrayList<VO> alist = dao.getMemberList();
	int size = alist.size();
	int size2 = size;
	
	final int ROWSIZE = 10;
	final int BLOCK = 10;
	int indent = 0;

	int pg = 1;
	
	if(request.getParameter("pg")!=null) {
		pg = Integer.parseInt(request.getParameter("pg"));
	}
	
	int end = (pg*ROWSIZE);
	
	int allPage = 0;

	int startPage = ((pg-1)/BLOCK*BLOCK)+1;
	int endPage = ((pg-1)/BLOCK*BLOCK)+BLOCK;
	
	allPage = (int)Math.ceil(total/(double)ROWSIZE);
	
	if(endPage > allPage) {
		endPage = allPage;
	}
	
	size2 -=end;
	if(size2 < 0) {
		end = size;
	}
	
%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/onepage-scroll.css">
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/jquery.onepage-scroll.js"></script>
<link rel="stylesheet" type="text/css" href="css/normalize.css" />
		<link rel="stylesheet" type="text/css" href="css/demo.css" />
		<link rel="stylesheet" type="text/css" href="css/component.css" />
		<script src="js/modernizr.custom.js"></script>
<script type="text/javascript">

$(document).ready(function() {
	$(".main").onepage_scroll({
		  sectionContainer: ".main section",
		  responsiveFallback: 600,
		  loop: true
		});

	function introSize(){
		
			var intro = $("#introPage .text");
			var winW = $(window).width();
			var winH = $(window).height();
			var introText_W =  intro.width();
			var introText_H =  intro.height();
			$("#introPage .text").css({
				left: (winW - introText_W)/ 2,
				top: (winH - introText_H)/ 2
			});
		
	};
	introSize();
	
	$(window).resize(function(){
		var winW = $(window).width();
		if ( winW >= 1200){
			introSize();
		};
	});

	/*인트로 애니메이션*/
	
	 function introAnimation(){
    //$(function(){
       $("#wrapper .main").animate({
         opacity:0
      },0);
       //$("#wrapper .main").delay(14500).fadeIn(200);
      $("#introPage div.text01 dt, #introPage div.text01 dd").delay(4000).fadeOut(600);
      $("#introPage div.text02 ").delay(4000).fadeIn(600);
       $("#wrapper #introPage").delay(5200).fadeIn(2000,function(){$("#wrapper #introPage").css({
         "background-image": "linear-gradient(to top, #e6e9f0 0%, #eef1f5 100%)",
         "opacity":"0"
         }).animate({opacity:1},2000);
      }); 
     
      $("#introPage div.text02 ").delay(10000).fadeOut(600);
      $("#introPage div.introLogo ").delay(11000).fadeIn(600,function(){   
         $("#introPage").delay(1000).fadeOut();
         $("#wrapper .main").css({
            //overflow:"visible",
            "opacity":"1",
            height:"100%"
         });
      });
      
      
      $("div.text .line .left").delay(100).animate({ 
         left : "0" ,
         opacity:1
      },2000).delay(2000).animate({
         left:"50%"   ,
         opacity:0
      },2000);
      $("div.text .line .right").delay(100).animate({ 
         right : "0" ,
         opacity:1
      },2000).delay(2000).animate({
         right:"50%",   
         opacity:0
      },2000);
      
      $("div.text02 .line .ART").delay(4000).animate({ 
         right : "100%" ,
         opacity:0
      },1500).delay(200).animate({ 
         right : "35%" ,         //5200
         opacity:1
         
      },1500).delay(200).animate({
         right:"100%",         //9200
         opacity:0
      },1000);
      
      /* .delay(3000).animate({ 
         right : "45%" ,         //14200
         opacity:1
      },2000).delay(1000).animate({ 
         right : "45%" ,         //17200
         opacity:1
      },2000); */
      
      
      $("div.text02 .line .STUDY").delay(6000).animate({ 
         left : "100%" ,
         opacity:0
      },0).delay(1200).animate({
         left:"25%"   ,         //8200
         opacity:1
      },1500).delay(1000).animate({ 
         left : "100%" ,         //12200
         opacity:0
      },1000);
      
		
		/* .delay(0).animate({
			left:"45%"	,			//14200
			opacity:1
		},2000); */
	}
	
 	
	
 	if(sessionStorage.getItem("noIntro")!="intro"){
		introAnimation();
	}else{
		$("#introPage").hide();
		$("#wrapper .main").css({
			//overflow:"visible"
			"opacity":"1",
			height:"100%"
		});	
	}

	
	function setSession(){
		sessionStorage.setItem("noIntro", "intro" );
	} 
	

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
			$("#wrapper .main").css({
				overflow:"visible",
				"opacity":"1"
			});
		});
	}
	
	
	});

function paMove(num){
	$(".main").moveTo(num);
	}

</script>
<style>
/* 슬라이드 사이드메뉴 스타일 */

#gn-menu{
        text-align: center;
        padding: 10px 0px;
        width: 100%;
         position: fixed;
      }

@import url(https://fonts.googleapis.com/css?family=Open+Sans:400,300,600);	
body{
background-color: #fff;
}
div > .gn-menu-main > li:last-child{
	float : left;
	z-index:  500;
	position: absolute;
	
}
html {
  border-top: 5px solid #fff;
  color: #2a2a2a;
}

html, body {
  margin: 0;
  padding: 0;
  font-family: 'Open Sans';
}

#logo {
  background-color: #fff;
  text-align: center;
  font-weight: 100;
  
}
#logo img{
width: 350px;
height: 150px;
}

#slider {

  position: relative;
  overflow: hidden;
  margin: 80px auto 0 auto;
  border-radius: 4px;
  width: 100%;
  height : 880px;
}

#slider ul {

  position: relative;
  margin: 0;
  padding: 0;
  height: 200px;
  list-style: none;
}

#slider ul li {

  position: relative;
  display: block;
  float: left;
  margin: 0;
  padding: 0;
  width: 1920px;
  height: 880px;
  background: #ccc;
  text-align: center;
  line-height: 300px;
}

a.control_prev, a.control_next {
  position: absolute;
  top: 20px; 
  z-index: 999;
  display: block;
  padding: 4% 3%;
  width: auto;
  height: 865px;
  background: #ffffff;
  color: #000000;
  text-decoration: none;
  font-weight: 600;
  font-size: 18px;
  opacity: 0.05;
  cursor: pointer;	
  line-height: 40;
}

a.control_prev:hover, a.control_next:hover {
  opacity: 0.5;
  -webkit-transition: all 0.2s ease;
}

a.control_prev {
  border-radius: 0 2px 2px 0;
}

a.control_next {
  right: 0;
  border-radius: 2px 0 0 2px;
}

.slider_option {
  position: relative;
  margin: 10px auto;
  width: 160px;
  font-size: 18px;
}

/* 슬라이드 사이드메뉴 스타일 끝 */
/*갤러리 스타일 시작*/
.abc{width:100%;height:1080px;}

/*갤러리 스타일 끝*/
/*패럴랙스 스타일 시작*/
#wrapper {
    	height: 100% !important;
    	height: 100%;
    	margin: 0 auto; 
    	overflow: hidden;
    }
  .main {
      float: left;
      width: 100%;
      margin: 0 auto;
    }
.main section  {
      overflow: hidden;
    }
.main section.page1 {
    background-image: linear-gradient(to top, #e6e9f0 0%, #eef1f5 100%);
    }
.main section.page2 {
     background-image: linear-gradient(to top, #e6e9f0 0%, #eef1f5 100%);
    }
    .main section.page3{
    background-image: linear-gradient(to top, #e6e9f0 0%, #eef1f5 100%);
    }
    body.disabled-onepage-scroll .onepage-wrapper  section {
      min-height: 100%;
      height: auto;
    }
    .main section .page_container {
      position: relative;
      top: 25%;
      margin: 0 auto 0;
      max-width: 950px;
      z-index: 3;
    }
    /*패럴랙스 스타일 끝*/
    /*인트로 스타일 시작*/
#introPage { background:url(img/introBg.png) repeat; width:100%; height:100%; position:absolute; top:0; z-index:99;}
#introPage div { width:1040px; height:266px; position:absolute; z-index:-1; margin:0 auto;}
#introPage div.text { text-align:center; left: 431.5px; top: 331.5px;}
#introPage div.text .line p { position:absolute; opacity:1; }
#introPage div.text .line .left { left:50%; opacity:0; }
#introPage div.text .line .right { right:50%; opacity:0;}
#introPage div.text02 .line .ART { right:100%; opacity:0;}
#introPage div.text02 .line .STUDY { left:100%; opacity:0;}
#introPage div.text dl { text-transform:uppercase;  color:#bc9e69; text-align:center; margin:99px 0 0 0;}
#introPage div.text dl dt { font-size:48px; letter-spacing:5px; display:inline-block; width:0; text-align:center;   white-space: nowrap;  overflow: hidden;   }
#introPage div.text dl dt span { font-weight:300; }
#introPage div.text dl dd { font-size:18px; 	margin:26px auto 0; 	text-align: center; 	width: 0px; 	white-space: nowrap;  	overflow: hidden; }
#introPage div.text01 dl dt { animation: introText 2s forwards steps(31,end); animation-delay: 1s;/*animation-delay:0.5s; animation-play-state:paused;*/}
#introPage div.text01 dl dd { 	animation: introText 2s forwards steps(31,end); 	animation-delay: 3s; }
#introPage div.text02 { display:none; }

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
/*인트로 스타일 끝*/
/*page3 스타일*/
#page2{
margin-top: 80px;
font-family: "나눔스퀘어";
font-size : 15px;
align:center;
}
#page3{
font-family: "나눔스퀘어";
margin-top: 80px;
font-size: 15px;
}
.tagDl{
margin: 0;
border-top: 1px solid #e6e6e6;
padding:10px 0 0 14px;
position: relative;
display: block;
}
.tagDd{
margin:0 0 0 95px;
padding :0 55px 0 0;
position: relative;
display: block;
text-align: left;
}
.tagUl{
margin: 0;
padding: 0 0 0 0;
line-height: 0;
display: block;
text-align: left;
}
.tagLi{
width:125px;
float: none;
position: relative;
display: inline-block;
vertical-align: top;
margin: 0 3px 5px 0;
line-height: 14px;
list-style: none;

}
</style>
</head>
<body>
<script>

function imgS(){
	$.ajax({
		url:"Ajax03",
		data:"name="+$("#search").val(),
		success:function(data){
			
			
			//alert("통신성공 >> "+data.info[0].name+"/"+data.info[0].dir);
            //console.log(data.info[0].name);
            var temp="";
            $.each(data, function(index, item){
            	temp+="<a href=\"viewPicture.jsp?name="+data[index].name+"\"><img class='image' src=\""+data[index].dir+"\"; style='width:250px;height:250px; margin-left:20px;margin-bottom:20px;float:left;'/></a>";
            });
        	$(".abc").html(temp);
        	$(".main").moveTo(2);
		},error : function(e) {
            console.log(e.responseText);
        }
	});
	
}
</script>
<div id="wrapper">
<ul id="gn-menu" class="gn-menu-main" style="position: fixed;z-index: 99;opacity:0.75;">
				<li class="gn-trigger">
					<a class="gn-icon gn-icon-menu"><span>Menu</span></a>
					<nav class="gn-menu-wrapper">
						<div class="gn-scroller">
							<ul class="gn-menu">
								<li class="gn-search-item" data-target="#about">
									<input placeholder="Search" id="search" type="search" class="gn-search">
									<a class="gn-icon gn-icon-search" onclick="imgS()"><span>Search</span></a>
								</li>
								<li><a class="gn-icon gn-icon-help" data-target="#member"  onclick="paMove(1)">HOME</a></li>
								<li>
									<ul class="gn-submenu">
										<li><a class="gn-icon gn-icon-pictures" data-target="#contect" onclick="paMove(2)">GALLARY</a></li>
										
									</ul>
								</li>
								
								<li><a class="gn-icon gn-icon-help"  onclick="paMove(3)" >자유게시판</a></li>
								
				
							</ul>
							</div><!-- /gn-scroller -->
							</nav>
						</li>
						<a href="semi-complete.jsp"><div id="logo" style="height:80px;"><img src= "LOGGO.png" style="height:75px;width:175px;"></div></a>
			</ul>
		<section id="introPage">
			<div class="text01 text">
				<div class="line">
					<p class="left"><img src="img/introLeftLine.png" alt="" /></p>
					<p class="right"><img src="img/introRightLine.png" alt="" /></p>
				</div>
				<dl>
					<dt>그림<span>을 통해 배우는 역사 학습 갤러리</span></dt>
					<dd>전시물은 손대지 마십시오.</dd>
				</dl>
			</div>
			<div class="text02 text">
			<div class="line">
					<p class="ART"><img src="img/introART2.png" alt="" /></p>
					<p class="STUDY"><img src="img/introSTUDY2.png" alt="" /></p>
			</div>
			</div>
			<div class="introLogo text">
				<p class="logo"><img src="img/yartudy.png" alt="ARTUDY" /></p>
			</div>
			<p class="closeBth">
				<button></button>
			</p>
		</section>
		<div class="main">
			<section class="page1">
			
		<!--메인페이지 -->
				
				<div class="container" style="z-index: 99; position:fixed;" >
			
	</div>
		<!-- /container -->
		


<div id="slider">
  <a href="#" class="control_next">>></a>
  <a href="#" class="control_prev"><<</a>
  <ul  style="z-index: 1;">
    <li style="background: url(img/1.jpg); background-repeat: no-repeat; background-size: cover;">
		
	</li>
    <li style="background: url(img/2.jpg); background-repeat: no-repeat; background-size: cover;">
    	
    </li>
    <li style="background: url(img/3.jpg); background-repeat: no-repeat; background-size: cover;">
    	
    </li>
    <li style="background: url(img/4.jpg); background-repeat: no-repeat; background-size: cover;">
    	
    </li>
    <li style="background: url(img/5.jpg); background-repeat: no-repeat; background-size: cover;">
    	
    </li>
     <li style="background: url(img/6.jpg); background-repeat: no-repeat; background-size: cover;">
    	
    </li>
  </ul>  
</div>
<script src="js/classie.js"></script>
<script src="js/gnmenu.js"></script>

<script type="text/javascript">

	new gnMenu( document.getElementById( 'gn-menu' ) );
/* $("menu li").click(function()){
	}
	
$("menu li").click function(){
	var scrollPosition = $($(this)).attr("data-target")).offset().top;
	$("body").animate({
		scrollTop:scrollPosition},500
	});}
	
 */
 function fnMove(seq){
     var offset = $("#div" + seq).offset();
     $('html, body').animate({scrollTop : offset.top}, 400);
 }


	$(document).ready(function($) {

		setInterval(function() {
			moveRight();
		}, 3000);

		var slideCount = $('#slider ul li').length;
		var slideWidth = $('#slider ul li').width();
		var slideHeight = $('#slider ul li').height();
		var sliderUlWidth = slideCount * slideWidth;

		$('#slider').css({
			width : slideWidth,
			height : slideHeight
		});

		$('#slider ul').css({
			width : sliderUlWidth,
			marginLeft : -slideWidth
		});

		$('#slider ul li:last-child').prependTo('#slider ul');

		function moveLeft() {
			$('#slider ul').animate({
				left : +slideWidth
			}, 200, function() {
				$('#slider ul li:last-child').prependTo('#slider ul');
				$('#slider ul').css('left', '');
			});
		}
		;

		function moveRight() {
			$('#slider ul').animate({
				left : -slideWidth
			}, 200, function() {
				$('#slider ul li:first-child').appendTo('#slider ul');
				$('#slider ul').css('left', '');
			});
		}
		;

		$('a.control_prev').click(function() {
			moveLeft();
		});

		$('a.control_next').click(function() {
			moveRight();
		});

	});
	
</script>
				
			</section>
			<section class="page2">
			<div id="page2">
<div style="margin-left:600px; height:99px; width:700px;">
	<div>
		<dl class="tagDl">
			<dd class="tagDd">
			<ul class="tagUl">
				<li class="tagLi"><input type="checkbox" name="ch_tag" value="landmark"  onclick="checkSearch(this,this.value);"/><label>사적</label></li>
				<li class="tagLi"><input type="checkbox" name="ch_tag" value="relic"  onclick="checkSearch(this,this.value);"/><label>유물</label></li>
				<li class="tagLi"><input type="checkbox" name="ch_tag" value="people"  onclick="checkSearch(this,this.value);"/><label>인물</label></li>
				<li class="tagLi"><input type="checkbox" name="ch_tag" value="culture"  onclick="checkSearch(this,this.value);"/><label>문화</label></li>
			</ul>
			</dd>
		</dl>
	</div>
	<div>
	<dl class="tagDl">
			<dd class="tagDd">
			<ul class="tagUl">
		<li class="tagLi"><input type="checkbox" name="ch_tag" value="minhwa"  onclick="checkSearch(this,this.value);"/><label>민화</label></li>
		<li class="tagLi"><input type="checkbox" name="ch_tag" value="pungsokhwa"  onclick="checkSearch(this,this.value);"/><label>풍속화</label></li>
		<li class="tagLi"><input type="checkbox" name="ch_tag" value="sumukhwa"  onclick="checkSearch(this,this.value);"/><label>수묵화</label></li>
		<li class="tagLi"><input type="checkbox" name="ch_tag" value="record"  onclick="checkSearch(this,this.value);"/><label>기록화</label></li>
			</ul>
			</dd>
		</dl>
	</div>
	<div>
	<dl class="tagDl">
			<dd class="tagDd">
			<ul class="tagUl">
		<li class="tagLi"><input type="checkbox" name="ch_tag" value="western"  onclick="checkSearch(this,this.value);"/><label>서양화</label></li>
		<li class="tagLi"><input type="checkbox" name="ch_tag" value="rococo"  onclick="checkSearch(this,this.value);"/><label>로코코</label></li>
		<li class="tagLi"><input type="checkbox" name="ch_tag" value="baroque"  onclick="checkSearch(this,this.value);"/><label>바로크</label></li>
		<li class="tagLi"><input type="checkbox" name="ch_tag" value="renaissance"  onclick="checkSearch(this,this.value);"/><label>르네상스</label></li>
	</ul>
			</dd>
		</dl>
	</div>
</div>

<script>
	var tag=""; 
	function checkSearch(object,val){
		if(object.checked==true){
			if(tag!=""){
				tag+=",";
			}
			tag+=val;
			$.ajax({
				url:"Ajax02",
				data:"ch_tag="+tag,
				success:function(data){
					
					
					//alert("통신성공 >> "+data.info[0].name+"/"+data.info[0].dir);
	                //console.log(data.info[0].name);
	                var temp="";
	                $.each(data, function(index, item){
	                	temp+="<a href=\"viewPicture.jsp?name="+data[index].name+"\"><img class='image' src=\""+data[index].dir+"\"; style='width:250px;height:250px; margin-left:20px;margin-bottom:20px;float:left;'/></a>";
	                });
                	$(".abc").html(temp);
				},error : function(e) {
	                console.log(e.responseText);
	            }
			});
			alert("체크확인")
		}else{
			tag=tag.replace(val,"");
			tag=tag.replace(",","");
			if(tag!=""){
			$.ajax({
				url:"Ajax02",
				data:"ch_tag="+tag,
				success:function(data){
					
					//alert("통신성공 >> "+data.info[0].name+"/"+data.info[0].dir);
	                //console.log(data.info[0].name);
	                var temp="";
					 $.each(data, function(index, item){
		                	temp+="<a href=\"viewPicture.jsp?name="+data[index].name+"\"><img class='image' src=\""+data[index].dir+"\"; style='width:250px;height:250px; margin-left: 20px;margin-bottom:20px;float:left;'/></a>";
		                });
	                	$(".abc").html(temp);
				},error : function(e) {
	                console.log(e.responseText);
	            }
			});
			}else{
				var temp="";
				$(".abc").html(temp);
			}
			
		}
	}
	</script>
	<hr>
	</div>
	<div class='abc' style="padding-left:120px;"> </div>
			</section>
			<section class="page3">
			<table id="page3" width="100%" cellpadding="0" cellspacing="0" border="0">
  <tr height="5"><td width="5"></td></tr>
 <tr style="background:url('img/table_mid.gif') repeat-x; text-align:center;">
   <td width="5"><img src="img/table_left.gif" width="5" height="30" /></td>
   <td width="73">번호</td>
   <td width="379">제목</td>
   <td width="73">작성자</td>
   <td width="164">작성일</td>
   <td width="58">조회수</td>
   <td width="7"><img src="img/table_right.gif" width="5" height="30" /></td>
  </tr>
<%

	if(total==0) {
%>
	 		<tr align="center" bgcolor="#FFFFFF" height="30">
	 	   <td colspan="6">등록된 글이 없습니다.</td>
	 	  </tr>
	 <%
	 	} else {
	 		
	 		for(int i=ROWSIZE*(pg-1); i<end;i++){
	 			
				VO vo = alist.get(i);
				indent = vo.getIndent();
				int idx = vo.getNum();
%>
	<tr height="25" align="center" bgcolor="#FFFFFF">
	<td align="center">&nbsp;</td>
	<td align="center"><%=i+1%></td>
	<td align="left"><% 
		
		for(int j=0;j<indent;j++){
		%> &nbsp;&nbsp;&nbsp;<%
		}
		if(indent!=0){
			%><img src='img/reply_icon.gif' /><%
		}
	%>
	<a href="view.jsp?idx=<%=idx%>&pg=<%=pg%>"><%=vo.getTitle() %></a><%
		if(vo.isDayNew()){
			%>
			<img src='img/new.jpg' />
			<%
		}
	%></td>
   <td align="center"><%=vo.getName()%></td>
   <td align="center"><%=vo.getTime() %></td>
   <td align="center"><%=vo.getHit() %></td>
   <td align="center">&nbsp;</td>
  <tr height="1" bgcolor="#D2D2D2"><td colspan="6"></td></tr>
<% }} %>
 <tr height="1" bgcolor="#82B5DF"><td colspan="6" width="752"></td></tr>
</table>
<table width="100%" cellpadding="0" cellspacing="0" border="0">
  <tr><td colspan="4" height="5"></td></tr>
  <tr>
	<td align="center">
		<%
			if(pg>BLOCK) {
		%>
			[<a href="list.jsp?pg=1">◀◀</a>]
			[<a href="list.jsp?pg=<%=startPage-1%>">◀</a>]
		<%
			}
		%>
		
		<%
			for(int i=startPage; i<= endPage; i++){
				if(i==pg){
		%>
					<u><b>[<%=i %>]</b></u>
		<%
				}else{
		%>
					[<a href="list.jsp?pg=<%=i %>"><%=i %></a>]
		<%
				}
			}
		%>
		
		<%
			if(endPage<allPage){
		%>
			[<a href="list.jsp?pg=<%=endPage+1%>">▶</a>]
			[<a href="list.jsp?pg=<%=allPage%>">▶▶</a>]
		<%
			}
		%>
		</td>
		</tr>
	<tr align="center">
   <td><input type=button value="글쓰기" OnClick="window.location='write.jsp'"></td>
  </tr>
 </table>
			
			</section>
			
		</div>
		
		
		</div>
		
</body>
</html>