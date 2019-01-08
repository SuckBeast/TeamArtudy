<%@page import="controller.Logincon"%>
<%@page import="model.MemberDAO"%>
<%@page import="model.MemberVO"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html;charset=UTF-8");
	String ADMIN_PW = (String) session.getAttribute("ADMIN_PW");
%>
<!DOCTYPE html>
<html lang="en" class="">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../favicon.ico">
<title>Cover Template for Bootstrap</title>
<link href="../../dist/css/bootstrap.min.css" rel="stylesheet">
<link href="css/cover.css" rel="stylesheet">
<script src="../../assets/js/ie-emulation-modes-warning.js"></script>
<link type="text/css" rel="stylesheet" charset="UTF-8"
	href="https://translate.googleapis.com/translate_static/css/translateelement.css">
</head>
<body>

	<div class="site-wrapper">
		<div class="site-wrapper-inner">
			<div class="masthead clearfix">
				<div class="inner">
					<h2 class="masthead-brand">Admin page</h2>
					<nav>
						<ul class="nav masthead-nav">
							<%
								if (ADMIN_PW != null) {
							%>
							<li><a href=".../semi-complete.jsp"
								target="Home"> <input type="button" value="Home"></a></li>
							<li><a href="Gallery.jsp" target="Home"> <input
									type="button" value="Gallery"></a></li>
							<li><a href="QnA.jsp" target="Home"> <input
									type="button" value="QnA"></a></li>
							<%
								}
							%>
						</ul>
					</nav>

					<div class="inner cover">
						<form action="Logincon" method="post">
							<%
								if (ADMIN_PW == null) {
							%>
							<h3 class="cover-heading">Admin Password</h3>
							<p class="lead">
								<input type="password" name="PW">
							</p>
							<p class="lead">
								<input type="submit" value="LogIn"
									class="btn btn-lg btn-default">
							</p>
							<%
								} else {
							%><h1 class="cover-heading">Hello!!</h1>
						<div id="animated-example" class="animated bounceOutUp">
								<h3 class="cover-heading">Admin Password</h3>
								<p class="lead">
									<input type="password" name="PW">
								</p>
								<p class="lead">
									<input type="submit" value="LogIn"
										class="btn btn-lg btn-default">
								</p>
							</div>

							<%
								}
							%>
							<iframe name="Home" class="Home"></iframe>
						</form>
					</div>
				</div>
			</div>
</body>
</html>