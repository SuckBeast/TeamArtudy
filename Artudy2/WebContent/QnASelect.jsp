<%@page import="java.util.ArrayList"%>
<%@page import="model.MemberDAO"%>
<%@page import="controller.QnAcon"%>
<%@page import="model.QnAVO"%>
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
		ArrayList<QnAVO> QnAList = (ArrayList<QnAVO>) request.getAttribute("Arr");
	%>

	<p>검색입력 :</p>
	<div>
		<span><input type="search" id="Search" name="Search"></span> 
		<input type="submit" value="검색">
	</div>
	<%
		for (int i = 0; i < QnAList.size(); i++) {
	%>
	<form action="QnAUpdate">
	<li> 게시글 번호 : <%=QnAList.get(i).getQnA_Number()%>
	<strong>제목 : </strong><%=QnAList.get(i).getTitle()%><br> 
	<strong>내용 : </strong><%=QnAList.get(i).getText()%><br> 
	<strong>댓글 : </strong><%=QnAList.get(i).getRip()%>
	</li>
	<input type="submit" value="수정">
	<input type="submit" value="삭제">
	<input type="reset" value="작성취소" >
	</form>
	<%
		}
	%>
</body>
</html>