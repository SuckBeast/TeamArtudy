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
		<p>�˻��Է� :</p>
	<div>
		<form action="QnASelect">
			<span><input type="search"
				id="Search" name="Search"></span> 
				<input type="submit" value="�˻�"><br>
		</form>
	</div>
	<%
		for (int i = 0; i < QnAList.size(); i++) {
	%>
	<form action="QnAUpdate">
	<li> no.<%=QnAList.get(i).getQnA_Number()%>
	<strong>���� : </strong><a href="#"target="click"><%=QnAList.get(i).getTitle()%></a><br> 
	<!-- <input type="text" name="Rip"> -->
	<input type="submit" value="����">
	<input type="submit" value="����">
	<%-- <%if($target.equles("click")){%> <strong>���� : </strong><%=QnAList.get(i).getText()%><br> 
	<strong>��� : </strong><%=QnAList.get(i).getRip()%> --%>
	</li>
	
	</form>
	<%
		}
	%>
</body>
</html>