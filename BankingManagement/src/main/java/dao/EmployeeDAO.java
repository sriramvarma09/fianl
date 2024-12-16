package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import models.Employee;

public class EmployeeDAO {
	public Connection con=DbCon.getConnection();

	public Employee getEmployeeByUsername(String employeeId) throws Exception {
        Employee employee = null;
        String query = "SELECT * FROM Employee WHERE employeeId = ?"; // Query to fetch the employee by ID
        PreparedStatement preparedStatement = con.prepareStatement(query);
            
            preparedStatement.setString(1, employeeId); 

            ResultSet resultSet = preparedStatement.executeQuery();
                if (resultSet.next()) {
                	System.out.println("Employee found");
                    // Populate the Employee object from the result set
                    employee = new Employee();
                    employee.setEmployeeId(resultSet.getLong("employeeId"));
                    employee.setEmployeeFirstName(resultSet.getString("employeeFirstName"));
                    employee.setEmployeeLastName(resultSet.getString("employeeLastName"));
                    employee.setEmployeeEmail(resultSet.getString("employeeEmail"));
                    employee.setEmployeePassword(resultSet.getString("employeePassword"));
                    employee.setEmployeePhone(resultSet.getString("employeeContactNumber"));
                    employee.setEmployeeAddress(resultSet.getString("employeeAddress"));
                }
            
        System.out.println(employee);

        return employee; // Return the employee object (null if not found)
    }
	public Long getEmployeeId() throws SQLException {
		Long maxEmployeeId = null;
        String query = "SELECT MAX(employeeId) AS maxId FROM Employee"; 
        PreparedStatement preparedStatement = con.prepareStatement(query);
        ResultSet resultSet = preparedStatement.executeQuery();
		if (resultSet.next()) {
			maxEmployeeId = resultSet.getLong("maxId");
		}
        return maxEmployeeId;
	}

	public boolean registerEmployee(Employee emp) throws Exception {
		String query = "INSERT INTO Employee (employeeId, employeeFirstName, employeeLastName, employeeEmail, employeePassword, employeeContactNumber, employeeAddress) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?)";
		        PreparedStatement preparedStatement = con.prepareStatement(query);
		        preparedStatement.setLong(1, emp.getEmployeeId());
		        preparedStatement.setString(2, emp.getEmployeeFirstName());
		        preparedStatement.setString(3, emp.getEmployeeLastName());
		        preparedStatement.setString(4, emp.getEmployeeEmail());
		        preparedStatement.setString(5, emp.getEmployeePassword());
		        preparedStatement.setString(6, emp.getEmployeePhone());
		        preparedStatement.setString(7, emp.getEmployeeAddress());
		        int res=preparedStatement.executeUpdate();
		        return res>0;
		
	}

}
