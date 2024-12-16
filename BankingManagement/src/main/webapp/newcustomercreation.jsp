<%@ page language="java"  pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Customer</title>
<link rel="stylesheet" href="css/main.css" />
	<meta name="viewport" content="width=device-width">
    <link rel="stylesheet" href="css/navigation.css" />
    <link rel="stylesheet" href="css/employee.css" />
	<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
	<link href="css/newcustomercreation.css" rel="stylesheet" media="all">
	<script src="js/newcustomercreation.js"></script>

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
		<div class="formbold-main-wrapper">
  
  <div class="formbold-form-wrapper">


    <form onSubmit="registerCustomer(event)" method="POST">
      <div class="formbold-form-title">
        <h2 class="">Register now</h2>
        <p>
         Aadhar Number,Pan Number and Email must be unique
        </p>
      </div>

      <div class="formbold-input-flex">
        <div>
          <label for="Name" class="formbold-form-label">
            Name
          </label>
          <input
            type="text"
            name="Name"
            id="Name"
            class="formbold-form-input"
          />
        </div>
      </div>

      <div class="formbold-input-flex">
        <div>
          <label for="email" class="formbold-form-label"> Email </label>
          <input
            type="email"
            name="email"
            id="email"
            class="formbold-form-input"
          />
        </div>
        <div>
          <label for="phone" class="formbold-form-label"> Phone number </label>
          <input
            type="text"
            name="phone"
            id="phone"
            class="formbold-form-input"
          />
        </div>
      </div>
      
      <div class="formbold-mb-3">
        <label for="address2" class="formbold-form-label">
          Aadhar Number
        </label>
        <input
          type="number"
          name="aadharnumber"
          id="aadharnumber"
          class="formbold-form-input"
        />
      </div>
      
      
      <div class="formbold-input-flex">
        <div>
          <label for="post" class="formbold-form-label"> Pan Number</label>
          <input
            type="text"
            name="pannumber"
            id="pannumber"
            class="formbold-form-input"
          />
        </div>
        <div>
          <label for="area" class="formbold-form-label"> Initial Balance </label>
          <input
            type="number"
            name="balance"
            id="balance"
            class="formbold-form-input"
          />
        </div>
      </div>
      

      <div class="formbold-mb-3">
        <label for="address" class="formbold-form-label">
          Address
        </label>
        <input
          type="text"
          name="address"
          id="address"
          class="formbold-form-input"
        />
      </div>

      

      <div class="formbold-input-flex">
        <div>
          <label for="accountType" class="formbold-form-label">Account Type</label>

					<select name="accountType" id="accountType"  class="formbold-form-input">
  							<option value="savings"  class="formbold-form-input">Savings</option>
  							<option value="Current"  class="formbold-form-input">Current</option>
					</select>	
        </div>
       
      </div>

      

      

      <input type="submit" class="formbold-btn" value="Register Now">
    </form>
  </div>
</div>

</body>
</html>