<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/header.jspf"%>
<%@ include file="../common/navigation.jspf"%>

<div class="container">
	<H1>안녕하세요! ${name} 님</H1>

	<table class="table table-striped">
		<caption>🚀당신의 할일 리스트!🚀</caption>
		<thead>
			<tr>
				<th>할일 설명</th>
				<th>종 류</th>
				<th>삭제하기</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${todos}" var="todo">
				<tr>
					<td>${todo.name}</td>
					<td>${todo.category}</td>
					<td>&nbsp;&nbsp;<a class="btn btn-danger"
						href="/todoList/delete-todo.do?todo=${todo.name}&category=${todo.category}">Delete</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<p>
		<font color="red">${errorMessage}</font>
	</p>
	<a class="btn btn-success" href="/todoList/add-todo.do">할일 추가하기</a>
</div>

<%@ include file="../common/footer.jspf"%>





