package controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import models.Customer;
import models.Employee;
import services.CustomerService;
import services.EmployeeService;

/**
 * Servlet implementation class GetEmployee
 */
@WebServlet("/GetEmployee")
public class GetEmployee extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetEmployee() {
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
		System.out.println("GetEmployee Servlet called");
		String employeeId = request.getParameter("SSNId");
		System.out.println(employeeId);
		CustomerService customerService = new CustomerService();
		System.out.println("reachable code");
		Customer employee = customerService.getCustomerById(employeeId);
		System.out.println(employee);
		if (employee != null) {
			response.getWriter().append(new Gson().toJson(employee));
		} else {
			response.getWriter().append("Employee not found");
		}
	}

}
