package controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.Account;
import models.Customer;
import models.Employee;
import services.AccountService;
import services.CustomerService;

/**
 * Servlet implementation class RegisterCustomerServlet
 */
@WebServlet("/customerRegister")
public class RegisterCustomerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterCustomerServlet() {
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
	 * 
Name
: 
"Ram Murthy Raju Vatsavai"
aadharnumber
: 
"808711179824"
accountTypr
: 
"savings"
address
: 
"1-27 B C Colony Dwarapudi"
balance
: 
"5000"
email
: 
"rammurthyrajuvatsavai@gmail.com"
pannumber
: 
"CRPTV4155R"
phone
: 
"919492902551"
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession Session = request.getSession();
		Employee employee = (Employee) Session.getAttribute("employee");
		String name = request.getParameter("Name");
		String aadharNumber = request.getParameter("aadharnumber");
		String accountType = request.getParameter("accountType");
		String address = request.getParameter("address");
		String balance = request.getParameter("balance");
		String email = request.getParameter("email");
		String panNumber = request.getParameter("pannumber");
		String phone = request.getParameter("phone");
		// Assuming a method to register a customer
		Customer c=new Customer();
		c.setCustomerName(name);
		c.setCustomerAadharNumber(Long.parseLong(aadharNumber));
		c.setCustomerAddress(address);
		c.setCustomerEmail(email);
		c.setCustomerPanNumber(panNumber);
		c.setCustomerPhone(phone);
		c.setCustomerPassword(name.substring(0, 4)+aadharNumber.substring(0, 4));
		Account a=new Account();
		AccountService as=new AccountService();
		long aid=as.getMaxAccountNumber();
		if(aid==-1) {
			response.getWriter().append("Error in creating account");
			return;}
		a.setAccountNumber(aid+1);
		CustomerService cs=new CustomerService();
		long ssnid=cs.getMaxCustomerSSNId();
		if (ssnid == -1) {
			response.getWriter().append("Error in creating account");
			return;
		}
		c.setCustomerSSNId(ssnid+1);
		a.setCustomerSSNId(ssnid+1);
		a.setAccountType(accountType);
		a.setAccountBalance(Double.parseDouble(balance));
		a.setAccountStatus(true);
		int res1=cs.registerCustomer(c);
		int res2=as.createAccount(a);
		if (res1 == 1 && res2 == 1) {
			response.getWriter().append("Customer registered successfully");
		} else {
			response.getWriter().append("Error in creating account");
		}
		Session.setAttribute("employee", employee);
		
		
	}

}
