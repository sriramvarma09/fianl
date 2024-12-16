<%@ page language="java"  pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Customer</title>
<link rel="stylesheet" href="css/main.css" />
	<meta name="viewport" content="width=device-width">
    <link rel="stylesheet" href="css/navigation.css" />
    <link rel="stylesheet" href="css/employee.css" />
	<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
	<link href="css/newcustomercreation.css" rel="stylesheet" media="all">

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


    <form onSubmit="senddate(event)" method="POST">
      <div class="formbold-form-title">
        <h2 class="">Update now</h2>
        <p>
         Aadhar Number,Pan Number and Email must be unique
        </p>
      </div>
      
      <div class="formbold-input-flex">
        <div>
          <label for="ssnid" class="formbold-form-label">
            SSNId
          </label>
          <input
            type="text"
            name="ssnid"
            id="ssnid"
            class="formbold-form-input"
          />
        </div>
      </div>
      <button class="formbold-btn" onClick="senddata()">Populate</button>
      <script>
      		function senddata(){
      			event.preventDefault();
      			console.log($("#ssnid").val());
      			$.ajax({
      				url:"GetEmployee",
      				type:"post",
      				data:{SSNId:$("#ssnid").val()},
      				success: function (data) {
      					console.log(data);
      					data=JSON.parse(data);
      					console.log(typeof(data));
      					if(data == null) {
								alert("No employee found");
								window.location.href = "updateemployee.html";
							}
      					console.log(data)
      						console.log(data.customerName)
							$("#Name").val(data.customerName)
							$("#email").val(data.customerEmail)
							$("#phone").val(data.customerPhone)
							$("#address").val(data.customerAddress)
						}
      				
      			});
      			
      			
      		}
      
      </script>
      
      
      
      
      

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

      

      

      

      

      <button class="formbold-btn" onClick="update(event)">Update</button>
      
      <script>
      		function update(event) {
					event.preventDefault();
					console.log($("#ssnid").val());
					$.ajax({
						url: "UpdateCustomer",
						type: "post",
						data: {SSNId: $("#ssnid").val(),customerId:$("#ssnid").val(), customerName: $("#Name").val(), customerEmail: $("#email").val(), customerPhone: $("#phone").val(), customerAddress: $("#address").val()},
						success: function (data) {
							console.log(data);
							alert(data);
							window.location.href = "employeehome.jsp";
							
							},
						error: function (data) {
							console.log(data);
							alert("Error");
						}
					});
      		}
      </script>
      
      
    </form>
  </div>
</div>

</body>
</html>