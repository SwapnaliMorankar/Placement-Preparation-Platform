<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add New Course</title>
    <%@include file="./base.jsp"%>
    <style>
        body {
            background-color: #f8f9fa; 
        }

        .form-container {
            max-width: 600px;
            margin: 50px auto;
            padding: 20px 30px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);
        }

        .form-header {
            text-align: center;
            margin-bottom: 30px;
            color: #2697c8;
        }

        .form-header h2 {
            font-size: 2rem;
            font-weight: bold;
        }

        .form-group label {
            font-weight: 600;
            margin-top:20px;
        }
        
         .form-group input, textarea {
           margin-top:7px;
        }

        .btn-submit {
            background-color: #ff589e; 
            color: white;
            font-weight: bold;
            width: 100%;
            margin-top:20px;
        }

        .btn-submit:hover {
            background-color: #e0477a; 
        }

        .custom-file-label::after {
            content: "Browse";
        }
    </style>
</head>
<body>
    <div class="form-container">
        <div class="form-header">
            <h2>Update Course</h2>
        </div>
        <form action="${pageContext.request.contextPath}/courseupdated" method="POST">
            <!-- Course ID -->
            <div class="form-group">
                <label for="courseId">Course ID</label>
                <input type="text" class="form-control" id="courseId" name="courseID"
                 value=${course.courseID } required>
            </div>

            <!-- Course Name -->
            <div class="form-group">
                <label for="courseName">Course Name</label>
                <input type="text" class="form-control" id="coursename" name="coursename" 
                 value=${course.coursename } required>
            </div>

            <!-- Course Description -->
            <div class="form-group">
                <label for="courseDescription">Course Description</label>
                <textarea class="form-control" id="courseDescription" rows="4" name="description"
                 required>${course.description }</textarea>
            </div>

            <!-- Course Image -->
            <div class="form-group">
                <label for="courseImage">Course Image</label>
                <div class="custom-file">
                    <input type="file" class="custom-file-input" id="courseImage" name="image" accept="image/*" >
                    
                </div>
            </div>

            <!-- Submit Button -->
            <button type="submit" class="btn btn-submit">Update Course</button>
        </form>
    </div>

    <script>
        // Display selected file name for the file input
        $('.custom-file-input').on('change', function() {
            let fileName = $(this).val().split('\\').pop();
            $(this).next('.custom-file-label').html(fileName);
        });
    </script>
</body>
</html>
