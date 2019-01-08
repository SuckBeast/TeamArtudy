<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.control.DAO"%>
<%@page import="com.control.galleryDAO"%>
<%@page import="com.control.artInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/normalize.css" />
<link rel="stylesheet" type="text/css" href="css/component.css" />
<script src="js/modernizr.custom.js"></script>
<script src="js/classie.js"></script>
<script src="js/gnmenu.js"></script>
<style>
#gn-menu{
        text-align: center;
        padding: 10px 0px;
        width: 100%;
         position: fixed;
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
#wrap{
height:1600px;
width:100%;
}

#header{
width:100%;
height:88px;
}

#content {
display:block;
background-image:url("img/ssireum.png");
background-repeat:no-repeat;
   height: 950px;
   width: 820px;
   margin: auto;
   
}

#main{
width:100%;
height:1625px;
margin-top: 100px;

}
#sub{
margin: 24px auto 0 auto;

padding: 0 88px;
width:1024px;
height:850px;
}

#sub #sub1{
margin-top:24px;
height:111px;
width:100%;
}
#reply{
width:100%;
height:49px;
}
#sub1 h1{
display: block;
margin: 0;
font-size: 20px;
font-weight: 300;

position: relative;
}

#sub1 h2{
margin-top: 18px;
font-size: 13px;
font-weight: 700;
color: #212121;
display: block;

font: 400 14px/20px Roboto,RobotoDraft,Helvetica,Arial,sans-serif;
}

#sub #sub2{
height:300px;
width:100%;
display: block;
}
#sub2_1{
padding-left: 0;
position: relative;
margin: 0 24px 0 0;
padding: 24px 0;
font-size: 20px;
font-weight: 300;
outline: none;
display: block;
line-height: 1.7em;
text-align: left;
font-family:"나눔스퀘어";
}
#sub2_2{
display: block;
padding: 0 0 24px 0;
}
#sub2_2 ul{
margin: 0;
padding: 0;
list-style-type: none;
display: block;
font-weight: 300;
font-size: 16px;
line-height: 1.7em;
text-align: left;
}
#sub2_2 ul span{
font-weight: 600;
}
#sub #line{
display:block;
border-top:1px solid #e0e0e0;
width:1024px;
}
.jName{
margin-right: 12px;
white-space: normal;
color: #212121;
font-weight: 700;
}
.pInfo .jYear{
font-size: 15px;
font-weight: 300;
white-space: normal;
color: #212121;
}
#picture{
	width:600px;
	height:581px;
	margin:auto;
}
#content div, #content input ,#content label{
   position: absolute;
   display: inline-block;
}

#content .point {
   visibility: hidden;
   width: 300px;
   height: 200px;
}

#content input[type=checkbox] {
   display: none;
}

input[type=checkbox]+label {
   display: inline-block;
   cursor: pointer;
   line-height: 22px;
   
}

input[type=checkbox]:checked+label {
   
}

.point1, #s1, .l1 {
   top: 82%;
   left: 46%;
}

.point2, #s2, .l2 {
   top: 35%;
   left: 52%;
}

.point3, #s3, .l3 {
   top: 43%;
   left:33%;
}
#content .ptext{
padding-left:12px;
padding-right:12px;
background-color:white;
height:59%;
width:330px;
margin-left: 20px;
}
label {
   width: 25px;
   height: 20px;
   z-index:2;
}

#comment_text{
resize: none;
width:900px;
}
#subBtn{
width:75px;
height:100%;
float:right;
}
#subBtn input[type=button]{
width:100%;
height:100%;
}
#replyList table tr td{
    border-bottom: 1px solid #b3aeae;
}
</style>
<%
request.setCharacterEncoding("UTF-8");

String name1=request.getParameter("name");
/* String name2= URLEncoder.encode(name1, "UTF-8");
 */
galleryDAO gdao = new galleryDAO();
artInfo vo= new artInfo();
vo = gdao.selectInfo(name1);
DAO dao=new DAO();
	ArrayList<String> list =dao.findText(name1);
	int max=dao.count(name1);
	String[] content=vo.getArt_content().split("/");
	
	
%>

