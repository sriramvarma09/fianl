package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//import models.Employee;
//import services.EmployeeService;

import com.google.gson.Gson;

import models.Employee;
import services.EmployeeService;

@WebServlet("/EmployeeRegisterServlet")
public class EmployeeRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public EmployeeRegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response)  {
		
			System.out.println("in post");
			String firstName = request.getParameter("firstname");
	        String lastName = request.getParameter("lastname");
	        String email = request.getParameter("email");
	        String password = request.getParameter("password");
	        String address = request.getParameter("address");
	        String contactNumber = request.getParameter("contactNumber");
	        EmployeeService employeeService = new EmployeeService();
	        long empid=employeeService.getEmployeeId();
	        Employee emp=new Employee();
	        emp.setEmployeeId(empid);
	        emp.setEmployeeFirstName(firstName);
	        emp.setEmployeeLastName(lastName);
	        emp.setEmployeeEmail(email);
	        emp.setEmployeePassword(password);
	        emp.setEmployeePhone(contactNumber);
	        emp.setEmployeeAddress(address);
	        
	        System.out.println(empid);
	        
	        System.out.println(employeeService.registerEmployee(emp));
	        HttpSession session = request.getSession();
	        session.setAttribute("employee", emp);
	        
	        System.out.println("registered");
	        Gson gson = new Gson();
	        try {
				response.getWriter().write(gson.toJson("{\"valid\":true,\"employee\":"+gson.toJson(emp)+"}"));
			} catch (IOException e) {
				e.printStackTrace();
			}
	        	}

}
