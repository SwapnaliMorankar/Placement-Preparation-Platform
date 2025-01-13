<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${course.coursename} Course Page</title>
    <%@ include file="./base.jsp" %>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdf.js/2.11.338/pdf.min.js"></script>
    <!-- Custom styles -->
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
        .pdf-section {
            background-color: #e9ecef;
            padding: 20px;
            border-radius: 5px;
            margin-top: 20px;
        }
        .pdf-section h4 {
            color: purple;
        }
        .newcard h4 {
            color: #ff24b3;
        }
        #pdfViewer {
            margin-top: 20px;
            border: 1px solid #ccc;
            padding: 10px;
            background-color: #ffffff;
            border-radius: 5px;
            max-height: 600px;
            overflow-y: auto;
            overflow-x: hidden;
            width: 80%;
            margin-left: auto;
            margin-right: auto;
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
                    <a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/studentdashboard">Courses</a>
                </li>
            </ul>
            <form class="d-flex" action="${pageContext.request.contextPath}/login" method="post">
                <button class="btn btn-outline-success" type="submit">Logout</button>
            </form>
        </div>
    </nav>

    <div class="container">
        <h2 class="text-center">Welcome to ${course.coursename} Course</h2>

        <div class="card mt-4">
            <div class="card-body newcard">
                <h4>Course Description</h4>
                <p>${course.description}</p>
            </div>
        </div>

        <div class="pdf-section">
            <h4>Modules in ${course.coursename} Course</h4>

            <table class="table table-striped table-bordered">
                <thead>
                    <tr>
                        <th scope="col">Module ID</th>
                        <th scope="col">Module Name</th>
                        <th scope="col">Module Description</th>
                        <th scope="col">Module PDF</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${modules}" var="module">
					    <tr>
					        <th scope="row">${module.moduleID}</th>
					        <td>${module.moduleName}</td>
					        <td>${module.moduleDescription}</td>
					        <td>
					            <form style="display:inline;" action="${pageContext.request.contextPath}/viewPDF/${module.moduleID}" 
                            method="GET" target="_blank">
                                <button type="submit" class="btn btn-primary">View PDF</button>
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
