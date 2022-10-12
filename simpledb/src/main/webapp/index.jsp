<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
    <head>
        <title>Login System</title>
    </head>
 	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <body>
        <%
        String email=(String)session.getAttribute("email");
        
        //이미 세션에 로그인 이메일이 저장되어 있으면 바로 직원리스트 페이지로
        if(email!=null){
            response.sendRedirect("EmployeeController?action=LIST");
        }
 
        String status=request.getParameter("status");
        
        if(status!=null){
        	if(status.equals("false")){
        		   out.print("이메일또는 패스워드가 정확하지 않습니다!");	           		
        	}
        	else{
        		out.print("에러 발생!");
        	}
        }
        %>
    
        <div class="container mt-5">
        	<form action="loginprocess" method="post"> 
       		<div class="card">
	        	<div class="card-header text-left font-weight-bold">
	        		Login
	        	</div>
	        	<div class="card-body">
	        		 
	                    <div class="form-group">
	                    	<input type="text" name="email" required class="form-control" placeholder="Enter Email"/>
	                    </div>
	                	<div class="form-group">
	                		<input type="password" name="password" required class="form-control" placeholder="Enter password"/>
	                	</div>
	        		
	        	</div>
	        	<div class="card-footer text-left">
	        		<input type="submit" value="Login" class="btn btn-primary"/>
	        	</div>
       		</div>
        	</form>
        </div>
    </body>
</html>