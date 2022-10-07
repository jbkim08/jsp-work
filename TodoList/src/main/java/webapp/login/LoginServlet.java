package webapp.login;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import webapp.todo.TodoService;


@WebServlet("/login.do")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private LoginService service = new LoginService();
       
	//get일때 로그인 페이지로!
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/view/login.jsp")
		.forward(request, response);
	}
	
	//로그인페이지에서 이름 패스워드 입력후 로그인할때 로그인 체크!
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		System.out.println(name);
		// 이름 패스워드 검사 (DB에서 저장된 이름과 패스워드 체크)
		boolean isValidUser = service.isUserValid(name, password);
		
		if(isValidUser) {
			request.getSession().setAttribute("name", name);
			response.sendRedirect("/todoList/todo.do");
		} else {
			request.setAttribute("errorMessage", "Invalid Credentials!!");
			//이름과 비밀번호가 맞지 않으므로 다시 login 페이지로 보내기	
			request.getRequestDispatcher("/WEB-INF/view/login.jsp")
			.forward(request, response);
		}
	}

}
