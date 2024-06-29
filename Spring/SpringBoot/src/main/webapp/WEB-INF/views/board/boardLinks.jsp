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
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
          rel="stylesheet">
    <link href="<c:url value='/resources/css/sb-admin-2.css'/>" rel="stylesheet">
    <script src="<c:url value='/resources/js/demo/index.js'/>"></script>
    <style>
        body {
            font-family: serif;
        }

        .card {
            border-left-color: #DBB9CC !important;
            border-radius: 10px;
            flex: 0 0 auto;
            height: 290px;
            width: 240px;
            position: relative;
            overflow: hidden;
        }

        .card-body img {
            border-radius: 50%;
            width: 100px;
            height: 100px;
            object-fit: cover;
            margin: auto;
            display: block;
            top: 50%;
        }

        .edit-btn,
        .delete-btn {
            display: none;
        }

        .card:hover .edit-btn,
        .card:hover .delete-btn {
            display: inline-block;
        }

        .card-body {
            display: flex;
            flex-direction: column;
            justify-content: center;
            height: 290px;
            width: 240px;
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

        #Main {
            margin-top: 40px;
            margin-left: 40px;
            text-align: center;
            background-color: rgba(219, 185, 204, 0.89);
            border-color: rgba(219, 185, 204, 0.75);
            margin-bottom: 30px;
            border-radius: 30px;
            padding: 10px 25px;
            font-size: 18px;
        }

        .MyButtons {
            justify-content: flex-end;
            margin-top: 0;
            margin-right: 40px;
        }


        .container-fluid h1 {
            align-self: center;
            width: 100%;
            font-size: 40px;
        }

        .AddButton {
            margin-left: 40px;
            border-radius: 30px;
            margin-top: 50px;
            background-color: transparent;
            border-color: transparent;
            color: rgb(196, 156, 182);
            font-size: 20px;
        }

        .container-fluid {
            width: 70%;
        }

    </style>
</head>

<body>
<div id="wrapper">
    <div id="content-wrapper" class="d-flex flex-column">
        <div id="content">
            <a href="/boards/list" id="Main" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">Strona
                główna</a>
            <a href="/user/add" class="AddButton">Dodaj</a>
            <a href="/boards/edit/${board.id}" class=" AddButton">Edytuj tablicę</a>

            <form action="/boards/delete/${board.id}" method="post" style="display: inline;">
                <input type="submit" class="AddButton"
                       value="Usuń tablicę"
                       onclick="return confirm('Czy na pewno chcesz usunąć tę tablicę?');">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            </form>

            <div class="container-fluid">
                <div class="d-sm-flex align-items-center justify-content-between mb-4">
                    <h1 class="h3 mb-0 text-gray-800" style="text-align: center; width: 100%;">${board.name}</h1>
                </div>


                <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-4 g-2 g-sm-1 g-md-2 g-lg-3"
                     id="tilesContainer">
                    <c:forEach var="link" items="${links}">
                        <div class="col mb-4">
                            <div class="card border-left-primary shadow h-100 py-2"
                                 style="border-left-color: #DBB9CC;">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-primary text-uppercase"
                                                 style="color: #DBB9CC; text-align: center; font-size: 18px">${link.title}</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800"
                                                 style="text-align: center; font-size: 16px">${link.description}</div>
                                        </div>
                                        <div class="col-auto">
                                            <a href="${link.url}" target="_blank">
                                                <c:choose>
                                                    <c:when test="${not empty link.thumbnailUrl}">
                                                        <img src="${link.thumbnailUrl}" alt="Thumbnail"
                                                             style="width: 100px; height: 100px;">
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
                                            <a href="/user/edit/${link.id}" class="btn btn-sm edit-btn mr-2"
                                               style="background-color: #DBB9CC; color: white; display: none;  border-radius: 20px;">Edytuj</a>
                                            <form action="/user/delete/${link.id}" method="post"
                                                  style="display: none;">
                                                <input type="submit" class="btn btn-sm delete-btn"
                                                       style="background-color: #DBB9CC; color: white; border-radius: 20px;"
                                                       value="Usuń"
                                                       onclick="return confirm('Czy na pewno chcesz usunąć ten link?');">
                                                <input type="hidden" name="${_csrf.parameterName}"
                                                       value="${_csrf.token}"/>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                    <c:forEach var="recipe" items="${recipes}">
                        <div class="col mb-4">
                            <div class="card border-left-primary shadow h-100 py-2"
                                 style="border-left-color: #DBB9CC;">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-primary text-uppercase"
                                                 style="color: #DBB9CC;text-align: center; font-size: 18px">${recipe.name}</div>
                                            <div class="col-auto">
                                                <a href="${recipe.urlToRecipy}" target="_blank">
                                                    <c:choose>
                                                        <c:when test="${not empty recipe.imageUrl}">
                                                            <img src="${recipe.imageUrl}" alt="Thumbnail"
                                                                 style="width: 100px; height: 100px;">
                                                        </c:when>
                                                        <c:otherwise>
                                                            <i class="fas fa-video fa-2x text-gray-300"></i>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </a>
                                            </div>
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
                                                    <span>
                                                            ${recipe.fat}</span>
                                                    <div class="nutrition-label">T</div>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="row mt-3">
                                        <div class="col text-center">
                                            <a href="/recipes/edit/${recipe.id}" class="btn btn-sm edit-btn mr-2"
                                               style="background-color: #DBB9CC; color: white; display: none; border-radius: 20px;">Edytuj</a>
                                            <form action="/recipes/delete/${recipe.id}" method="post"
                                                  style="display: none;">
                                                <input type="submit" class="btn btn-sm delete-btn"
                                                       style="background-color: #DBB9CC; color: white; border-radius: 20px;"
                                                       value="Usuń"
                                                       onclick="return confirm('Czy na pewno chcesz usunąć ten przepis?');">
                                                <input type="hidden" name="${_csrf.parameterName}"
                                                       value="${_csrf.token}"/>
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

