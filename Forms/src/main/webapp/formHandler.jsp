<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="user" class="beans.User" />
<jsp:setProperty property="*" name="user"/>
<p>유저 : <%=user.getUser() %>
<p>비번 : <%=user.getPassword() %>
</body>
</html>