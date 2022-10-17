<%@page import="db.CarBean"%>
<%@page import="db.RentcarDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int no  =Integer.parseInt(request.getParameter("no"));
	
	//데이터베이스에 접근
	RentcarDAO rdao =new RentcarDAO();
	//렌트카 하나에대한 정보를 얻어옴
	CarBean bean =rdao.getOneCar(no);
	
	String temp="";
	if(bean.getCategory()==1)temp="소형";
	else if(bean.getCategory()==2)temp="중형";
	else if(bean.getCategory()==3)temp="대형";
%>
		
<div class="container marketing" id="marketing">
   <!-- Three columns of text below the carousel -->
      <div class="row">
		<h2 class="text-center" id="carTitle"><%= bean.getName() %> 차량 선택</h2>
		<div class="col-xs-1 col-md-1"></div>
    	<div class="col-sm-5">
    		<img src="img/<%= bean.getImg() %>"  class="img-responsive img-rounded"> 		
    	</div>
    	
    	<div class="col-sm-5">
    	<div class="table-responsive">
    		<form action="RentCarMain.jsp">
    		<table class="table">
    			<tr>
    				<th>차량이름</th>
    				<td><%= bean.getName() %></td>
    			</tr>
    			<tr>
    				<th>차량수량</th>
    				<td>
    					<select class="form-control" name="qty">
    						<option >1</option>
    						<option>2</option>
    						<option>3</option>
    					</select>
    				</td>
    			</tr>
    			<tr>
    				<th>차량분류</th>
    				<td><%= temp %></td>
    			</tr>
    			<tr>
    				<th>대여가격</th>
    				<td><%=bean.getPrice() %>원</td>
    			</tr>
    			<tr>
    				<th>제조회사</th>
    				<td><%= bean.getCompany() %></td>
    			</tr>
				<tr>					
    				<td colspan="2" class="text-center">
    				<input type="hidden" value="CarOptionSelect.jsp"   name="center">
    				<input type="hidden" value="<%= bean.getImg() %>"   name="img">
    				<input type="hidden" value="<%= bean.getNo() %>"   name="no">
    				<input type="submit" class="btn"  value="옵션 선택후 구매하기">
    				</td>
    			</tr>
    			
    		</table>
    		</form>	
    		</div>
    	</div>
    	<div class="col-xs-1 col-md-1"></div>	
	</div>      
	
  <hr class="divider">
  <div class="row">
  <h3 class="text-center">차량 정보 보기</h3>
  <p  class="text-center"><b><%= bean.getName() %></b> 자동차 입니다.</p>
  </div>

</div>
