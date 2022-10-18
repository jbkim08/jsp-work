<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>welcome</title>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
</head>
<body>
<%@ include file="menu.jsp" %>
<%!
	String greeting = "Book Market Mall";
	String tagline = "Welcome to Book Market!";
%>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3"><%=greeting %></h1>
		</div>
	</div>
	<div class="container">
		<div class="text-center">
			<h3><%=tagline %></h3>
		</div>
	</div>
<%@ include file="footer.jsp" %>
</body>
</html>