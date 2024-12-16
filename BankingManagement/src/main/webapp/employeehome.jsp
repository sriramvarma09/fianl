<%@ page language="java" import="java.util.*, models.Customer, models.Employee, services.CustomerService, services.AccountService" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ABC Bank - Employee Portal</title>
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/navigation.css">
    <link rel="stylesheet" href="css/customer.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
    <!-- Navigation Bar -->
    <nav>
        <div class="nav-content">
            <div class="logo">ABC Bank</div>
            <div class="nav-links">
                <a href="employeehome.jsp">Home</a>
                <a href="#services">Services</a>
                <a href="employeeprofile.jsp">Profile</a>
                <a id="logout-link" onClick="logout()">Logout</a>
            </div>
        </div>
    </nav>

    <!-- Main Container -->
    <main>
        <div class="hero-section">
            <div class="content-wrapper">
				<% Employee e=(Employee)session.getAttribute("employee"); %>
                <div class="content">
                    <!-- Default Message -->
            
                    	<div class= "message">
                    	<h1>Welcome, <%= e.getEmployeeFirstName() %> (<%= e.getEmployeeId() %>)</h1>
                        <p>Manage Customers</p>
                    	</div>
                        <div class= "s-img" >
							<img class="cs-img" src="assests/8953254.jpg" alt="">
						</div>
                
					
                    
                </div>
            </div>
        </div>
  
        
   <!-- Service area -->
    <div class="service-area-2" style="background-image: url(assests/service-bg.png);" id="services">
        <div class="container">
            <div class="section-title">
            <center>
                <h6>Banking Time</h6>
                <h2><span>Services by Bank</span></h2>
            </center>
            </div>
            <div class="row" style="display:flex;justify-content:center;">
         
                <div class="col-xl-3 col-lg-6 col-md-6">
                   <a href="newcustomercreation.jsp" style="text-decoration:none;color:#000;"> 
                   		<div class="service-single-card-2" >
                        <div class="service-icon">
                            <img src="assests/1.png" alt="">
                        </div>
                        <h4>Create an Account</h4>
                        <p>for new Customers</p>
                    </div></a>
                </div>
                <div class="col-xl-3 col-lg-6 col-md-6">
                	<a href="accountcreation.jsp" style="text-decoration:none;color:#000;">
                    <div class="service-single-card-2">
                        <div class="service-icon">
                            <img src="assests/2.png" alt="">
                        </div>
                        <h4>Create an Account</h4>
                        <p>foe existing Customers</p>
                    </div>
                    </a>
                </div>
                
                <div class="col-xl-3 col-lg-6 col-md-6">
                    <a href="employeetransaction.jsp" style="text-decoration:none;color:#000;">
                    <div class="service-single-card-2">
                        <div class="service-icon">
                            <img src="assests/3.png" alt="">
                        </div>
                        <h4>Transfer Funds</h4>
                        <p>Transfer amount from one bank account to another account </p>
                    </div>
                    </a>
                </div>
                <div class="col-xl-3 col-lg-6 col-md-6">
                   <a href="deposit.jsp" style="text-decoration:none;color:#000;"> 
                   		<div class="service-single-card-2" >
                        <div class="service-icon">
                            <img src="assests/1.png" alt="">
                        </div>
                        <h4>Deposit Money</h4>
                        <p>Deposit money into customers account</p>
                    </div></a>
                </div>
                <div class="col-xl-3 col-lg-6 col-md-6">
                   <a href="withdraw.jsp" style="text-decoration:none;color:#000;"> 
                   		<div class="service-single-card-2" >
                        <div class="service-icon">
                            <img src="assests/1.png" alt="">
                        </div>
                        <h4>Withdraw Money</h4>
                        <p>Withdraw amount from customers account</p>
                    </div></a>
                </div>
                <div class="col-xl-3 col-lg-6 col-md-6">
                   <a href="viewcustomers.jsp" style="text-decoration:none;color:#000;"> 
                   		<div class="service-single-card-2" >
                        <div class="service-icon">
                            <img src="assests/1.png" alt="">
                        </div>
                        <h4>View Customer Account</h4>
                        <p>View accounts related to the customers</p>
                    </div></a>
                </div>
                <div class="col-xl-3 col-lg-6 col-md-6">
                   <a href="updatecustomer.jsp" style="text-decoration:none;color:#000;"> 
                   		<div class="service-single-card-2" >
                        <div class="service-icon">
                            <img src="assests/1.png" alt="">
                        </div>
                        <h4>Update Customer Details</h4>
                        <p>Update Customer Details such as Email,Contact,Name,Address</p>
                    </div></a>
                </div>
                <div class="col-xl-3 col-lg-6 col-md-6">
                   <a href="viewallcustomers.jsp" style="text-decoration:none;color:#000;"> 
                   		<div class="service-single-card-2" >
                        <div class="service-icon">
                            <img src="assests/1.png" alt="">
                        </div>
                        <h4>View all Available Customers</h4>
                        <p>View all available bank customers</p>
                    </div></a>
                </div>
				
                
            </div>
        </div>
    </div>
    <!-- Service area -->
    
    
    
        
        
    </main>

    <script src="js/customerhome.js"></script>
</body>
</html>
