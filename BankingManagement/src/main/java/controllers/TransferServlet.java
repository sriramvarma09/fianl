package controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.Customer;
import services.AccountService;
import services.CustomerService;

/**
 * Servlet implementation class TransferServlet
 */
@WebServlet("/transfer")
public class TransferServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TransferServlet() {
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
		System.out.println("Transfer Servlet");
		// TODO Auto-generated method stub
		String ssnId = request.getParameter("customerId");
		System.out.println(ssnId);
		String toAccount = request.getParameter("toAccount");
		String fromAccount = request.getParameter("fromAccount");
		String Amount = request.getParameter("amount");
		int val;
		if(ssnId.equalsIgnoreCase("undefined")){val=AccountService.transfer(fromAccount,toAccount, Amount,ssnId,true);}
		else{val=AccountService.transfer(fromAccount,toAccount, Amount,ssnId,false);}
		if(val==1) {
            response.getWriter().write("Transfer Successful");}
		else if (val == -1) {
			response.getWriter().write("Insufficient Balance");
		}
		else if (val == -2) {
			response.getWriter().write("Cannot Transfer to the same account");
		} else if (val == -3) {
			response.getWriter().write("Invalid Amount");
		} else if (val == -4) {
			response.getWriter().write("Invalid Account Number");
		}
		else {
			response.getWriter().write("Transfer Failed");
		}
		CustomerService customerService = new CustomerService();
		Customer customer = customerService.getCustomerById(ssnId);
		HttpSession session = request.getSession();
		session.setAttribute("customer", customer);
		
	}

}
