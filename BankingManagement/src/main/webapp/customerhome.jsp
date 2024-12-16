<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ABC Bank - Customer Portal</title>
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/navigation.css">
    <link rel="stylesheet" href="css/customer.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="js/customerhome.js"></script>
</head>
<body>
    <!-- Navigation Bar -->
    <nav>
        <div class="nav-content">
            <div class="logo">ABC Bank</div>
            <div class="nav-links">
                <a href="customerhome.jsp">Home</a>
                <a href="#services">Services</a>
                <a href="profile.jsp">Profile</a>
                <a onClick="logout()">Logout</a>
            </div>
        </div>
    </nav>

    <!-- Main Container -->
    <main>
        <div class="hero-section">
            <div class="content-wrapper">

                <div class="content">
                    <!-- Default Message -->
            
                    	<div class= "message">
                    	
                    	<h1 id="greeting">Welcome, <%= session.getAttribute("customerName")!= null? session.getAttribute("customerName") : "User"   %>
                    	 <h1>
                        <p>Manage your banking needs with ease and convenience.</p>
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
                <h2><span>Customer Services</span></h2>
            </center>
            </div>
            <div class="row" style="display:flex;justify-content:center;">
         
                
                <div class="col-xl-3 col-lg-6 col-md-6">
                	<a href="transfer.jsp" style="text-decoration:none;color:#000;">
                    <div class="service-single-card-2">
                        <div class="service-icon">
                            <img src="assests/2.png" alt="">
                        </div>
                        <h4>Transfer Funds</h4>
                        <p>Transfer your amount securely.</p>
                    </div>
                    </a>
                </div>
                <div class="col-xl-3 col-lg-6 col-md-6">
                    <a href="transaction.jsp" style="text-decoration:none;color:#000;">>
                    <div class="service-single-card-2">
                        <div class="service-icon">
                            <img src="assests/3.png" alt="">
                        </div>
                        <h4>View Statement</h4>
                        <p>View your Transaction history.</p>
                    </div>
                    </a>
                </div>
            </div>
        </div>
    </div>
    <!-- Service area -->
    
    
    
        
        
    </main>

    <script src="js/customerhome.js"></script>
</body>
</html>
