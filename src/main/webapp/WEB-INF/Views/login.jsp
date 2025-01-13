<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Here</title>
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
        .login-container {
            background-color: #ffffff;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 0 30px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 450px;
        }
        .login-container h2 {
            margin-bottom: 25px;
            font-weight: 600;
            color: #444;
            text-align: center;
        }
        .form-control {
            margin-bottom: 20px;
            padding: 12px;
            border-radius: 8px;
            border: 1px solid #dcdfe3;
            background: #f0f3f7;
            font-size: 15px;
            width: 100%;
            box-sizing: border-box;
            outline: none;
        }
        .form-control:focus {
            border-color: #2697c8;
        }
        .btn-primary {
            width: 100%;
            padding: 14px;
            font-size: 16px;
            border-radius: 8px;
            background-color: #2697c8;
            color: #ffffff;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.2s;
        }
        .btn-primary:hover {
            background-color: #ff24b3 ;
            transform: translateY(-2px);
        }
        .signup-link {
            text-align: center;
            margin-top: 20px;
            font-size: 14px;
            color: #555;
        }
        .signup-link a {
            text-decoration: none;
            color: #2697c8;
            font-weight: bold;
            transition: color 0.3s;
        }
        .signup-link a:hover {
            color: #ff24b3 ;
        }
    </style>
</head>
<body>
    <!-- Login Container -->
    <div class="login-container">
        <h2>Login to Your Account</h2>
        <form action="login_form" method="post">
            <input type="email" class="form-control" name="email" placeholder="Email Address" required>
            <input type="password" class="form-control" name="password" placeholder="Password" required>
            <button type="submit" class="btn btn-primary">Login</button>
        </form>
        <div class="signup-link">
            <p>Don't have an account? <a href="${pageContext.request.contextPath}/register">Sign Up</a></p>
        </div>
    </div>
</body>
</html>
