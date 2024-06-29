<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <title>Błąd</title>
    <style>
        body {
            font-family: serif;
            margin-top: 50px;
            background: url("/resources/img/iStock-1940486360.jpg") no-repeat center center;
            background-size: cover;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }

        .error-container {

            display: flex;
            flex-direction: column;
            align-items: center;
            text-align: center;
            color: #ffffff;
        }

        .error-container h1 {
            color: #ffffff;
            font-size: 150px;
            margin-bottom: 40px;

        }

        .error-container p {
            color: #ffffff;
            font-size: 40px;
            margin-top: 0;
        }

        .error-container a {
            color: #e3ddbf;
            text-decoration: none;
            font-size: 30px;

        }
    </style>
</head>
<body>
<div class="error-container">
    <h1> ${statusCode}</h1>
    <p>${errorMessage}</p>
    <a href="/login">Strona główna</a>
</div>
</body>
</html>
