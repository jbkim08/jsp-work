<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- Step 1: HTML form 작성 -->
<form action="todo.jsp">
	아이템 추가: <input type="text" name="item" />
	<input type="submit" value="Submit" />
</form>
<!-- Step 1.5: 입력 받은 아이템을 테스트 출력 -->

<!-- Step 2: To do 리스트에 새 아이템 추가 -->
<%
	//이미 세션에 저장된 리스트가 있으면 먼저 받아옴
	List<String> items = (List<String>) session.getAttribute("todoList");
	if(items == null){
		//리스트가 세션에 없는경우(처음 todo에 접속)
		items = new ArrayList<String>();
		session.setAttribute("todoList", items);
	}

	String item = request.getParameter("item");
	if(item != null){
		// 입력한 아이템이 있을경우 꺼낸 items에 담아서 다시 세션에 저장
		items.add(item);
		session.setAttribute("todoList", items);
	}
%>

<!-- Step 3: to do 리스트 출력하기 -->
<hr>
<b>리스트 아이템들 :</b> <br/>

<ol>
<%
	for (String temp : items) {
		out.println("<li>" + temp + "</li>");
	}
%>
</ol>









</body>
</html>