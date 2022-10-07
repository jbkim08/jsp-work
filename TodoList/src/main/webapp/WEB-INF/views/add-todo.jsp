<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/header.jspf"%>
<%@ include file="../common/navigation.jspf"%>


<div class="container">
	새로 할일 작성하기:
	<form method="POST" action="/todoList/add-todo.do">
		<fieldset class="form-group">
			<label>할일 설명</label> <input name="todo" type="text"
				class="form-control" /> <BR />
		</fieldset>
		<fieldset class="form-group">
			<label>종 류</label> <input name="category" type="text"
				class="form-control" /> <BR />
		</fieldset>
		<input name="add" type="submit" class="btn btn-success" value="추가하기" />
	</form>
</div>

<%@ include file="../common/footer.jspf"%>