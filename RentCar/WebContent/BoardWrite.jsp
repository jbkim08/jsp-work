<%@page import="java.sql.Connection"%>
<%@page import="org.apache.catalina.connector.OutputBuffer"%>
<%@page import="model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src="//cdn.ckeditor.com/4.7.3/standard/ckeditor.js"></script>


<div class="row">
<div class="container marketing" id="marketing" >
	<div class="col-md-2"></div>
	<div class="col-md-8">
		<h2 class="text-center">게시글 쓰기</h2>
		<form action="BoardWriterProc.jsp" method="post" \>
		  <table class="table table-striped">
		 	<tr>
		 		<td>작성자</td>
		 		<td><input type="text"  class="form-control" name="writer"></td>
		 	</tr>
		 	<tr>
		 		<td>제목</td>
		 		<td><input type="text"  class="form-control" name="subject"></td>
		 	</tr>
		 	<tr>
		 		<td>이메일</td>
		 		<td><input type="email"  class="form-control" name="email"></td>
		 	</tr>
		 	
		 	<tr>
		 		<td>비밀번호</td>
		 		<td><input type="password"  class="form-control" name="password"></td>
		 	</tr>
		 	
		 	<tr>
		 		<td>글내용</td>
		 		<td><textarea rows="10" cols="50" name="content" class="form-control"></textarea></td>
		 	</tr>
		  	<tr>
		 		
		 		<td colspan="2"  class="text-center">
		 			<input type="submit" value="글쓰기" class="btn btn-success">
		 			<input type="reset" value="다시작성" class="btn btn-warning">
		 			<button type="button"  class="btn btn-primary" onclick="location.href='RentCarMain.jsp?center=BoardList.jsp'">전체 게시글보기</button>
		 		</td>
		 	</tr>
		 	
		  </table>
		
		
		</form>
	</div>
</div>


<jsp:include page="Bottom.jsp"/>


<script>
CKEDITOR.replace('content', {
		
	width:'100%',
	height:'350'
		
});

</script>
</body>
</html>


