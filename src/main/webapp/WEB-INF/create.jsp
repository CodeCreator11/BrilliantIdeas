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
    <title>Create your idea !!!</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/js/app.js"></script><!-- change to match your file/naming structure -->   
</head>
<body  background="https://wallpapercave.com/wp/chyFcK4.jpg" style="font-family: monospace; background-size: cover;">
    <div class="container">
        <h1 class="display-4 my-3">Let's create the next million dollar idea</h1>
        <a href="/dashboard">Back to Dashboard</a>
        <div class="d-flex justify-content-end my-1">
            <a href="/logout">Log Out</a>
        </div>
        <div class="d-flex justify-content-end my-1">
        </div>
        <div class="d-flex justify-content-between my-5">
            <h3 class="display-6 my-5">What do you have in mind ${user.firstName}?</h3>
            <!-- <img src="https://heroku-blog-files.s3.amazonaws.com/posts/1562626183-heroku-blog-duke.png" alt="java img"> -->
        </div>
        <div class="card shadow">
            <div class="card-body">
                <form:form action="/ideas" modelAttribute="idea" method="POST">
                    <div class="mb-3">
                    <form:input path="content" class="form-control" type="text"/>
                    <form:errors path="content" class="form-text text-warning"/>
                </div>
                <div class="mb-3">
                    <form:errors path="user" class="error"/>
                    <form:input type="hidden" path="user" value="${user.id}"/>
                </div>
                <div class="text-end">
                    <button type="submit" class="btn btn-success" style="    background: #56ab2f;  /* fallback for old browsers */
                    background: -webkit-linear-gradient(to right, #a8e063, #56ab2f);  /* Chrome 10-25, Safari 5.1-6 */
                    background: linear-gradient(to right, #a8e063, #56ab2f); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
                    color: #fff;
                    ">Proceed</button>
                </div>
                </form:form>
            </div>
        </div>
        <h3 class="display 3 my-5">Here are some ideas...</h3>
        <div>
            <c:forEach var="idea" items="${ideas}">
            <p> @<a href="/ideas/${idea.user.id}"><c:out value="${idea.user.aka}"/></a></p>
            <div class="d-flex flex-column mb-3">
                <div class="card shadow">
                    <c:out value="${idea.content}"/>
                </div>
                <div>
                    <c:if test="${userId==idea.user.id}">
                            <a href="/ideas/${idea.id}/edit" class="btn btn-info" style="    background: #56ab2f;  /* fallback for old browsers */
                            background: -webkit-linear-gradient(to right, #a8e063, #56ab2f);  /* Chrome 10-25, Safari 5.1-6 */
                            background: linear-gradient(to right, #a8e063, #56ab2f); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
                            color: #fff;
                            ">Edit</a>
                        </form>
                    </c:if>
                </div>
            </div>
            </c:forEach>
        </div>
    </div>
</body>
</html>