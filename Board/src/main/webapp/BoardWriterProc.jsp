<%@page import="model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");//한글지원
%>
<!-- 게시글 작성에 데이터를 한번에 읽어드림 -->
<jsp:useBean id="boardbean" class="model.BoardBean">
 <jsp:setProperty name="boardbean" property="*" />
</jsp:useBean>

<%
	//데이터 베이스 쪽으로 변경클래스를 넘겨줌
	BoardDAO bdao =new BoardDAO();

	//보드글 저장 메소드를 호출
	bdao.insertBoard(boardbean);

	//게시글저장후 전체게시글 보기
	response.sendRedirect("BoardList.jsp");
%>
​