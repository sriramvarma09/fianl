<%@ page language="java" import="java.util.*, models.Customer, models.Account, services.CustomerService, services.AccountService" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="css/profile.css">
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

<div id="content" class="py-4">
    <div class="container">
      <div class="row"> 
        
        <!-- Left Panel
        ============================================= -->
        <aside class="col-lg-3"> 
          
          <!-- Profile Details
          =============================== -->
          <div class="bg-white shadow-sm rounded text-center p-3 mb-4">
            <div class="profile-thumb mt-3 mb-4"> <img class="rounded-circle" src="images/profile-thumb.jpg" alt="">
            
            </div>
       
            <p class="text-30 fw-500 mb-2"> <h1>Hello, <%= session.getAttribute("customerName") %> </h1></p>
            <p class="mb-2"><a href="settings-profile.html" class="text-5 text-light" data-bs-toggle="tooltip" title="" data-bs-original-title="Edit Profile" aria-label="Edit Profile"><i class="fas fa-edit"></i></a></p>
          </div>
          <!-- Profile Details End --> 
          <% Customer c=(Customer)session.getAttribute("customer"); %>
          <!-- Available Balance
          =============================== -->
          <div class="bg-white shadow-sm rounded text-center p-3 mb-4">
            <div class="text-17 text-light my-3"><i class="fas fa-wallet"></i></div>
            <h3 class="text-9 fw-400"> <%= AccountService.getAllAcoountsBalanceBySSNId(c.getCustomerSSNId()) %></h3>
            <p class="mb-2 text-muted opacity-8">Available Balance</p>
            <hr class="mx-n3">
          </div>
          <!-- Available Balance End --> 
          
          <!-- Need Help?
          =============================== -->
          
          <!-- Need Help? End --> 
          
        </aside>
        <!-- Left Panel End --> 
        
        <!-- Middle Panel
        ============================================= -->
        <div class="col-lg-9"> 
          
          <!-- Personal Details
          ============================================= -->
          <div class="bg-white shadow-sm rounded p-4 mb-4">
            <h3 class="text-5 fw-400 d-flex align-items-center mb-4">Personal Details</h3>
            <hr class="mx-n4 mb-4">
            <div class="row gx-3 align-items-center">
              <p class="col-sm-3 text-muted text-sm-end mb-0 mb-sm-3">Name:</p>
              <p class="col-sm-9 text-20"> <%= session.getAttribute("customerName") %></p>
            </div>
            
            <div class="row gx-3 align-items-baseline">
              <p class="col-sm-3 text-muted text-sm-end mb-0 mb-sm-3">Address:</p>
              
              <p class="col-sm-9 text-3"><%= c.getCustomerAddress() %></p>
            </div>
            <div class="row gx-3 align-items-baseline">
              <p class="col-sm-3 text-muted text-sm-end mb-0 mb-sm-3">Phone Number:</p>
              <p class="col-sm-9 text-3"><%= c.getCustomerPhone() %></p>
            </div>
            
            <div class="row gx-3 align-items-baseline">
              <p class="col-sm-3 text-muted text-sm-end mb-0 mb-sm-3">Email:</p>
              <p class="col-sm-9 text-3"><%= c.getCustomerEmail() %></p>
            </div>
            
          </div>
          
          
          <div class="bg-white shadow-sm rounded p-4 mb-4">
            <h3 class="text-5 fw-400 mb-4">Bank Accounts <span class="text-muted text-4"></span></h3>
            <hr class="mb-4 mx-n4">
            <% ArrayList<Account> al=AccountService.getAllAcoountsBySSNId(c.getCustomerSSNId()+""); %>
											<% for(Account a:al){ %>
            <div class="row g-3">
              <div class="col-12 col-md-6">
                <div class="account-card account-card-primary text-white rounded">
                  <div class="row g-0"> 
					<div class="row g-0">						
					<div class="col-9 border-start">			
					   <div class="py-4 my-2 ps-4">
                        <p class="text-4 fw-500 mb-1">ABC Bank</p>
                        <p class="text-4 opacity-9 mb-1">XXXXXXXXXXXX-9025</p>
                        <p class="m-0">Approved <span class="text-3"><i class="fas fa-check-circle"></i></span></p>
                      </div>
                    </div>
                    </div>
                  <div class="account-card-overlay rounded"> <a href="#" data-bs-target="#bank-account-details" data-bs-toggle="modal" class="text-light btn-link mx-2"><span class="me-1"><i class="fas fa-share"></i></span>More Details</a> <a href="#" class="text-light btn-link mx-2"><span class="me-1"><i class="fas fa-minus-circle"></i></span>Delete</a> </div>
                </div>  
              </div>
              <div class="col-12 col-md-6"> <a href="" data-bs-target="#add-new-bank-account" data-bs-toggle="modal" class="account-card-new d-flex align-items-center rounded h-100 p-3 mb-4 mb-lg-0">
                </a> </div>
            </div>
            <% } %>
          </div>
          
          <!-- Edit Details Modal
          ================================== -->
          
          <!-- Personal Details End --> 
          
          <!-- Account Settings
          ============================================= -->
          
          <!-- Phone End --> 
          
        </div>
        <!-- Middle Panel End --> 
      </div>
    </div>
  </div>

</body>
</html>