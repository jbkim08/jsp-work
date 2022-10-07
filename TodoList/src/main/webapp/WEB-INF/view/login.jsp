<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>todo리스트</title>
</head>
<body>
	<p style="color:red">${errorMessage}</p>
	<form action="/todoList/login.do" method="post">
		Name: <input name="name" type="text">
		Password: <input name="password" type="password">
		<input type="submit" value="로그인">
	</form>
</body>
</html>