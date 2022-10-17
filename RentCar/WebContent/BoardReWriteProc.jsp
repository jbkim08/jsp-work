<%@page import="model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 
	강좌와 다르게 html 요소는 제거를 했습니다.
	왜냐하면은 이 페이지에서는 프로세스 작업(데이터를 받고 Dao 를 통해 insert)을 하는 페이지이기 때문입니다.
 -->
 <%
 	request.setCharacterEncoding("UTF-8");
 
 %>
<!--  데이터를 한번에 받아오는 빈클래스를 사용하도록 -->
<jsp:useBean id="boardbean" class="model.BoardBean">
	<jsp:setProperty  name="boardbean"  property="*"/>
</jsp:useBean>
<%
	//데이터베이스 객체 생성
	BoardDAO bdao =new BoardDAO();
	bdao.reWriteBoard(boardbean);
	
	//답변 데이터를 모두 저장후 전체 게시글 보기를 설정
	
%>


<script>
	location.href="RentCarMain.jsp?center=BoardList.jsp";
</script>


