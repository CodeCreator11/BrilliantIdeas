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
    <title>View User</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/style.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/js/app.js"></script><!-- change to match your file/naming structure -->   
</head>
<body background="https://cutewallpaper.org/21/anonymous-wallpaper-hd/HD-Widescreen-PC-Anonymous-Wallpaper-Hd.jpg" style="background-size: cover;font-family: monospace;">
    <div class="container">
        <!-- <h1 class="display-2 my-3">Welcome ${user.firstName} !!!</h1> -->
        <a href="/create">Back to Java Ideas</a>
        <div class="d-flex justify-content-end">
            <a href="/logout">Log Out</a>
        </div>
        <h3 class="display-6 my-3">Do you want to talk more about this brilliant idea?</h3>
        <h4 class="display-6 my-5">Come find me.</h4>
        <div class=>
            <h3><c:out value="${user.firstName}"/></h3>
            <p><c:out value="${user.aka}"/></p>
            <p><c:out value="${user.email}"/></p>
        </div>
    </div>
</body>
</html>