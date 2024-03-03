<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. --> 
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!-- Formatting (dates) --> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html lang="en" data-bs-theme="dark">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Idea</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/js/app.js"></script><!-- change to match your file/naming structure -->   
</head>
<body background="https://w0.peakpx.com/wallpaper/873/164/HD-wallpaper-error-amoled-thumbnail.jpg">
    <div class="container">
        <a href="/dashboard">Back to Dashboard</a>
        <div class="d-flex justify-content-end my-1">
            <a href="/logout">Log Out</a>
        </div>
        <div class="d-flex justify-content-end my-1">
        </div>
        <div class="d-flex justify-content-between my-5">
            <h3 class="display-4 my-5">Do you want to change something on your idea?</h3>
<!--  -->
        </div>
        <div class="card shadow my-3">
            <div class="card-body my-2">
                <form:form action="/ideas/${idea.id}" modelAttribute="idea" >
                    <input type="hidden" name="_method" value="PUT"/>
                    <div class="mb-3">
                        <form:input path="content" class="form-control" type="text"/>
                        <form:errors path="content" class="form-text text-warning"/>
                    </div>
                    <div class="text-end">
                        <button button type="submit" class="btn btn-light">Proceed</button>
                    </div>
                </form:form>
            </div>
        </div>
                <div>
                    <div class="d-flex justify-content-between my-2">
                        <c:if test="${userId==idea.user.id}">
                            <form action="/ideas/${idea.id}" method="POST">
                                <input type="hidden" name="_method" value="delete"/>
                                <input class="btn btn-danger"  type="submit" value="Delete"/>
                            </form>
                        </c:if>
                        <a href="/create" class="btn btn-info">Cancel</a>
                    </div>
                </div>
                <!-- <div class="text-center my-5">
                    <img src="https://heroku-blog-files.s3.amazonaws.com/posts/1562626183-heroku-blog-duke.png" alt="java img" style="border-radius: 50%;">
                </div> -->
            </div>
        </div>
    </div>
</body>
</html>









