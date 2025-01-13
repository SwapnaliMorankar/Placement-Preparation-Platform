<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Dashboard</title>
<%@include file="./base.jsp"%>

<style>
    .heading {
        margin-top: 30px;
    }
    .heading1 {
        margin-top: 30px;
        color: #ff24b3;
    }
    .maindiv {
        width: 90%;
        margin-left: 5%;
        margin-top: 30px;
        padding: 30px;
        height: auto;
        background-color: #d1e8f2;
        display: grid;
        grid-template-columns: repeat(4, 1fr);
        gap: 20px;
    }
    .card {
        width: 100%;
        border-radius: 15px;
    }
    .card img {
        height: 45%;
    }
    /* Style changes for the navbar */
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
        font-size:17px;
    }
    .container-fluid {
        display: flex;
        justify-content: center;
        align-items: center;
        width: 80%;
        margin: 0 auto;
    }
</style>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">

</head>
<body>

    <nav class="navbar navbar-light navbar1">
        <div class="container-fluid">
            <a class="navbar-brand" href="${pageContext.request.contextPath}/">
                <img src="https://media.licdn.com/dms/image/v2/D560BAQEL3YUVXl2sQg/company-logo_200_200/company-logo_200_200/0/1687249403496?e=2147483647&v=beta&t=hPUn8nPZI72bKfEP34a7HskNtcXMcmn_C85TqokPtnI"
					alt="Two Dimensions" width="50" height="50" 
                class="d-inline-block align-text-top">
            </a>
            <!-- Centered navigation links -->
            <ul class="navbar-nav d-flex flex-row justify-content-center me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/studentdashboard">Courses</a>
                </li>
            </ul>
            <form class="d-flex" action="${pageContext.request.contextPath}/login" method="post">
                <button class="btn btn-outline-success" type="submit">Logout</button>
            </form>
        </div>
    </nav>

    <div>
        <h1 class="text-center heading1">Welcome ${s.name }</h1>
        <h3 class="text-center heading">Explore various courses here</h3>
    </div>
    <div class="maindiv">
        <c:forEach var="course" items="${courses}">
            <div class="card" style="width: 18rem;">
                <img src="${pageContext.request.contextPath}/course/image/${course.courseID}" class="card-img-top" alt="${course.coursename}">
                <div class="card-body">
                    <h5 class="card-title">${course.coursename}</h5> 
                    <p class="card-text">${course.description}</p>
                    <a href="${pageContext.request.contextPath}/course/${course.courseID}" class="btn btn-primary">Go to Course</a>
                </div>
            </div>
        </c:forEach>
    </div>

</body>
</html>
