<%@page import="model.BoardBean"%>
<%@page import="model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="//cdn.ckeditor.com/4.7.3/standard/ckeditor.js"></script>
<%
	//해당 게시글번호를 통하여 게시글을 수정
	int num =Integer.parseInt(request.getParameter("num").trim());

	//하나의 게시글의 대한 정보를 리턴
	BoardDAO bdao =new BoardDAO();
	BoardBean bean =bdao.getOneUpdateBoard(num);
%>

<div class="row">
<div class="container marketing" id="marketing" >
	<div class="col-md-2"></div>
	<div class="col-md-8">
		<h2 class="text-center">게시글 수정</h2><p>&nbsp;</p>
		<form action="BoardUpdateProc.jsp" method="post">
			<div class="table table-responsive">
					  <table class="table table-striped">
		 	<tr>
		 		<td class="danger">작성자</td>
		 		<td><%= bean.getWriter() %></td>
		 		<td class="danger">작성일</td>
		 		<td><%= bean.getReg_date() %></td>
		 	</tr>
		 	<tr>
		 		<td class="danger">제목</td>
		 		<td colspan="3"><input type="text"  class="form-control" name="subject" value="<%= bean.getSubject() %>"></td>
		 	</tr>
		 	
		 	<tr>
		 		<td class="danger">패스워드</td>
		 		<td colspan="3"><input type="password"  class="form-control" name="password"></td>
		 	</tr>
		 	
		 	<tr>
		 		<td class="danger">글내용</td>
		 		<td colspan="3"><textarea  name="content" class="form-control"><%= bean.getContent() %></textarea></td>
		 	</tr>
		 	
		  	<tr>	
		 		<td colspan="4"  class="text-center">
		 			<input type="hidden" name="num"  value="<%= bean.getNum() %>">
		 			<input type="submit" value="글수정" class="btn btn-warning">
		 			<input type="button"  class="btn btn-primary" onclick="location.href='RentCarMain.jsp?center=BoardList.jsp'" value="전체글보기">
		 		</td>
		 	</tr>
		  </table>
		
	
			</div>
		</form>
		<div>	
	</div>
</div>



<jsp:include page="Bottom.jsp"/>
<script>
CKEDITOR.replace('content', {
		
	width:'100%',
	height:'350'
		
});

</script>
