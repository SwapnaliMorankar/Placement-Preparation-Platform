<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${course.coursename} Course</title>
    <%@ include file="./base.jsp" %>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdf.js/2.10.377/pdf.min.js"></script>
    <style>
        body {
            background-color: #f8f9fa;
            font-family: Arial, sans-serif;
        }
        .container {
            margin-top: 50px;
        }
        h2 {
            color: #2697c8;
            margin-bottom: 20px;
        }
        h4 {
            margin-top: 30px;
            color: #343a40;
        }
        p {
            font-size: 1.1em;
            line-height: 1.6em;
        }
        table {
            margin-top: 20px;
        }
        .navbar {
            justify-content: center;
            padding-left: 80px;
            padding-right: 80px;
        }
        .navbar1 {
            background-color: #d1e8f2;
        }
        .navbar-nav {
            display: flex;
            flex-direction: row;
            gap: 15px;
            font-size: 17px;
        }
        .container-fluid {
            display: flex;
            justify-content: center;
            align-items: center;
            width: 80%;
            margin: 0 auto;
        }
        
    </style>
</head>
<body>

<nav class="navbar navbar-light navbar1">
        <div class="container-fluid">
            <a class="navbar-brand" href="${pageContext.request.contextPath}/">
                <img src="https://media.licdn.com/dms/image/v2/D560BAQEL3YUVXl2sQg/company-logo_200_200/company-logo_200_200/0/1687249403496?e=2147483647&v=beta&t=hPUn8nPZI72bKfEP34a7HskNtcXMcmn_C85TqokPtnI"
                    alt="Two Dimensions" width="50" height="50" class="d-inline-block align-text-top">
            </a>
            <!-- Centered navigation links -->
            <ul class="navbar-nav d-flex flex-row justify-content-center me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/admindashboard">Dashboard</a>
                </li>
            </ul>
            <form class="d-flex" action="${pageContext.request.contextPath}/login" method="post">
                <button class="btn btn-outline-success" type="submit">Logout</button>
            </form>
        </div>
    </nav>

<div class="container">
    <h2 class="text-center">Welcome to ${course.coursename} Course</h2>

    <div class="pdf-section">
        <h4>Modules in ${course.coursename} Course</h4>
        
        <form action="${pageContext.request.contextPath}/addmodule/${course.courseID}" method="get">
            <button class="btn btn-success"> Add New Module </button> 
        </form>
        
        <table class="table table-striped table-bordered">
            <thead>
                <tr>
                    <th scope="col">Module ID</th>
                    <th scope="col">Module Name</th>
                    <th scope="col">Module PDF</th>
                    <th scope="col">Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${modules}" var="module">
                    <tr>
                        <th scope="row">${module.moduleID}</th>
                        <td>${module.moduleName}</td>
                        <td>
                            <form style="display:inline;" action="${pageContext.request.contextPath}/viewPDF/${module.moduleID}" 
                            method="GET" target="_blank">
                                <button type="submit" class="btn btn-primary">View PDF</button>
                            </form>                    
                        </td>
                        <td>
                            <form style="display:inline;" action="${pageContext.request.contextPath}/delete_module/${module.moduleID}" method="GET">
                                <button type="submit" class="btn btn-danger">Delete</button>
                            </form>
                            <form style="display:inline;" action="${pageContext.request.contextPath}/update_module/${module.moduleID}" method="GET">
                                <button type="submit" class="btn btn-warning">Update</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>

</body>
</html>
