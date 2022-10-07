<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>welcome</title>
</head>
<body>
 <h1>안녕하세요 ${name} 님</h1>
 <p>당신의 할일은</p>
 <ol>
 <c:forEach items="${todos}" var="todo">
 	<li>${todo.name }  <a href="/todoList/delete-todo.do?todo=${todo.name }">삭제</a></li>
 </c:forEach>
 </ol>
 	<p style="color:red">${errorMessage}</p>
	<form action="/todoList/todo.do" method="post">
		새 할일 : <input name="todo" type="text">
		<input type="submit" value="추가">
	</form>
</body>
</html>






