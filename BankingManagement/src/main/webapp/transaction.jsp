<%@ page language="java" import="java.util.*, models.Customer, models.Account,models.Transaction, services.CustomerService, services.AccountService" pageEncoding="UTF-8" %>
<%
    CustomerService customerService = new CustomerService();
    AccountService accountService = new AccountService();
    Customer customer = (Customer) session.getAttribute("customer");
    List<Account> accounts = AccountService.getAllAcoountsBySSNId(customer.getCustomerSSNId()+"");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="css/transaction.css">
<link rel="stylesheet" href="css/navigation.css">
<script src="js/customerhome.js"></script>
</head>
<body>

<nav>
        <div class="nav-content">
            <div class="logo">ABC Bank</div>
            <div class="nav-links">
                <a href="customerhome.jsp">Home</a>
                <a href="customerhome.jsp">Services</a>
                <a href="profile.jsp">Profile</a>
                <a onClick="logout()">Logout</a>
            </div>
        </div>
    </nav>




<div class="col-lg-9">
          <h2 class="fw-400 mb-3">Transactions</h2>
          
          
          <!-- All Transactions
          ============================================= -->
          <div class="bg-white shadow-sm rounded py-4 mb-4">
            <h3 class="text-5 fw-400 d-flex align-items-center px-4 mb-5">All Transactions</h3>
            <!-- Title
            =============================== -->
            <div class="transaction-title py-2 px-4">
              <div class="row">
              	<div class="col col-sm-1">Id</div>
                <div class="col col-sm-7">Description</div>
                <div class="col-auto col-sm-2 d-none d-sm-block text-center">Type</div>
                <div class="col-3 col-sm-2 text-end">Amount</div>
              </div>
            </div>
            <!-- Title End --> 
            
           <% for(Account account : accounts) { %>
               <% List<Transaction> transactions = accountService.getTransactionsByAccountId(account.getAccountNumber()); %>
			<% for(Transaction transaction : transactions) { System.out.println(transaction);%>
				<div class="transaction-list">
					<div class="transaction-item px-4 py-3" data-bs-toggle="modal"
						data-bs-target="#transaction-detail">
						<div class="row align-items-center flex-row">
							<div class="col col-sm-1"><%= transaction.getTransactionId()  %></div>
							<div class="col col-sm-7">
								<span class="d-block text-4">ABC Bank</span> <span
								class="text-muted text-2"><%= account.getAccountNumber() %></span>

						</div>
							<div class="col-auto col-sm-2 d-none d-sm-block text-center text-3">
								<span class="text-warning" data-bs-toggle="tooltip" title=""
									data-bs-original-title="In Progress" aria-label="In Progress"><i
									class="fas fa-ellipsis-h"></i><%= transaction.getTransactionType() %></span>
							</div>
							<div class="col-3 col-sm-2 text-end text-4">
								<span class="text-nowrap"><%= transaction.getTransactionAmount() %></span> <span
									class="text-2 text-uppercase">(INR)</span>
							</div>
						</div>
					</div>
					</div>
					<%}%>
					<%}%>

					<!-- All Transactions End -->
				</div></body>
</html>