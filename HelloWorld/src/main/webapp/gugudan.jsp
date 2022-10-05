<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>화면에 구구단을 출력하시오.</h1>
	<%
	for(int i= 2 ; i< 10; i++ ){
		for(int j=1; j<10; j++ ){
			out.write(i + " * " + j + " = " +i*j +"&nbsp;&nbsp;");
		}
		out.println("<br>"); //한줄 줄바꿈 태그
	}
			
	%>
</body>
</html>