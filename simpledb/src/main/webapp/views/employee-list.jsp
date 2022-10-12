<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<!DOCTYPE html>
		<html>

		<head>
			<title>Employee Directory</title>
			<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

		</head>

		<body>

			<div class="container">

				<h1>Employee Directory</h1>
				<hr />

				<p>${NOTIFICATION}</p>

				<p>
					<a class="btn btn-primary" href="views/employee-form.jsp">직원
						추가</a>
					<a class="btn btn-warning" href="logout.jsp">로그아웃</a>
				</p>

				<table class="table table-striped table-bordered">

					<tr class="thead-dark">
						<th>이름</th>
						<th>부서</th>
						<th>생년월일</th>
						<th>Actions</th>
					</tr>

					<c:forEach items="${empList}" var="employee">

						<tr>
							<td>${employee.name}</td>
							<td>${employee.department}</td>
							<td>${employee.dob}</td>
							<td>
								<a
									href="${pageContext.request.contextPath}/EmployeeController?action=EDIT&id=${employee.id}">Edit</a>
								|
								<a
									href="${pageContext.request.contextPath}/EmployeeController?action=DELETE&id=${employee.id}">Delete</a>
							</td>
						</tr>

					</c:forEach>

				</table>

			</div>

			<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
			<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
		</body>

		</html>