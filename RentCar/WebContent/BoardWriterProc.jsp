<%@page import="model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 
강의와 다르게 html 적 요소는 제거하였다. 왜냐하면은 BoardWriterProc.jsp 페이지에서는
userBean 작업만 하기 때문이다. -->
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

	//데이커 저장 메소드를 호출
	bdao.insertBoard(boardbean);

	//게시글저장후 전체게시글 보기
	
%>

<script>
	location.href="RentCarMain.jsp?center=BoardList.jsp";
</script>



    