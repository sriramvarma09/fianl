package controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.Account;
import models.Employee;
import services.AccountService;

/**
 * Servlet implementation class CustomerRegisterExistServlet
 */
@WebServlet("/customerRegisterExist")
public class CustomerRegisterExistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerRegisterExistServlet() {
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
		HttpSession Session = request.getSession();
		Employee e= (Employee)Session.getAttribute("employee");
		
		String ssnid = request.getParameter("ssnid");
		double balance=Double.parseDouble(request.getParameter("balance"));
		String accountType=request.getParameter("accountType");
		System.out.println(accountType);
		AccountService accountService = new AccountService();
		Account a=new Account();
		a.setAccountNumber(accountService.getMaxAccountNumber()+1);
		a.setCustomerSSNId(Long.parseLong(ssnid));
		a.setAccountType(accountType);
		a.setAccountBalance(balance);
		a.setAccountStatus(true);
		int result = accountService.createAccount(a);
		if(result==1) 
            response.getWriter().append("Account Registered Successfully");
		else {
			response.getWriter().append("Account Registration Failed");
		}
		Session.setAttribute("employee", e);
		
	}

}
