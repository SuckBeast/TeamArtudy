<%@page import="model.adminVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	adminVO vo=(adminVO)request.getAttribute("imgVo");	
	if(vo==null){
		System.out.print("오류");
		
	}else{
		System.out.print("오류X");
		
	}
	String name = request.getParameter("name");
	String content = request.getParameter("content");
	String tag = request.getParameter("tag");
%>
<img width=400px height=400px src="imgSave/<%=vo.getDir()%>">
	<%=name %>
	<%=content %>
	<%=tag %>
	<button onclick="history.go(-1)">뒤로가기</button>
</body>
</html>