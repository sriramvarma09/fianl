package controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.google.gson.Gson;

import models.Account;
import services.AccountService;

/**
 * Servlet implementation class viewAccountsServlet
 */
@WebServlet("/viewAccounts")
public class viewAccountsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public viewAccountsServlet() {
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
        System.out.println("viewAccountsServlet doPost");

        // Retrieve SSN ID from the request
        String ssnId = request.getParameter("ssnid");

        // Call AccountService to fetch all accounts by SSN ID
        List<Account> accounts = AccountService.getAllAcoountsBySSNId(ssnId);

        // Set the accounts list in the session
        HttpSession session = request.getSession();
        session.setAttribute("accounts", accounts);

        // Redirect to the JSP to display the accounts
        // Change the target JSP page if necessary
        response.getWriter().write(new Gson().toJson(accounts));
    }

}
