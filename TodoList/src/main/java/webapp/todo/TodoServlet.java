package webapp.todo;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/todo.do")
public class TodoServlet extends HttpServlet {

	private TodoService todoService = new TodoService();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("todos", todoService.getTodos());
		request.getRequestDispatcher("/WEB-INF/view/todo.jsp")
		.forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String todo = request.getParameter("todo");
		if("".equals(todo)) {
			request.setAttribute("errorMessage", "할일을 입력하세요");
		} else {
			todoService.addTodo(todo); //리스트에 todo 저장
		}
		request.setAttribute("todos", todoService.getTodos());
		request.getRequestDispatcher("/WEB-INF/view/todo.jsp")
		.forward(request, response);
	}
}





