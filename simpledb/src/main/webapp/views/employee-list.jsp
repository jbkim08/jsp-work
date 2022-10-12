<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<!DOCTYPE html>
		<html>

		<head>
			<title>Employee Directory</title>
			<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
			<link rel="stylesheet" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css">
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

				<table id="myTable" class="table table-striped table-bordered">
					<thead>
					<tr class="thead-dark">
						<th>이름</th>
						<th>부서</th>
						<th>생년월일</th>
						<th>Actions</th>
					</tr>
					</thead>
					
					<tbody>
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
					</tbody>
					
				</table>

			</div>

			<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
			<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
			<script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js" ></script>
			<script>
			$(document).ready( function () {
			    $('#myTable').DataTable({
					'language': {
						'lengthMenu': '표시할 줄수 선택    _MENU_',
						'search': '검색',
						'paginate': { 'previous': '이전', 'next': '다음' },
						"info": "페이지 _PAGE_ / _PAGES_",
						'infoEmpty': '데이터가 없습니다.',
						"infoFiltered": "(전체 페이지 _MAX_ 에서 검색)",
						'thousands': ','
					},
					'lengthMenu': [5, 10, 25],
					'pageLength': 5,
					'ordering': false,
					'stateSave': true
			    });
			});
			</script>
		</body>

		</html>
		
		
		