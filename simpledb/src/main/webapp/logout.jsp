<%
//모든 세션데이터 삭제후 로그인페이지로 이동
session.invalidate();
response.sendRedirect("index.jsp");
%>