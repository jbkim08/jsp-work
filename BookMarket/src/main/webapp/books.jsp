<%@page import="dto.Book"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="bookDAO" class="dao.BookRepository" scope="session" />
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>도서 목록</title>
    <link rel="stylesheet" href="./resources/css/bootstrap.min.css">
  </head>
  <body>
	<%@ include file="menu.jsp"%>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">도서 목록</h1>
		</div>
	</div>
	<%
		ArrayList<Book> listOfBooks = bookDAO.getAllBooks();
	%>
	<div class="container">
		<%
			for (int i = 0; i < listOfBooks.size(); i++) {
				Book book = listOfBooks.get(i);
		%>
		<div class="row">
			<div class="col-md-10">
				<p><h5><b>[<%=book.getCategory()%>] <%=book.getName()%></b></h5>
				<p style="padding-top: 20px"><%=book.getDescription().substring(0, 100)%>...
				<p><%=book.getAuthor()%> | <%=book.getPublisher()%> | <%=book.getUnitPrice()%>원
			</div>
			<div class="col-md-2" style="padding-top: 70px">
				<a href="./book.jsp?id=<%=book.getBookId()%>"
					class="btn btn-secondary" role="button">상세정보 &raquo;</a>
			</div>
		</div>
		<hr>
		<%
			}
		%>
	</div>
    <%@ include file="footer.jsp"%>
  </body>
</html>


