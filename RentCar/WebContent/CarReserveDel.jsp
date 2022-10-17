<%@page import="db.RentcarDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id =(String)session.getAttribute("id");
	int reserveno=Integer.parseInt(request.getParameter("reserveno"));
	if(id==null){
%> 
	<script>
		alert("로그인후 삭제가 가능합니다.");
		location.href="RentCarMain.jsp?center=MemberLogin.jsp";
	</script>
	
<%
	}
	
	RentcarDAO dao =new RentcarDAO();
	dao.carRemoveReserve(reserveno);
	
	response.sendRedirect("RentCarMain.jsp?center=CarReserveView.jsp");
	
%>	