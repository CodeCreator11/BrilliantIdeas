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
    <title>Login/Registration</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet"  type="text/css" href="/css/style.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/js/app.js"></script><!-- change to match your file/naming structure -->   
</head>
<body background="https://e0.pxfuel.com/wallpapers/252/1013/desktop-wallpaper-tfw-you-don-t-have-an-21-9-monitor-for-rad-ultrawide-16-9.jpg" style="font-family: monospace; background-size: cover;">
    <div class="container">
        <h1 class="display-2">Welcome Developer</h1>
        <br>
        <div class="row">
            <div class="col">
                <h2 class="display-5">Register</h2>
                <div class="card shadow">
                    <div class="card-body">
                        <form:form action="/register" method="POST" modelAttribute="newUser" id="form">
                            <div class="mb-3">
                                <form:label path="firstName" class="form-label">First Name</form:label>
                                <form:input path="firstName" class="form-control"/>
                                 <form:errors path="firstName" class="form-text text-warning"/>
                            </div>
                            <div class="mb-3">
                                <form:label path="lastName" class="form-label">Last Name</form:label>
                                <form:input path="lastName" class="form-control"/>
                                <form:errors path="lastName" class="form-text text-warning"/>
                            </div>
                            <div class="mb-3">
                                <form:label path="aka" class="form-label">Aka</form:label>
                                <form:input path="aka" class="form-control"/>
                                <form:errors path="aka" class="form-text text-warning"/>
                            </div>
                            <div class="mb-3">
                                <form:label path="email" class="form-label">Email</form:label>
                                <form:input path="email" class="form-control"/>
                                <form:errors path="email" class="form-text text-warning"/>
                            </div>
                            <div class="mb-3">
                                <form:label path="password" class="form-label">Password</form:label>
                                <form:input path="password" class="form-control" type="password"/>
                                <form:errors path="password" class="form-text text-warning"/>
                            </div>
                            <div class="mb-3">
                                <form:label path="confirm" class="form-label">Confirm Password</form:label>
                                <form:input path="confirm" class="form-control" type="password"/>
                                <form:errors path="confirm" class="form-text text-warning"/>
                            </div>
                            <div class="text-end">
                                <button type="submit" class="btn btn-info">Register</button>
                            </div>
                        </form:form>
                    </div>
                </div>
            </div>
            <div class="col">
                <h2 class="display-5">Login</h2>
                <div class="card shadow">
                    <div class="card-body">
                        <form:form action="/login" method="POST" modelAttribute="newLogin">
                            <div class="mb-3">
                                <form:label path="email" class="form-label">Email</form:label>
                                <form:input path="email" class="form-control"/>
                                <form:errors path="email" class="form-text text-warning"/>
                            </div>
                            <div class="mb-3">
                                <form:label path="password" class="form-label">Password</form:label>
                                <form:input path="password" class="form-control" type="password"/>
                                <form:errors path="password" class="form-text text-warning"/>
                            </div>
                            <div class="text-end">
                                <button type="submit" class="btn btn-pink-moon" style="
                                    background: #ec008c;  /* fallback for old browsers */
                                    background: -webkit-linear-gradient(to right, #fc6767, #ec008c);  /* Chrome 10-25, Safari 5.1-6 */
                                    background: linear-gradient(to right, #fc6767, #ec008c); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
                                    color: #fff;
                                    
                                ">Login</button>
                            </div>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>