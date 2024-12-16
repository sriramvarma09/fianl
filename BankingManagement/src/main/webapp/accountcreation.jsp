<%@ page language="java"  pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width">
<link rel="stylesheet" href="css/newcustomercreation.css" />
<link rel="stylesheet" href="css/navigation.css" />
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<script src="js/newcustomercreation.js"></script>
</head>
<body onload="validateLogin(accountcreation.jsp)">
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
		<div class="formbold-main-wrapper">
  
  <div class="formbold-form-wrapper">

	<form onSubmit="registerCustomerexist(event)" method="POST">
      <div class="formbold-form-title">
        <h2 class="">Register now</h2>
        <p>
        Use Customer SSNID
        </p>
      </div>

      <div class="formbold-input-flex">
        <div>
          <label for="Name" class="formbold-form-label">
            SSNID
          </label>
          <input
            type="number"
            name="ssnid"
            id="ssnid"
            class="formbold-form-input"
          />
        </div>
      </div>

      <div class="formbold-input-flex">
        <div>
          <label for="area" class="formbold-form-label"> Initial Balance </label>
          <input
            type="number"
            name="balance"
            id="balance"
            class="formbold-form-input"
          />
        </div>
        <div class="formbold-input-flex">
        <div>
          <label for="accountType" class="formbold-form-label">Account Type</label>

					<select name="accountType" id="accountType"  class="formbold-form-input">
  							<option value="Savings"  class="formbold-form-input">Savings</option>
  							<option value="Current"  class="formbold-form-input">Current</option>
					</select>	
        </div>
        
      </div>
      
      </div>
      <input type="submit" class="formbold-btn" value="Register">
     </form>
     </div>
     </div>
</body>
</html>