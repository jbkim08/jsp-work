package test;

import java.util.List;

import webapp.dao.EmployeeDAOImple;
import webapp.model.Employee;

public class Test {

	public static void main(String[] args) {
		EmployeeDAOImple dao = new EmployeeDAOImple();
		List<Employee> list = dao.get();
		
		list.forEach(e -> System.out.println(e));		
	}

}
