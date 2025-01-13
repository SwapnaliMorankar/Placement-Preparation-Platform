<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register Here</title>
<%@include file="./base.jsp"%>
<style>
    body {
        background: linear-gradient(135deg, #8fcce7, #ffb3d9);
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
        font-family: Arial, sans-serif;
    }
    .signup-container {
        margin-top: 80px;
        background-color: #fff;
        padding: 40px;
        border-radius: 5px;
        box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
        width: 100%;
        max-width: 600px;
        position: relative;
        overflow: hidden;
    }
    .signup-container::before {
        content: '';
        position: absolute;
        width: 200%;
        height: 200%;
        top: -50%;
        left: -50%;
        background: linear-gradient(45deg, #2697c8, #ff24b3, #2697c8); /* Updated gradient */
        animation: rotate 12s linear infinite;
        z-index: -1;
        filter: blur(20px);
    }
    @keyframes rotate {
        0% { transform: rotate(0); }
        100% { transform: rotate(360deg); }
    }
    .signup-container h2 {
        margin-bottom: 30px;
        font-weight: 700;
        color: #333;
        text-align: center;
    }
    .form-control {
        margin-bottom: 20px;
        padding: 15px;
        border-radius: 10px;
        border: none;
        background: #f0f2f5;
        font-size: 14px;
    }
    .btn-primary {
        width: 100%;
        padding: 12px;
        font-size: 18px;
        border-radius: 10px;
        background-color:#2697c8;
        border: none;
        transition: background 0.3s;
        margin-top: 20px; /* Added margin-top to the button */
    }
    .btn-primary:hover {
         background-color:#ff24b3;
    }
    .login-link {
        text-align: center;
        margin-top: 20px;
    }
    .login-link a {
        text-decoration: none;
        color: #2697c8; 
        font-weight: bold;
    }
    .login-link a:hover {
        color: #ff24b3; 
    }
    .error-message {
        color: red;
        font-size: 14px;
        margin-top: -15px;
        margin-bottom: 15px;
    }
</style>

<!-- JavaScript for Validation -->
<script>
    function validateForm(event) {
        event.preventDefault(); // Prevent form submission
        var password = document.getElementById('password').value;
        var confirmPassword = document.getElementById('confirmPassword').value;
        var passwordError = document.getElementById('passwordError');
        var confirmPasswordError = document.getElementById('confirmPasswordError');
        
        // Regular expression for strong password
        var strongPasswordPattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
        
        passwordError.textContent = '';
        confirmPasswordError.textContent = '';
        
        // Validate password strength
        if (!strongPasswordPattern.test(password)) {
            passwordError.textContent = 'Password must be at least 8 characters long, include an uppercase letter, a number, and a special character.';
            return false;
        }
        
        // Validate confirm password
        if (password !== confirmPassword) {
            confirmPasswordError.textContent = 'Passwords do not match.';
            return false;
        }
        
        // If validation passes, submit the form
        alert('Form submitted successfully!');
        document.getElementById('signupForm').submit();
    }
</script>

</head>
<body>

    <!-- Sign-Up Container -->
    <div class="signup-container">
        <h2>Create Your Account</h2>
        <form id="signupForm" action="register_student" method="post" onsubmit="validateForm(event)">
            <input type="text" id="name" name="name" class="form-control" placeholder="Name of Student" required>
            <input type="email" id="email" name="email" class="form-control" placeholder="Email" required>
            <input type="tel" id="contact" name="contact" class="form-control" placeholder="Contact No" required>
            <input type="text" id="address" name="address" class="form-control" placeholder="Address" required>
            <select id="course" name="course" class="form-control" required>
                <option value="" disabled selected>Course</option>
                <option >Python Programming</option>
                <option >Data Analytics</option>
                <option >Machine Learning</option>
                <option>Full Stack Java Development</option>
                <option >Data Science</option>
                <option >Power BI</option>
                <option>MySQL</option>
                <option>Statistics</option>
            </select>
            <input type="password" id="password" name="password" class="form-control" placeholder="Password" required>
            <div class="error-message" id="passwordError"></div>
            <input type="password" id="confirmPassword" name="confirmpassword" class="form-control" placeholder="Confirm Password" required>
            <div class="error-message" id="confirmPasswordError"></div>
            <button type="submit" class="btn btn-primary">Sign Up</button>
        </form>
        <div class="login-link">
            <p>Already have an account? <a href="${pageContext.request.contextPath}/login">Login Here</a></p>
        </div>
    </div>
   
</body>
</html>
