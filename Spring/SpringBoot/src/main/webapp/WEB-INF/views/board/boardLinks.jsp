<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>SB Admin 2 - Przepisy dla tablicy</title>
    <link href="<c:url value='/resources/vendor/fontawesome-free/css/all.min.css'/>" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
    <link href="<c:url value='/resources/css/sb-admin-2.css'/>" rel="stylesheet">
    <script src="<c:url value='/resources/js/demo/index.js'/>"></script>
</head>

<body id="page-top">
<div id="wrapper">
    <div id="content-wrapper" class="d-flex flex-column">
        <div id="content">
            <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow"></nav>
            <div class="container-fluid">
                <div class="d-sm-flex align-items-center justify-content-between mb-4">
                    <h1 class="h3 mb-0 text-gray-800">Przepisy dla tablicy: ${board.name}</h1>
                    <a href="/user/add" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">Dodaj przepis</a>
                </div>
                <div class="row mb-4">
                    <a href="/boards/edit/${board.id}" class="btn btn-sm btn-warning mr-2" style="background-color: #DBB9CC; color: white; border-color: #DBB9CC;">Edytuj tablicę</a>
                    <form action="/boards/delete/${board.id}" method="post" style="display: inline;">
                        <input type="submit" class="btn btn-sm btn-danger" value="Usuń tablicę" style="background-color: #DBB9CC; color: white; border-color: #DBB9CC;" onclick="return confirm('Czy na pewno chcesz usunąć tę tablicę?');">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    </form>
                </div>


                <div class="row" id="tilesContainer">
                    <c:forEach var="link" items="${links}">
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-primary shadow h-100 py-2" style="border-left-color: #DBB9CC;">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1" style="color: #DBB9CC;">${link.title}</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">${link.description}</div>
                                        </div>
                                        <div class="col-auto">
                                            <a href="${link.url}" target="_blank">
                                                <i class="fas fa-video fa-2x text-gray-300"></i>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="row mt-3">
                                        <div class="col text-center">
                                            <a href="/user/edit/${link.id}" class="btn btn-sm edit-btn mr-2" style="background-color: #DBB9CC; color: white; display: none;">Edytuj</a>
                                            <form action="/user/delete/${link.id}" method="post" style="display: none;">
                                                <input type="submit" class="btn btn-sm delete-btn" style="background-color: #DBB9CC; color: white;" value="Usuń" onclick="return confirm('Czy na pewno chcesz usunąć ten link?');">
                                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
