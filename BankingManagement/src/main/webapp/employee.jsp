<%@ page language="java"  pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>ABC Bank - Employee Portal</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width" />
    <link rel="stylesheet" href="css/main.css" />
    <link rel="stylesheet" href="css/navigation.css" />
    <link rel="stylesheet" href="css/employee.css" />
	 <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
  	
  </head>
  <body>
    <nav>
      <div class="nav-content">
        <div class="logo">ABC Bank - Employee Portal</div>
        <div class="nav-links">
          <a href="index.jsp">Home</a>
	  <a href="#about" >About</a>
	  <a href="#contact">Contact</a>
	  <a href="#faq">FAQ</a>
        </div>
      </div>
    </nav>
    
    <main>
      

          <div class="auth-section">
            <div class="auth-container">
              <div class="auth-tabs">
                <button class="auth-tab active" data-tab="login">Login</button>
                <button class="auth-tab" data-tab="register">Register</button>
              </div>

              <!-- Login Form -->
              <form id="loginForm" class="auth-form active" onSubmit = "Login(event)">
                <h2>Employee Login</h2>
                <div class="form-group">
                  <label for="employeeId">Employee ID</label>
                  <input type="text" id="employeeId" name="employeeId" required>
                </div>
                <div class="form-group">
                  <label for="loginPassword">Password</label>
                  <input type="password" id="loginPassword" name="password" required>
                </div>
                <input type="submit" class="auth-button" value = "login">
                <div class="form-footer">
                  <a href="/forgot-password">Forgot Password?</a>
                </div>
              </form>

              <!-- Registration Form -->
              <form id="registerForm" class="auth-form" onSubmit = "registerEmployee(event)">
                <h2>Employee Registration</h2>
                <div class="form-group">
                  <label for="firstName">First Name</label>
                  <input type="text" id="firstName" name="firstName" required>
                </div>
                <div class="form-group">
                  <label for="lastName">Last Name</label>
                  <input type="text" id="lastName" name="lastName" required>
                </div>
                <div class="form-group">
                  <label for="email">Email</label>
                  <input type="email" id="email" name="email" required>
                </div>
                <div class="form-group">
                  <label for="phone">Phone Number</label>
                  <input type="tel" id="phone" name="phone" required>
                </div>
		<div class="form-group">
                  <label for="address">Address</label>
                  <input type="text" id="address" name="address" required>
                </div>
                <div class="form-group">
                  <label for="registerPassword">Password</label>
                  <input type="password" id="registerPassword" name="password" required>
                </div>
                <div class="form-group">
                  <label for="confirmPassword">Confirm Password</label>
                  <input type="password" id="confirmPassword" name="confirmPassword" required>
                </div>
                <input type="submit" class="auth-button" value = "Register">
              </form>
            </div>
          </div>
        </div>
      </div>
    </main>
    <script  src="js/auth.js"></script>
    <script src="js/employeelogin.js"></script>
  </body>
</html>