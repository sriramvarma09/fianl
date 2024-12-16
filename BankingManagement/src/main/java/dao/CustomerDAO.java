package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import models.Customer;

public class CustomerDAO {
	
	public Connection conn=DbCon.getConnection();

	public Customer getCustomerByUsername(String username) throws Exception{
	    Customer customer = null;
	    String query = "SELECT customerSSNId, customerName, customerEmail, customerPassword, " +
	                   "customerPhoneNumber, customerAddress, customerAadharNumber, customerPanNumber " +
	                   "FROM Customer WHERE customerSSNId = ?";
	    PreparedStatement preparedStatement = conn.prepareStatement(query);
	    preparedStatement.setString(1, username);
	    System.out.println(username);
	    ResultSet resultSet = preparedStatement.executeQuery();
	    if (resultSet.next()) {
	                customer = new Customer();
	                customer.setCustomerSSNId(resultSet.getLong("customerSSNId"));
	                customer.setCustomerName(resultSet.getString("customerName"));
	                customer.setCustomerEmail(resultSet.getString("customerEmail"));
	                customer.setCustomerPassword(resultSet.getString("customerPassword"));
	                customer.setCustomerPhone(resultSet.getString("customerPhoneNumber"));
	                customer.setCustomerAddress(resultSet.getString("customerAddress"));
	                customer.setCustomerAadharNumber(resultSet.getLong("customerAadharNumber"));
	                customer.setCustomerPanNumber(resultSet.getString("customerPanNumber"));
	            }
	    System.out.println(customer);
	    return customer;
	}

	public void updateCustomer(Customer customer) throws Exception {
		// TODO Auto-generated method stub
		String query = "UPDATE Customer SET customerName=?, customerEmail=?, customerPhoneNumber=?, customerAddress=? WHERE customerSSNId=?";
		PreparedStatement preparedStatement;
		preparedStatement = conn.prepareStatement(query);
		preparedStatement.setString(1, customer.getCustomerName());
		preparedStatement.setString(2, customer.getCustomerEmail());
		preparedStatement.setString(3, customer.getCustomerPhone());
		preparedStatement.setString(4, customer.getCustomerAddress());
		preparedStatement.setLong(5, customer.getCustomerSSNId());
		preparedStatement.executeUpdate();
		System.out.println("Customer updated successfully");
		
		
	}

	public long getMaxCustomerSSNId()throws Exception {
		// TODO Auto-generated method stub
		Connection con = DbCon.getConnection();
		PreparedStatement ps;
		ps=con.prepareStatement("select max(customerSSNId) from customer");
		ResultSet rs = ps.executeQuery();
		if (rs.next()) {
			return rs.getLong(1);
		}
		
		
		
		
		return 2123456l;
	}

	public void registerCustomer(Customer c) throws Exception{
		// TODO Auto-generated method stub
		String query = "INSERT INTO Customer (customerSSNId, customerName, customerEmail, customerPassword, "
				+ "customerPhoneNumber, customerAddress, customerAadharNumber, customerPanNumber) "
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
		PreparedStatement preparedStatement;
		preparedStatement = conn.prepareStatement(query);
		preparedStatement.setLong(1, c.getCustomerSSNId());
		preparedStatement.setString(2, c.getCustomerName());
		preparedStatement.setString(3, c.getCustomerEmail());
		preparedStatement.setString(4, c.getCustomerPassword());
		preparedStatement.setString(5, c.getCustomerPhone());
		preparedStatement.setString(6, c.getCustomerAddress());
		preparedStatement.setLong(7, c.getCustomerAadharNumber());
		preparedStatement.setString(8, c.getCustomerPanNumber());
		preparedStatement.executeUpdate();
		System.out.println("Customer registered successfully");
		
		
		
	}
	

}
