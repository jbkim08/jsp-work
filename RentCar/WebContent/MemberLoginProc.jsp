<%@page import="db.RentcarDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	String id =request.getParameter("id");
	String pass=request.getParameter("pass");
	
	//회원 아이디와 패스워드가 일치하는지 확인
	RentcarDAO rdao =new RentcarDAO();
	
	//해당 회원이 있는지 여부를 숫자로 표현
	int result =rdao.getMember(id, pass);
	if(result==0){
%>
	<script>
		alert("회원 아이디 또는 패스워드가 틀립니다.");
		location.href="RentCarMain.jsp?center=MemberLogin.jsp";
	</script>		
		
<%	
	}else{
		//로그인 처리가 되었다면
		session.setAttribute("id", id);
		response.sendRedirect("RentCarMain.jsp");
	}
%>    


