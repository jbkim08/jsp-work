<%@page import="db.CarBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="db.RentcarDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	RentcarDAO rdao =new RentcarDAO();
	ArrayList<CarBean> list =rdao.getAllCar();
%>
		
<div class="container marketing" id="marketing">
	<h2 class="text-center" id="carTitle">차량 전체 목록</h2>
   <!-- Three columns of text below the carousel -->
      <div class="row">
		
	<%
				for(int i=0; i <list.size(); i++){
				CarBean bean =list.get(i);
			%>
        <div class="col-lg-4">
          <img class="img-circle" src="img/<%=bean.getImg() %>" alt="Generic placeholder image" width="300" height="200" 
             onclick="location.href='RentCarMain.jsp?center=CarreserveInfo.jsp&no=<%= bean.getNo() %>'" >
          <h2><%=bean.getName() %></h2>
          <p><%= bean.getInfo() %></p>
          <p><a class="btn btn-default" href="RentCarMain.jsp?center=CarreserveInfo.jsp&no=<%= bean.getNo() %>" role="button">상세보기 &raquo;</a></p>
        </div><!-- /.col-lg-4 -->

    <% } %>
   
      </div><!-- /.row -->  
      
</div>      


  <hr class="divider">



<div class="row">
	<div class="col-xs-2 col-md-2"></div>
	<div class="col-xs-8 col-md-8 text-center" >
	  
		<form class="form-inline" action="RentCarMain.jsp?center=CarCategoryList.jsp" method="post">
			<div class="form-group">
				<h4>차량 검색하기 &nbsp;</h4>
			</div>
			<div class="form-group">
				<select name="category" class="form-control">
					<option value="1">소형</option>
					<option value="2">중형</option>
					<option value="3">대형</option>
				</select>
			</div>
			<div class="form-group">
				<input type="submit" value="검색하기" class="btn btn-success">
			</div>
			<div class="form-group">
			    <input type="button" value="전체검색" class="btn btn-danger" onclick="location.href='RentCarMain.jsp?center=CarAllList.jsp'">
			</div>			
		</form>

	  	
	</div>

</div>

    