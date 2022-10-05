<%@page import="application.TextOutput"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 익스프레션 태그는 안에 자바코드를 적고 결과로 화면출력  -->
	영문 대문자로 변환: <%= "hello".toUpperCase() %>
	<br><br>
	25 곱하기 4 : <%=25*4 %>
	<br><br>
	<!-- 스크립틀렛 여러줄 태그 화면출력시 out.print를 사용 -->
	<%
		for(int i=1; i <=5; i++){
			out.println("<br> i의 값은 : " + i);
		}	
	%>
	<br><br>
	<!-- 자바 클래스 불러오기  -->
	<%= new Date() %>
	<br><br>
	<%= new TextOutput().getInfo() %>
	
</body>
</html>