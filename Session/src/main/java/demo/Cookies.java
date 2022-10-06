package demo;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/cook")
public class Cookies extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		out.print("<html>");
		Cookie[] cookies = request.getCookies();
		
		if(cookies == null) {
			out.println("No cookie");
		} else {
			for(Cookie c : cookies) {
				String name = c.getName();
				String value = c.getValue();
				
				out.println(name + "=" + value + "<br>");
			}
		}
		Cookie c1 = new Cookie("user", "kim"); //새 쿠키 생성
		c1.setMaxAge(60); //60초
		response.addCookie(c1); //브라우저에 저장
		
		out.println("Cookie saved ! <br>");
		
		out.println("</html>");
	}

}
