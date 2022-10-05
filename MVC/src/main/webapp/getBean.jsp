<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- jsp 빈으로 user객체 생성 -->
<jsp:useBean id="user" class="beans.User" scope="page" />

이메일 : <%=user.getEmail() %>
<br><br>
패스워드 : <%=user.getPassword() %>

</body>
</html>

