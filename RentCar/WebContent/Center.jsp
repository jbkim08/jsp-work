<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="db.CarBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="db.RentcarDAO"%>    
<%
    	RentcarDAO rdao =new RentcarDAO();
    	//벡터를 이용하여 자동차를 저장
    	ArrayList<CarBean> list =rdao.getMainBannerSelectCar();
    %>
    
   <!-- Carousel
    ================================================== -->
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
      <!-- Indicators -->
      <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
      </ol>
      <div class="carousel-inner" role="listbox">
       

              
      	<%
                           		for(int i=0; i< list.size() ; i++ ){
                           	      			CarBean bean =list.get(i);
                           	      			
                           	      			String temp="";
                           	      			String Temp="";
                           	      			if(i==0){
                           	      				temp="first-slide";
                           	      				Temp="First slide";
                           	      			}else if(i==1){
                           	      				temp="second-slide";
                           	      				Temp="Second slide";
                           	      			}else if(i==2){
                           	      				temp="third-slide";
                           	      				Temp="Third slide";
                           	      			}
                           	%>
      
        <div class="item<%  if(i==0) out.write(" active");%>">
          <img class="<%= temp %>" src="img/<%= bean.getImg() %>" >
          <div class="container">
            <div class="carousel-caption">
              <h1><%=bean.getName() %></h1>
              <p><%= bean.getInfo() %></p>
              <p><a class="btn btn-lg btn-primary" href="RentCarMain.jsp?center=CarreserveInfo.jsp&no=<%= bean.getNo() %>" role="button">상세보기</a></p>
            </div>
          </div>
        </div>

		<% } %>
        
        
        
      </div>
      
      <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
        <span id="slideLeft"><< </span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
        <span id="slideRight">>></span>
        <span class="sr-only">Next</span>
      </a>
    </div><!-- /.carousel -->