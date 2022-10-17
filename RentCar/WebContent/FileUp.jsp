<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
<jsp:include page="Header.jsp" />
  </head>
<body>
<div class="row">
	<div class="col-sm-12">
	<h2 class="text-center">파일 업로드</h2>
	</div>
</div>	
<div class="row">

	<div class="col-sm-3"></div>
	<div class="col-sm-6">
		<form action="FileUploadProc.jsp" enctype="multipart/form-data" method="post">
		<table class="table">
		   <tr>
		     <td>이름</td>
		     <td><input type="text" name="name" class="form-control"></td>
		   </tr>
			<tr>
			  <td>파일 선택</td>
			  <td><input type="file" name="filedata" class="form-control"> </td>
			</tr>
			<tr>
			  <td class="text-center" colspan="2"><input type="submit" value="파일 업로드" class="btn btn-success"></td>
			</tr>
		</table>
	  </form>
	</div>


</div>




</body>
</html>