<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int no =Integer.parseInt(request.getParameter("no"));
	//수량
	int  qty =Integer.parseInt(request.getParameter("qty"));
	//이밎
	String img =request.getParameter("img");
	
  	
%>
		
<div class="container marketing" id="marketing">
   <!-- Three columns of text below the carousel -->
      <div class="row">
		<h2 class="text-center" id="carTitle">옵션 선택</h2>
		<div class="col-xs-1 col-md-1"></div>
    	<div class="col-sm-5">
    		<img src="img/<%= img %>" id="infoImg">
    	</div>
    	
    	<div class="col-sm-5">
    		<form action="RentCarMain.jsp" method="post">
    		<table class="table">
    			<tr>
    				<th>대여기간</th>
    				<td>
	    				 <select name="dday" class="form-control">
	    				   <option value="1">1일</option>
	    				   <option value="2">2일</option>
	    				   <option value="3">3일</option>
	    				   <option value="4">4일</option>
	    				   <option value="5">5일</option>
	    				   <option value="6">6일</option>
	    				   <option value="7">7일</option>
	    				 </select>
    				</td>
    			</tr>
    			<tr>
    				<th>대여일</th>
    				<td>
    					<input type="date" name="rday" class="form-control">
    				</td>
    			</tr>
    			
    			<tr>
    				<th>보험적용</th>
    				<td>
    					<select name="userin" class="form-control">
    						<option value="1">적용 (1일 1만원)</option>
    						<option value="2">비적용</option>
    					</select>
    				</td>
    			</tr>
    			
				<tr>
    				<th>Wifi 적용</th>
    				<td>
    					<select name="usewifi" class="form-control">
    						<option value="1">적용 (1일 1만원)</option>
    						<option value="2">비적용</option>
    					</select>
    				</td>
    			</tr>
    			
    			<tr>
    				<th>네이게이션 적용</th>
    				<td>
    					<select name="usenavi" class="form-control">
    						<option value="1">적용 (무료)</option>
    						<option value="2">비적용</option>
    					</select>
    				</td>
    			</tr>
    			
    			<tr>
    				<th>베이비시트 적용</th>
    				<td>
    					<select name="useseat" class="form-control">
    						<option value="1">적용 (1일 1만원)</option>
    						<option value="2">비적용</option>
    					</select>
    				</td>
    			</tr>
    	
    			<tr>
    				<td colspan="2" class="text-center">
    				<input type="hidden" value="<%= qty %>" name="qty">
    				<input type="hidden" value="CarReserveResult.jsp" name="center">
    				<input type="hidden" value="<%= no %>"  name="no" >
    				<input type="submit" value="차량예약하기" class="form-control" style="background-color: #222222; color:#fff">
    				</td>
    			</tr>
    			
    			
    		</table>
    		</form>	
    	</div>
    	<div class="col-xs-1 col-md-1"></div>	
	</div>      
	


</div>
