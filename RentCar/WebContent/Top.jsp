<%@page import="db.RentcarDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!--  세션을 이용한 로그인 처리 -->
<%
	String id =(String)session.getAttribute("id");

	//로그인이 되어있지 않다면, 
	if(id==null){
		id="GUEST";
	}
%>   
 <div class="navbar-wrapper">
      <div class="container">

        <nav class="navbar navbar-inverse navbar-static-top">
          <div class="container">
            <div class="navbar-header">
              <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Macaronics</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
              <a class="navbar-brand" href="RentCarMain.jsp">SM 렌트카</a>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
              <ul class="nav navbar-nav">
                <li class="active"><a href="RentCarMain.jsp?center=CarReserveMain.jsp">예약하기</a></li>
                <li><a href="RentCarMain.jsp?center=CarReserveView.jsp">예약확인</a></li>
                <li><a href="RentCarMain.jsp?center=BoardList.jsp">자유게시판</a></li>
                <li><a href="#contact">이벤트</a></li>
                <li><a href="RentCarMain.jsp?center=member/MemberList.jsp">회원목록</a></li>
				<li><a href="#" style="color:#fff"><b><%= id %></b> 님 반갑습니다.</a></li>
				<%
					if(id.equals("GUEST")){
				%>
				<li><a href="RentCarMain.jsp?center=MemberLogin.jsp" ><button class="btn btn-primary">로그인</button></a></li>
				<li><a href="RentCarMain.jsp?center=member/MemberJoin.jsp" ><button class="btn btn-primary">회원가입</button></a></li>
				<%		
					}else{ 
				%>		
				<li><a href="RentCarMain.jsp?center=Logout.jsp" ><button class="btn btn-danger">로그아웃</button></a></li>						
			   <%			
					}
				%>
              </ul>
            </div>
          </div>
        </nav>

      </div>
    </div>
   
    