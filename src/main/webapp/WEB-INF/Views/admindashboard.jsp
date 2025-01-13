<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>
<%@include file="./base.jsp"%>
<style>
    .dashboard-container {
        width: 80%;
        margin: 30px auto;
        padding: 20px;
        background-color: #e9ecef;
        border-radius: 10px;
        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
    }
    .dashboard-header {
        text-align: center;
        margin-bottom: 40px;
    }
    .card {
        margin-bottom: 20px;
        border-radius: 10px;
    }
    .card-header {
        font-size: 1.2rem;
        font-weight: bold;
        background-color: #2697c8 !important;
        color: white;
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 10px 15px;
    }
    .card-header button {
        background-color: #ff589e;
        margin-left: auto; 
        color:white;
    }
    .card-body {
        display: none;
        text-align: center; 
    }
    .btn-custom {
        margin-top: 10px;
        width: 15%;
    }
    .btn-custom-center {
        display: block;
        margin: 10px auto; 
    }
    .btn-add-course {
        margin-top: 20px;
    }
    .btn-custom-pink { 
    color: white;               
    border: none;
    padding: 8px 12px;
    border-radius: 5px;
    cursor: pointer;
    margin-right: 5px;
    display: inline-block;
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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

<div class="dashboard-container">
    <div class="dashboard-header">
        <h1>Welcome Admin</h1>
    </div>

<!-- Card for Students -->
<div class="card">
    <div class="card-header">
        <span>Number of Students: <span id="studentCount">${studentcount }</span></span>
        <button class="btn btn-custom-pink" id="toggleStudentsBtn">View All Students</button>
    </div>
    <div class="card-body" id="studentList">
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th scope="col">Student ID</th>
                    <th scope="col">Student Name</th>
                    <th scope="col">Course</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${students}" var="student">
                    <tr>
                        <th scope="row">${student.id }</th>
                        <td>${student.name }</td>
                        <td>${student.course }</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <button class="btn btn-secondary btn-custom btn-custom-center" id="hideStudentsBtn">Read Less</button>
    </div>
</div>

<!-- Card for Courses -->
<div class="card">
    <div class="card-header">
        <span>Number of Courses Uploaded: <span id="courseCount">${coursecount }</span></span>
        <button class="btn btn-custom-pink" id="toggleCoursesBtn">View All Courses</button>
    </div>
    <div class="card-body" id="courseList">
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th scope="col">Course ID</th>
                    <th scope="col">Course Name</th>
                    <th scope="col">Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${courses}" var="course">
                    <tr>
                        <th scope="row">${course.courseID }</th>
                        <td>${course.coursename }</td>
                        <td>
			                <form style="display:inline;" action="delete_course/${course.courseID }" method="GET">
			                    <button type="submit" class="btn btn-danger">Delete</button>
			                </form>
			                <form style="display:inline;" action="update_course/${course.courseID }" method="GET">
			                    <button type="submit" class="btn btn-warning">Update</button>
			                </form>
			                <form style="display:inline;" action="course_module/${course.courseID }" method="GET">
			                    <button type="submit" class="btn btn-success">View</button>
			                </form>
            			</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <button class="btn btn-secondary btn-custom btn-custom-center" id="hideCoursesBtn">Read Less</button>
    </div>
</div>


    <!-- Button to Add New Course -->
    <a href="${pageContext.request.contextPath}/addcourse">
    <button class="btn btn-success btn-add-course">Add New Course</button>
    </a>
</div>

<script>
    // jQuery for toggle functionality
    $(document).ready(function() {
        // Toggle students list
        $('#toggleStudentsBtn').click(function() {
            $('#studentList').slideToggle();
        });

        // Hide students list
        $('#hideStudentsBtn').click(function() {
            $('#studentList').slideUp();
        });

        // Toggle courses list
        $('#toggleCoursesBtn').click(function() {
            $('#courseList').slideToggle();
        });

        // Hide courses list
        $('#hideCoursesBtn').click(function() {
            $('#courseList').slideUp();
        });
    });
</script>
</body>
</html>
