package services;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import dao.CustomerDAO;
import models.Customer;

public class CustomerService {

	public Customer validateCustomerLogin(String username, String password) {
		// TODO Auto-generated method stub
		CustomerDAO customerDAO = new CustomerDAO();
		Customer customer;
		try {
			customer = customerDAO.getCustomerByUsername(username);
		} catch (Exception e) {
			return null;
		}
		if (customer != null && customer.getCustomerPassword().equals(password)) {
			return customer;
		}
		return null;
	}

	public Customer getCustomerById(String employeeId) {
		// TODO Auto-generated method stub
		System.out.println("GetEmployeeById called");
		CustomerDAO customerDAO = new CustomerDAO();
		Customer customer;
		try {
			customer = customerDAO.getCustomerByUsername(employeeId);
			return customer;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}

	public void updateCustomer(Customer customer) {
		// TODO Auto-generated method stub
		CustomerDAO customerDAO = new CustomerDAO();
		try {
            customerDAO.updateCustomer(customer);
        } catch (Exception e) {
            e.printStackTrace();
        }
		
	}

	public long getMaxCustomerSSNId() {
		// TODO Auto-generated method stub
		CustomerDAO customerDAO = new CustomerDAO();
		try {
            return customerDAO.getMaxCustomerSSNId();
        } catch (Exception e) {
            e.printStackTrace();			
		
	}
		return -1;

	}

	public int registerCustomer(Customer c) {
		// TODO Auto-generated method stub
		CustomerDAO customerDAO = new CustomerDAO();
		try {
			customerDAO.registerCustomer(c);
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
}



