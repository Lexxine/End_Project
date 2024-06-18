<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pl">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Dashboard</title>

    <!-- Custom fonts for this template-->
    <link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="/resources/css/sb-admin-2.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Nunito', sans-serif;
        }
        #content-wrapper {
            background: url("/resources/img/iStock-912353206.jpg") no-repeat center center;
            background-size: cover;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }
        .content-container {
            background-color: rgba(255, 255, 255, 0.8);
            border-radius: 10px;
            padding: 20px;
            max-width: 600px;
            text-align: center;
        }
        .content-container h1 {
            margin-bottom: 20px;
        }
        .styled-button {
            background-color: #DBB9CC;
            border: none;
            color: white;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            border-radius: 5px;
        }
        .content-container#login-form form {
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .content-container#login-form form div {
            margin-bottom: 10px;
            width: 100%;
            box-sizing: border-box;
        }
        .content-container#login-form form label {
            display: block;
            margin-bottom: 5px;
            text-align: left;
            width: 100%;
        }
        .content-container#login-form form input[type="text"],
        .content-container#login-form form input[type="password"] {
            padding: 8px;
            width: 100%;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 5px;
            outline: none;
        }
        .content-container#login-form form input[type="submit"] {
            margin-top: 10px;
        }
        .top-right-button {
            position: absolute;
            top: 20px;
            right: 20px;
            background-color: #DBB9CC;
            color: white;
            border-color: #DBB9CC;
            border-radius: 20px;
            padding: 10px 15px;
            font-size: 18px;
            border-radius: 30px;
        }
        .top-right-button:hover {
            background-color: rgba(219, 185, 204, 0.75);
            border-color: rgba(219, 185, 204, 0.75);
        }
        .error {
            font-size: 14px;
        }
    </style>
</head>

<body id="page-top">



<!-- Content Wrapper -->
<div id="content-wrapper">

    <!-- Main Content -->
    <div id="content">

        <!-- Begin Page Content -->
        <div class="container-fluid text-center">

            <!-- Page Heading -->
            <h1 class="h3 mb-0 text-gray-800">Zarejestruj się</h1>

            <!-- Your content here -->
            <div class="content-container" id="login-form">

                <form action="/register" method="post">
                    <div><label> Nazwa użytkownika : <input type="text" name="username"/> </label></div>
                    <div><label> Hasło: <input type="password" name="password"/> </label></div>
                    <div><input type="submit" value="Zarejestruj się" class="styled-button"/></div>
                    <div>
                        <span class="error"><c:out value="${error}"/></span>
                    </div>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                </form>

            </div>

        </div>
        <!-- /.container-fluid -->

    </div>
    <!-- End of Main Content -->

</div>
<!-- End of Content Wrapper -->

<!-- Bootstrap core JavaScript-->
<script src="/resources/vendor/jquery/jquery.min.js"></script>
<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="/resources/js/sb-admin-2.min.js"></script>

</body>

</html>
