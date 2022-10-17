<%@page import="db.CarBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="db.RentcarDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
<jsp:include page="Header.jsp" />
  </head>
 <body>
  <!-- top 메뉴 -->
<jsp:include page="Top.jsp" />

<%
	String center =request.getParameter("center");
	//처음 실행시에는 center 값이 넘어오지 않기에
	if(center==null){//null 처리해줌
		center="Center.jsp";//디폴트 cetner 값을 부여
	}
%>

<jsp:include page="<%=center%>" />
 
 
<%
  	if(request.getParameter("center")==null){
  		
  	
  	RentcarDAO rdao =new RentcarDAO();
      //벡터를 이용하여 자동차를 저장
      ArrayList<CarBean> list =rdao.getMainSelectCar();
  %>

<div class="container marketing" id="marketing">
	<h2 class="text-center" id="carTitle">최신형 자동차</h2>
   <!-- Three columns of text below the carousel -->
      <div class="row">

	<%
		for(int i=0; i <list.size(); i++){
		CarBean bean =list.get(i);
	%>
        <div class="col-lg-4">
          <img class="img-circle" src="img/<%=bean.getImg() %>"  width="300" height="200" 
             onclick="location.href='RentCarMain.jsp?center=CarreserveInfo.jsp&no=<%= bean.getNo() %>'" >
          <h2><%=bean.getName() %></h2>
          <p><%= bean.getInfo() %></p>
          <p><a class="btn btn-default" href="RentCarMain.jsp?center=CarreserveInfo.jsp&no=<%= bean.getNo() %>" role="button">상세보기 &raquo;</a></p>
        </div><!-- /.col-lg-4 -->

    <% } %>
   
      </div><!-- /.row -->  
      
</div>    
 
<% } %>
 
 
<!--  Bottom -->
 <jsp:include page="Bottom.jsp"/>
 
 
 