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

<!-- setProperty로 객체에 해당변수에 값을 입력 -->
<jsp:setProperty property="email" name="user" value="drv98@nave.com"/>
<jsp:setProperty property="password" name="user" value="letmein"/>

<%=user.getEmail() %>
<br><br>
<%=user.getPassword() %>

</body>
</html>