<script>
   function onCl(object, num) {
      if(object.checked==true){
      $("#wrap #content .point" + num).css({
         "visibility" : "visible"
      });
      }else{
         $("#wrap #content .point" + num).css({
            "visibility" : "hidden"
         });   
      }
   };
   
   function send(){
		
	   $.ajax({
		  
			url:"Ajax01",
			data:"reply="+$("#comment_text").val()+"&name="+$("#hName").val(),
/* 			data : {
				reply : $("#comment_text").val();,
				name : name,
			}, */
			success:function(data){
				alert("통신성공")
			}
		});
   }

   
</script>

</head>
<body>

   <div id="wrap">
   <ul id="gn-menu" class="gn-menu-main" style="position: fixed;z-index: 99;opacity:0.75;">
				<li class="gn-trigger">
					<a class="gn-icon gn-icon-menu" href="semi-complete.jsp"><span>Menu</span></a>
					
						</li>
						<div id="logo" style="height:80px;">
						<a href="semi-complete.jsp" style="display: inline-block;width: 180px;">
						<img src= "LOGGO.png" style="height:75px;width:175px;">
						</a>
						</div>
			</ul>
   <div id="header"></div>
   
   	<div id="content">
      <input type="checkbox" onclick="onCl(this,1)" id="s1" /> 
      <label for="s1" class="l1"><img src="img/check.png" style="height: 100%;width: 100%;"></label> 
      <input type="checkbox" onclick="onCl(this,2)" id="s2" />
      <label for="s2" class="l2"><img src="img/check.png" style="height: 100%;width: 100%;"></label>
      <input type="checkbox" onclick="onCl(this,3)" id="s3" />
      <label for="s3" class="l3"><img src="img/check.png" style="height: 100%;width: 100%;"></label>
      <div class="point1 point"><div style="height:68%;"class="ptext"><p><%=content[0] %></p></div></div>
      <div class="point2 point"><div style="height:68%;"class="ptext"><p><%=content[1] %></p></div></div>
      <div class="point3 point"><div class="ptext"><p><%=content[2] %></p></div></div>
     </div>
     <span id="line"></span>
     <div id="main">
      	<div id="picture"><img src="img/ssireum.png" width="100%" height="100%";></div>
      	<div id="sub">
      		<span id="line"></span>
	      	<div id="sub1">
	      	<h1 class="pName"><%=vo.getArt_name() %></h1>
	      	<h2 class="pInfo"><span class="jName"><%=vo.getArt_producer() %></span><span class="jYear"><%=vo.getArt_year() %></span></h2>
	      	</div>
	      	<seciton id="sub2">
	      		<p id="sub2_1">세부정보</p>
	      		<div id="sub2_2">
	      			<ul>
	      				<li><span>제목:</span><%=vo.getArt_name() %></li>
	      				<li><span>제작자:</span><%=vo.getArt_producer() %></li>
	      				<li><span>날짜:</span><%=vo.getArt_year() %></li>
	      				<li><span>작품유형:</span><%=vo.getArt_tag()%></li>
	      				<li><span>Descriptive Title</span><%=vo.getArt_name_en() %></li>
	      				<li><span>Collection:</span><%=vo.getArt_collection() %></li>
	      			</ul>
	      		</div>
	      	</seciton>
	      	<span id="line" style="margin-bottom:24px;"></span>
	      	<div id="reply">
      	<textarea id="comment_text" cols="50" rows="2" maxlength="6000" style="overflow: hidden; line-height: 14px; height: 39px;" title="댓글입력"></textarea>
      	<input id="hName"type="hidden" value="<%=name1%>"/>
      	<div id="subBtn" ><input type="button" href="#" value="작성" onclick="send();"/></div>
      	</div>
      	
      	<div id="replyList">
      	<table width="100%" cellpadding="0" cellspacing="0" border="0">
      	<%
      	
      	for(int i = 0; i<list.size();i++){
      	%>
      	<tr>
      	<td>
      	<%=list.get(i) %>
      	</td>
      	</tr>
      	
      	<%} %>
      	</table>
      	</div>
      	</div>
      	
     </div>
   </div>
   
</body>
</html>