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
    <title>Dashboard</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/js/app.js"></script><!-- change to match your file/naming structure -->   
</head>
<body background="https://static.vecteezy.com/system/resources/previews/001/975/665/non_2x/abstract-technology-background-binary-data-and-streaming-binary-code-background-illustration-eps10-vector.jpg" style="font-family: monospace; background-size: cover;">
    <div class="container">
        <h1 class="display-3 my-3">Welcome ${user.firstName}</h1>
        <h3 class="display-6 my-5">Check some incredible ideas in your favorite language for your next project...</h3>
        <div class="d-flex justify-content-end">
            <a href="/logout">Log Out</a>
        </div>
        <div class="d-flex justify-content-around my-5">
            <a href="/create">Doesn't matter the language you will always find an idea</a>
        </div>
        <!-- <div class="d-flex justify-content-around my-5">
            <img src="https://heroku-blog-files.s3.amazonaws.com/posts/1562626183-heroku-blog-duke.png" alt="java img" style="border-radius: 50%;">
            <img src="https://knowbility.org/media/pages/blog/the-myth-of-javascript-accessibility/fc4717b7ec-1662134552/javascriptlogosmall.png" alt="JavaScript Logo" style="border-radius: 50%">
            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQDt2J4UMJFlpu8J-yN2U6D_kdJ_LfRo5r_O-nHjOGMrI6Q_ART5PDyPT3dtP7Vvt0ipas&usqp=CAU" alt="py" style="border-radius: 50%">
        </div> -->
    </div>
</body>
</html>