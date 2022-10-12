package webapp.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import webapp.dao.EmployeeDAO;
import webapp.dao.EmployeeDAOImple;
import webapp.model.Employee;

@WebServlet("/EmployeeController")
public class EmployeeController extends HttpServlet {

	EmployeeDAO empDAO = null;
	
	public EmployeeController() {
		empDAO = new EmployeeDAOImple();
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		
		if(action == null) {
			action = "LIST";
		}
		
		switch(action) {
			
			case "LIST":
				listEmployee(request, response);
				break;
				
			case "EDIT":
				getSingleEmployee(request, response);
				break;
				
			case "DELETE":
				deleteEmployee(request, response);
				break;
				
			default:
				listEmployee(request, response);
				break;
				
	}			
}
	
	private void listEmployee(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		//DB에있는 모든 직원데이터를 불러와서 화면 employee-list.jsp에 전달
		List<Employee> list = empDAO.get();
		request.setAttribute("empList", list);		
		request.getRequestDispatcher("/views/employee-list.jsp")
			.forward(request, response);	
	}
	
	private void getSingleEmployee(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
	}

	private void deleteEmployee(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String id = request.getParameter("id");
		
		if(empDAO.delete(Integer.parseInt(id))) {
			request.setAttribute("NOTIFICATION", "성공적으로 삭제됨!");
		}
		
		listEmployee(request, response);
	}
	
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Employee e = new Employee();
		e.setName(request.getParameter("name"));
		e.setDepartment(request.getParameter("department"));
		e.setDob(request.getParameter("dob"));
		//DB에 입력한 직원을 저장
		if(empDAO.save(e)) {
			request.setAttribute("NOTIFICATION", "새 직원이 성공적으로 저장됨!");
		} else {
			request.setAttribute("NOTIFICATION", "새 직원이 저장 에러!");
		}
		
		listEmployee(request, response);
	}

}







