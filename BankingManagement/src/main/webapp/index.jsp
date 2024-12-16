<%@ page language="java"  pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>ABC Bank - Your Trust, Our Foundation</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width" />
    <link rel="stylesheet" href="css/main.css" />
    <link rel="stylesheet" href="css/navigation.css" />
    <link rel="stylesheet" href="css/auth.css" />
    <script  src="js/index.js"></script>
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
  </head>
  <body>
    <nav>
      <div class="nav-content">
        <div class="logo">ABC Bank</div>
        <div class="nav-links">
          <a href="#hero">Home</a>
	  <a href="#about" >About</a>
	  <a href="#contact">Contact</a>
	  <a href="#faq">FAQ</a>
        </div>
      </div>
    </nav>
    
    <main>
      <div class="hero-section" id = "hero">
        <div class="content-wrapper">
          <div class="features-section">
            <h1>Welcome to ABC Bank</h1>
            <h2>Your Trust, Our Foundation</h2>
            <p>Experience banking excellence with our comprehensive financial solutions. We're committed to securing your financial future with innovative services and unwavering reliability.</p>
            <div class="features">
              <div class="feature">
                <h3>24/7 Banking</h3>
                <p>Access your accounts anytime, anywhere</p>
              </div>
              <div class="feature">
                <h3>Secure Banking</h3>
                <p>State-of-the-art security for your peace of mind</p>
              </div>
              <div class="feature">
                <h3>Personal Support</h3>
                <p>Dedicated team for your financial needs</p>
              </div>
            </div>
          </div>

          <div class="login-section">
            <div class="login-container">
              <h2>Login to Your Account</h2>
              <form class="login-form" method="post">
                <div class="form-group">
                  <label for="username">Username</label>
                  <input type="text" id="username" name="username" required>
                </div>
                <div class="form-group">
                  <label for="password">Password</label>
                  <input type="password" id="password" name="password" required>
                </div>
                <input type="submit"  value = "Login" class="login-button"/>
                <div class="login-footer">
                  <a href="/forgot-password">Forgot Password/Generate Password</a>
                  <a href="employee.jsp">Employee Portal</a>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
		    <!-- Features area -->
    <div class="features-area-home-2">
        <div class="feature-shape-1">
            <img src="img/bg-img/shape/10.png" alt="">
        </div>
        <div class="container">
            <div class="row">
                <!-- Single Card -->
                <div class="col-md-6 col-lg-4">
                    <div class="features-single-card">
                        <div class="features-icon">
                            <i class="icon-icon_lock_alt"></i>
                        </div>
                        <h3>Secure Worldwide Transfers</h3>
                        <p>Proin efficitur, mauris vel condimentum pulvinar, velit orci consectetur ligula, eget egestas
                            magna mi ut arcu.</p>
                        <!-- Shape -->
                        <div class="fea-icon-shape">
                            <i class="icon-icon_lock_alt"></i>
                        </div>
                    </div>
                </div>

                <!-- Single Card -->
                <div class="col-md-6 col-lg-4">
                    <div class="features-single-card">
                        <div class="features-icon">
                            <i class="icon-icon_headphones"></i>
                        </div>
                        <h3>Super Worldwide Support</h3>
                        <p>Proin efficitur, mauris vel condimentum pulvinar, velit orci consectetur ligula, eget egestas
                            magna mi ut arcu.</p>
                        <!-- Shape -->
                        <div class="fea-icon-shape">
                            <i class="icon-icon_headphones"></i>
                        </div>
                    </div>
                </div>

                <!-- Single Card -->
                <div class="col-md-6 col-lg-4">
                    <div class="features-single-card">
                        <div class="features-icon">
                            <i class="icon-icon_percent"></i>
                        </div>
                        <h3>Expedited Loan Approvals</h3>
                        <p>Proin efficitur, mauris vel condimentum pulvinar, velit orci consectetur ligula, eget egestas
                            magna mi ut arcu.</p>
                        <!-- Shape -->
                        <div class="fea-icon-shape">
                            <i class="icon-icon_percent"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Features area -->
		    <!-- About area -->
      <section id="about" class="section">
        <h2>About Us</h2>
        <p>ABC Bank, headquartered in Hyderabad, has been a cornerstone of financial growth and trust since its inception. With a legacy of excellence, we aim to provide cutting-edge banking solutions tailored to the needs of individuals, businesses, and communities. Our commitment to innovation, integrity, and customer satisfaction drives us to help you achieve your financial aspirations.</p>
      </section>

      <section id="contact" class="section">
        <h2>Contact Us</h2>
        <div class="contact-info">
          <div>
            <h3>Head Office</h3>
            <p>ABC Bank, Main Branch,<br>
            Jubilee Hills, Hyderabad,<br>
            Telangana, 500033</p>
          </div>
          <div>
            <h3>Contact Details</h3>
            <p>Phone: +91 40-1234-5678<br>
            Email: support@abcbank.com<br>
            Working Hours: Monday to Saturday, 9:00 AM to 5:00 PM</p>
          </div>
        </div>
      </section>

      <section id="faq" class="section">
        <h2>Frequently Asked Questions</h2>
        <div class="faq-item">
          <h3>How can I open an account with ABC Bank?</h3>
          <p>You can open an account by visiting any of our branches with valid ID proof, address proof, and a passport-sized photograph. Alternatively, you can apply online through our website.</p>
        </div>
        <div class="faq-item">
          <h3>What services does ABC Bank offer?</h3>
          <p>ABC Bank offers savings accounts, current accounts, fixed deposits, loans, credit cards, digital banking, and investment services.</p>
        </div>
        <div class="faq-item">
          <h3>How can I contact customer support?</h3>
          <p>You can reach our customer support team at +91 40-1234-5678 or email us at support@abcbank.com.</p>
        </div>
        <div class="faq-item">
          <h3>Does ABC Bank offer mobile banking?</h3>
          <p>Yes, we provide a user-friendly mobile app for seamless banking services like fund transfers, bill payments, and account management.</p>
        </div>
        <div class="faq-item">
          <h3>Where can I find ABC Bank's branches and ATMs?</h3>
          <p>You can locate our branches and ATMs through the branch/ATM locator on our website or mobile app.</p>
        </div>
      </section>
    </main>
  </body>
</html>