<%@page import="model.QnADAO"%>
<%@page import="java.util.ArrayList"%>
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
		QnADAO dao = new QnADAO();
		ArrayList<QnAVO> QnAList = new ArrayList<QnAVO>();
		QnAList = dao.QnAALL(null);
	%>
		<p>검색입력 :</p>
	<div>
		<form action="QnASelect">
			<span><input type="search"
				id="Search" name="Search"></span> 
				<input type="submit" value="검색"><br>
		</form>
	</div>
	<%
		for (int i = 0; i < QnAList.size(); i++) {
	%>
	<form action="QnAUpdate">
	<li> no.<%=QnAList.get(i).getQnA_Number()%>
	<strong>제목 : </strong><a href="#"target="click"><%=QnAList.get(i).getTitle()%></a><br> 
	<!-- <input type="text" name="Rip"> -->
	<input type="submit" value="수정">
	<input type="submit" value="삭제">
	<%-- <%if($target.equles("click")){%> <strong>내용 : </strong><%=QnAList.get(i).getText()%><br> 
	<strong>댓글 : </strong><%=QnAList.get(i).getRip()%> --%>
	</li>
	
	</form>
	<%
		}
	%>
</body>
</html>