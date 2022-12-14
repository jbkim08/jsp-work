package webapp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import webapp.model.Employee;
import webapp.util.DBConnectionUtil;

public class EmployeeDAOImple implements EmployeeDAO {
	
	Connection connection = null;
	ResultSet resultSet = null;
	Statement statement = null;
	PreparedStatement preparedStatement = null;

	@Override
	public List<Employee> get() {
		// 모든 직원을 가져오기
		List<Employee> list = new ArrayList<>();
		Employee employee = null;
		
		try {
			String sql = "SELECT * FROM tbl_employee";
			connection = DBConnectionUtil.openConnection();
			statement = connection.createStatement();
			resultSet = statement.executeQuery(sql);
			while(resultSet.next()) {
				employee = new Employee(); //빈 직원 객체를 생성
				employee.setId(resultSet.getInt("id"));
				employee.setName(resultSet.getString("name"));
				employee.setDepartment(resultSet.getString("department"));
				employee.setDob(resultSet.getString("dob"));
				list.add(employee); //직원리스트에 한명의 직원을 추가
			}		
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list; //직원 리스트 리턴
	}

	@Override
	public Employee get(int id) {
		Employee employee = null;
		try {
			employee = new Employee();
			String sql = "SELECT * FROM tbl_employee where id="+ id;
			connection = DBConnectionUtil.openConnection();
			statement = connection.createStatement();
			resultSet = statement.executeQuery(sql);
			if(resultSet.next()) {
				employee.setId(resultSet.getInt("id"));
				employee.setName(resultSet.getString("name"));
				employee.setDepartment(resultSet.getString("department"));
				employee.setDob(resultSet.getString("dob"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return employee;
	}

	@Override
	public boolean save(Employee e) {
		boolean flag = false;
		try {
			String sql = "INSERT INTO tbl_employee(name, department, dob) "
					+ "VALUES(?,?,?)";
				
			connection = DBConnectionUtil.openConnection();
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, e.getName());
			preparedStatement.setString(2, e.getDepartment());
			preparedStatement.setString(3, e.getDob());
			preparedStatement.executeUpdate(); //결과가 없을경우 executeUpdate()
			flag = true; //입력하는데 문제 없음
		}catch(SQLException ex) {
			ex.printStackTrace();
		}
		return flag;

	}

	@Override
	public boolean delete(int id) {
		boolean flag = false;
		try {
			String sql = "Delete FROM tbl_employee where id=?";
			connection = DBConnectionUtil.openConnection();
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, id);
			preparedStatement.executeUpdate();
			flag = true;
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return flag;

	}

	@Override
	public boolean update(Employee e) {
		boolean flag = false;
		try {
			String sql = "UPDATE tbl_employee SET name=?, "
					+ "department=?, dob=? where id=?";
			connection = DBConnectionUtil.openConnection();
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, e.getName());
			preparedStatement.setString(2, e.getDepartment());
			preparedStatement.setString(3, e.getDob());
			preparedStatement.setInt(4, e.getId());
			preparedStatement.executeUpdate();
			flag = true;
		}catch(SQLException e1) {
			e1.printStackTrace();
		}
		return flag;
	}

}
