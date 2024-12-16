package controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.Employee;
import services.AccountService;

/**
 * Servlet implementation class DebitCreditServlet
 */
@WebServlet("/DebitCreditServlet")
public class DebitCreditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DebitCreditServlet() {
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
		HttpSession Session=request.getSession();
		Employee e=(Employee) Session.getAttribute("employee");
		
		String accno=request.getParameter("accountnumber");
		String amount=request.getParameter("amount");
		String type=request.getParameter("type");
		AccountService as=new AccountService();
		if(type.equals("Debit"))
			{
			
				as.doDebit(accno,amount);
				
			}
		else if(type.equals("Credit")){
				as.doCredit(accno,amount);
		}
		
		Session.setAttribute("employee", e);
		
		}
	}
