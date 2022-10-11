package test;

import java.util.List;

import webapp.dao.EmployeeDAOImple;
import webapp.model.Employee;

public class Test {

	public static void main(String[] args) {
		EmployeeDAOImple dao = new EmployeeDAOImple();
		
		//List<Employee> list = dao.get();		
		//list.forEach(e -> System.out.println(e));		
		
		//Employee employee = dao.get(3);
		//System.out.println(employee);
		
		//dao.save(new Employee("펭수","지원부","2000-12-12"));
		dao.delete(6);
		
		List<Employee> list = dao.get();		
		list.forEach(e -> System.out.println(e));		
		
	}

}
