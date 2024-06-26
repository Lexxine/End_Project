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
    <style>
        .card {
            border-left-color: #DBB9CC !important;
            width: 5cm;
            height: 20cm;
            margin: 0 auto; /* Centers the card horizontally */
            overflow: hidden;
            border-radius: 10px;
            flex: 0 0 auto;
        }
        .edit-btn, .delete-btn {
            display: none;
        }
        .card:hover .edit-btn, .card:hover .delete-btn {
            display: inline-block;
        }
        .card-body {
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            height: 100%;
        }
        .col-auto a i {
            font-size: 1.5em;
        }
         .nutrition-info {
             display: flex;
             justify-content: center;
             margin-top: 10px;

         }

        .nutrition-item {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin: 0 10px;
        }

        .nutrition-item span {
            font-size: 1.2em;
            font-weight: bold;
        }

        .nutrition-label {
            font-size: 0.9em;
            color: #666;
        }

    </style>
</head>

<body >
<div id="wrapper">
    <div id="content-wrapper" class="d-flex flex-column">
        <div id="content">

            <div class="container-fluid">
                <div class="d-sm-flex align-items-center justify-content-between mb-4">
                    <h1 class="h3 mb-0 text-gray-800">Przepisy dla tablicy: ${board.name}</h1>
                    <a href="/user/add" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">Dodaj przepis</a>
                </div>
                <div class="row mb-4">
                    <a href="/boards/edit/${board.id}" class="btn btn-sm btn-warning mr-2" style="background-color: #DBB9CC; color: white; border-color: #DBB9CC;">Edytuj tablicę</a>
                    <a href="/boards/list" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">Strona główna</a>
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
                                                <c:choose>
                                                    <c:when test="${not empty link.thumbnailUrl}">
                                                        <img src="${link.thumbnailUrl}" alt="Thumbnail" style="width: 100px; height: 100px;">
                                                    </c:when>
                                                    <c:otherwise>
                                                        <i class="fas fa-video fa-2x text-gray-300"></i>
                                                    </c:otherwise>
                                                </c:choose>

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
                    <c:forEach var="recipe" items="${recipes}">
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-primary shadow h-100 py-2" style="border-left-color: #DBB9CC;">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1" style="color: #DBB9CC;">${recipe.name}</div>
<%--                                            <p>Wartosć odżywcza na 1 porcję:</p>--%>
                                            <div class="nutrition-info">
                                                <div class="nutrition-item">
                                                    <span>${recipe.calories}</span>
                                                    <div class="nutrition-label">kcal</div>
                                                </div>
                                                <div class="nutrition-item">
                                                    <span>${recipe.carbs}</span>
                                                    <div class="nutrition-label">W</div>
                                                </div>
                                                <div class="nutrition-item">
                                                    <span>${recipe.protein}</span>
                                                    <div class="nutrition-label">B</div>
                                                </div>
                                                <div class="nutrition-item">
                                                    <span>${recipe.fat}</span>
                                                    <div class="nutrition-label">T</div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-auto">
                                            <a href="${recipe.urlToRecipy}" target="_blank">
                                                <c:choose>
                                                    <c:when test="${not empty recipe.imageUrl}">
                                                        <img src="${recipe.imageUrl}" alt="Thumbnail" style="width: 100px; height: 100px;">
                                                    </c:when>
                                                    <c:otherwise>
                                                        <i class="fas fa-video fa-2x text-gray-300"></i>
                                                    </c:otherwise>
                                                </c:choose>

                                            </a>
                                        </div>

                                    </div>
                                    <div class="row mt-3">
                                        <div class="col text-center">
                                            <a href="/recipes/edit/${recipe.id}" class="btn btn-sm edit-btn mr-2" style="background-color: #DBB9CC; color: white; display: none;">Edytuj</a>
                                            <form action="/recipes/delete/${recipe.id}" method="post" style="display: none;">
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
