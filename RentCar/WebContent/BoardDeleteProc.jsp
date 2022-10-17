<%@page import="model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String pass=request.getParameter("password");
	int num = Integer.parseInt(request.getParameter("num"));
	
	//데이터 베이스 연결
	BoardDAO bdao =new BoardDAO();
	String password =bdao.getPass(num);
	
	//기존 패스워드값과 delete form 에서 작성한 패스워드 비교
	if(pass.equals(password)){
		
		//패스워드가 같다면
		bdao.deleteBoard(num);
	%>
	
	<script>
	location.href="RentCarMain.jsp?center=BoardList.jsp";
</script>
	
	<%	
		
	}else{
%>

<script>
	alert("패스워드가 틀려서 삭제 할 수 없습니다. 패스워드를 확인해 주세요.");
	history.go(-1);
</script>
		
<%		
		
	}
	
%>   

 