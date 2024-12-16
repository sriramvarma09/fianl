<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*, models.Customer, models.Employee, services.CustomerService, services.AccountService"
    pageEncoding="UTF-8"%>
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
                <a href="employeehome.jsp">Home</a>
                <a href="employeehome.jsp#services">Services</a>
                <a href="employeeprofile.jsp">Profile</a>
                <a id="logout-link" onClick="logout()">Logout</a>
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
            <% Employee e=(Employee)session.getAttribute("employee"); %>
       
            <p class="text-30 fw-500 mb-2"> <h1>Hello, <%= e.getEmployeeFirstName() %> (<%= e.getEmployeeId() %>)</h1></p>
            <p class="mb-2"><a href="settings-profile.html" class="text-5 text-light" data-bs-toggle="tooltip" title="" data-bs-original-title="Edit Profile" aria-label="Edit Profile"><i class="fas fa-edit"></i></a></p>
          </div>
          <!-- Profile Details End --> 
          
          <!-- Available Balance
          =============================== -->
         
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
              <p class="col-sm-9 text-20"> <%= e.getEmployeeFirstName() %></p>
            </div>
            
            <div class="row gx-3 align-items-baseline">
              <p class="col-sm-3 text-muted text-sm-end mb-0 mb-sm-3">Address:</p>
              
              <p class="col-sm-9 text-3"><%=e.getEmployeeAddress() %></p>
            </div>
            <div class="row gx-3 align-items-baseline">
              <p class="col-sm-3 text-muted text-sm-end mb-0 mb-sm-3">Phone Number:</p>
              <p class="col-sm-9 text-3"><%= e.getEmployeePhone() %></p>
            </div>
            
            <div class="row gx-3 align-items-baseline">
              <p class="col-sm-3 text-muted text-sm-end mb-0 mb-sm-3">Email:</p>
              <p class="col-sm-9 text-3"><%= e.getEmployeeEmail() %></p>
            </div>
            
          </div>
          
          

        <!-- Middle Panel End --> 
      </div>
    </div>
  </div>    

</body>
</html>