package controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Customer;
import services.CustomerService;

/**
 * Servlet implementation class UpdateCustomerServlet
 */
@WebServlet("/UpdateCustomer")
public class UpdateCustomerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateCustomerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String customerId = request.getParameter("customerId");
		String customerName = request.getParameter("customerName");
		String customerEmail = request.getParameter("customerEmail");
		String customerPhone = request.getParameter("customerPhone");
		String customerAddress = request.getParameter("customerAddress");
		CustomerService customerService = new CustomerService();
		Customer customer = customerService.getCustomerById(customerId);
		System.out.println(customer);
		if (customer != null) {
            customer.setCustomerName(customerName);
            customer.setCustomerEmail(customerEmail);
            customer.setCustomerPhone(customerPhone);
            customer.setCustomerAddress(customerAddress);
            customerService.updateCustomer(customer);
            response.getWriter().append("Customer updated successfully");
        } else {
            response.getWriter().append("Customer not found");
	}
	}

}
