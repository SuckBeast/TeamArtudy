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

	<p>�˻��Է� :</p>
	<div>
		<span><input type="search" id="Search" name="Search"></span> 
		<input type="submit" value="�˻�">
	</div>
	<%
		for (int i = 0; i < QnAList.size(); i++) {
	%>
	<form action="QnAUpdate">
	<li> �Խñ� ��ȣ : <%=QnAList.get(i).getQnA_Number()%>
	<strong>���� : </strong><%=QnAList.get(i).getTitle()%><br> 
	<strong>���� : </strong><%=QnAList.get(i).getText()%><br> 
	<strong>��� : </strong><%=QnAList.get(i).getRip()%>
	</li>
	<input type="submit" value="����">
	<input type="submit" value="����">
	<input type="reset" value="�ۼ����" >
	</form>
	<%
		}
	%>
</body>
</html>