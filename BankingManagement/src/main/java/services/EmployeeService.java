package services;

import java.sql.SQLException;

import dao.EmployeeDAO;
import models.Employee;

public class EmployeeService {

	public Employee validateEmployeeLogin(String username, String password) {
		
		EmployeeDAO employeeDAO = new EmployeeDAO();
		Employee employee;
		try {
			employee = employeeDAO.getEmployeeByUsername(username);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			return null;
		}
		if (employee != null && employee.getEmployeePassword().equals(password)) {
			return employee;
		}
		return null;
	}

	public Long getEmployeeId() {
		EmployeeDAO employeeDAO = new EmployeeDAO();
		Long employeeId;
		try {
			employeeId = employeeDAO.getEmployeeId();
		} catch (SQLException e) {
			
			return null;
		}
		if (employeeId != null) {
			return employeeId+1;
		}
		else {
			return 5764321l;
		}
	}

	public boolean registerEmployee(Employee emp) {
		System.out.println(emp);
		EmployeeDAO employeeDAO = new EmployeeDAO();
		try {
			return employeeDAO.registerEmployee(emp);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
			
		}
		
	}

	public Employee getEmployeeById(String employeeId) {
		System.out.println("GetEmployeeById called");
		EmployeeDAO employeeDAO = new EmployeeDAO();
		Employee employee;
		try {
			employee = employeeDAO.getEmployeeByUsername(employeeId);
			return employee;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}

}
