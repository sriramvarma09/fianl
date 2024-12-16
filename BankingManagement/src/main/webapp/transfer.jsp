<%@ page language="java"  pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="css/transaction.css">
<link rel="stylesheet" href="css/navigation.css">
<script src="js/customerhome.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>

</head>
<body>
<nav>
        <div class="nav-content">
            <div class="logo">ABC Bank</div>
            <div class="nav-links">
                <a href="customerhome.jsp">Home</a>
                <a href="customerhome.jsp#services">Services</a>
                <a href="profile.html">Profile</a>
                <a id="logout-link" onClick="logout()">Logout</a>
            </div>
        </div>
    </nav>

	<div id="content" class="py-4">
    <div class="container"> 
      
      <!-- Steps Progress bar -->
      
      <h2 class="fw-400 text-center mt-3">Send Money</h2>
      <p class="lead text-center mb-4">Send your money on anytime, anywhere in the world.</p>
      <div class="row">
        <div class="col-md-9 col-lg-7 col-xl-6 mx-auto">
          <div class="bg-white shadow-sm rounded p-3 pt-sm-4 pb-sm-5 px-sm-5 mb-4">
            <h3 class="text-5 fw-400 mb-3 mb-sm-4">Personal Details</h3>
            <hr class="mx-n3 mx-sm-n5 mb-4">
            <!-- Send Money Form
            ============================ -->
            <form id="form-send-money" method="post" onSubmit="event.preventDefault(); transferFunds(event)">
            	<div class="mb-3">
                <label for="senderAccountNumber" class="form-label">Sender Account Number</label>
                <input type="number" value="" class="form-control"  id="fromAccount" required placeholder="Enter Account Number">
              </div>
				<div class="mb-3">
					<label for="ReciverAccountNumber" class="form-label">Recipient Account Number</label>
					<input type="number" value="" class="form-control" data-bv-field="emailid" id="toAccount" required
						placeholder="Enter Account Number">
              </div>
              <div class="mb-3">
                <label for="youSend" class="form-label">You Send</label>
                <div class="input-group">
                  <span class="input-group-text">Rs.</span>
                  <input type="number" class="form-control" data-bv-field="youSend" id="amount" value="1000" placeholder="">
                  
                </div>
              </div>
              <div class="d-grid"><input type="submit" value="submit" class="btn btn-primary"></div>
            </form>
            <!-- Send Money Form end --> 
          </div>
        </div>
      </div>
    </div>
  </div>

</body>
</html>