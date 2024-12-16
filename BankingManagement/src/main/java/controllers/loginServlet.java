package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import models.Customer;
import models.Employee;
import services.CustomerService;
import services.EmployeeService;

/**
 * Servlet implementation class loginServlet
 */
@WebServlet("/LoginServlet")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginServlet() {
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


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession Session = request.getSession();
		Gson gson=new Gson();
		CustomerService customerService = new CustomerService();
		EmployeeService employeeService = new EmployeeService();
		String role=request.getParameter("role");
		String jsonResponse=null;
		String username = request.getParameter("username");
        String password = request.getParameter("password");
        switch(role) {
		case "customer":
			Customer customer = customerService.validateCustomerLogin(username, password);
			if (customer!=null) { // Assuming a method to validate customer login
				Session.setAttribute("customer", customer);
				Session.setAttribute("customerName", customer.getCustomerName());
				jsonResponse = "{ \"success\": true, \"customerId\": "+ customer.getCustomerSSNId()+", \"customerName\": \" "+customer.getCustomerName()+"\" }";
			} else {
				jsonResponse = "{ \"success\": true, \"message\": \"Invalid username or password.\" }";
			}
			break;
		case "employee":
			Employee employee = employeeService.validateEmployeeLogin(username, password);
			if (employee != null) { // Assuming a method to validate employee login
				 Session.setAttribute("employee", employee);
				jsonResponse = "{ \"success\": true, \"employeeId\": " + employee.getEmployeeId()
						+ ", \"employeeName\": \"" + employee.getEmployeeFirstName() + "\" }";
			} else {
				jsonResponse = "{ \"success\": false, \"message\": \"Invalid username or password.\" }";
			}
			break;
			
		}
		response.getWriter().write(gson.toJson(jsonResponse));
		
	}

}
