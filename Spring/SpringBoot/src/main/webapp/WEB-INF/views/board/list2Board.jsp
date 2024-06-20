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
    <title>SB Admin 2 - Tablice</title>
    <!-- Custom fonts for this template-->
    <link href="<c:url value="/resources/vendor/fontawesome-free/css/all.min.css"/>" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
          rel="stylesheet">
    <!-- Custom styles for this template-->
    <link href="<c:url value="/resources/css/sb-admin-2.css"/>" rel="stylesheet">

    <style>
        /* General styles */
        .board-item {
            display: none;
        }

        .board-item.visible {
            display: block;
        }

        .board-container {
            display: flex;
            overflow: hidden;
            position: relative;
        }

        .board-wrapper {
            display: flex;
            transition: transform 0.5s ease;
        }

        .nav-arrow {
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            font-size: 2rem;
            background: none;
            border: none;
        }

        #scrollLeft {
            left: 0;
        }

        #scrollRight {
            right: 0;
        }

        /* Styles for the recipe section */
        .recipes-container {
            max-width: 1500px; /* Maksymalna szerokość kontenera przepisów */
            margin: 0 auto; /* Wyśrodkowanie kontenera na ekranie */
            padding: 0 15px; /* Dodatkowe paddingi po bokach */
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around; /* Wycentrowanie elementów na ekranie */

        }

        .recipe-item {
            position: relative;
            width: 300px;
            height: 310px;
            overflow: hidden;
            border-radius: 10px;
            flex: 0 0 auto;

        }

        .recipe-item:hover {
            background-color: white; /* White background on hover */
            border: 1px solid #ccc; /* Gray border color on hover */
        }

        .recipe-item img {
            width: 65%; /* Redukcja szerokości obrazka */
            height: 65%; /* Redukcja wysokości obrazka */
            position: absolute;
            top: 5%; /* Ustawienie odległości od góry */
            left: 50%;
            transform: translateX(-50%);
            border-radius: 65%;

        }
        .recipe-info h5 {
            margin-top: 0;
            margin-bottom: 10px;
            font-size: 1.2rem;
            text-align: center;
        }

            .recipe-item:hover img {
            width: 40%; /* Redukcja szerokości obrazka */
            height: 40%; /* Redukcja wysokości obrazka */
            position: absolute;
            top: 5%; /* Ustawienie odległości od góry */
            left: 50%;
            transform: translateX(-50%);
            border-radius: 50%;
        }

        .recipe-info {
            position: absolute;
            bottom: 0;
            left: 0;
            right: 0;
            background-color: white;
            transform: translateY(100%);
            transition: transform 0.3s ease;
            text-align: center;

        }

        .recipe-item:hover .recipe-info {
            transform: translateY(0);
        }

        .nutrition-info {
            display: flex;
            justify-content: space-around;
            margin-top: 10px;
        }

        .nutrition-item {
            text-align: center;
            margin-right: 15px;
            padding: 5px 0;
        }

        .nutrition-item span {
            font-weight: bold;
        }

        .nutrition-label {
            display: block;
            font-size: 0.9em;
            color: #808080;
            margin-top: 5px;
        }

        .container-fluid {
            background-color: white;
            padding: 20px; /* Added padding for content spacing */
        }
        .recipe-name-overlay {
            position: absolute;
            top: 90%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 60%;
            text-align: center;
        }
        .recipe-item:hover::before {
            content: "\f004"; /* Kod ikony serduszka z Font Awesome */
            font-family: "Font Awesome 6 Free"; /* Używana rodzina czcionek */
            position: absolute; /* Pozycja absolutna w kontenerze rodzica */
            top: 10px; /* Odległość od górnej krawędzi */
            right: 10px; /* Odległość od prawej krawędzi */
            font-size: 1.5rem; /* Rozmiar ikony */
            color: #808080; /* Kolor ikony */
            z-index: 1; /* Głębokość warstwy (nad tłem) */
        }

    </style>

</head>
<body id="page-top">
<!-- Page Wrapper -->
<div id="wrapper">

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">
        <!-- Main Content -->
        <div id="content">
            <!-- Topbar -->
            <!--   <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow"></nav> -->
            <!-- End of Topbar -->
            <!-- Begin Page Content -->
            <div class="container-fluid">
                <!-- Page Heading -->
                <div class="d-sm-flex align-items-center justify-content-between mb-4">
                    <h1 class="h3 mb-0 text-gray-800">Tablice</h1>
                    <div class="d-flex flex-column">
                        <a href="/boards/add" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm mb-2"
                           style="margin-top: 20px;">Dodaj tablicę</a>

                        <a href="/login" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">Wyloguj</a>
                    </div>
                </div>

                <!-- Content Section -->
                <div class="board-container">
                    <button id="scrollLeft" class="nav-arrow"><i class="fas fa-chevron-left"></i></button>
                    <div class="board-wrapper" id="boardWrapper">
                        <c:forEach var="board" items="${boards}" varStatus="status">
                            <div class="col-xl-3 col-md-6 mb-4 board-item ${status.index < 3 ? 'visible' : ''}">
                                <div class="card border-left-primary shadow h-100 py-2"
                                     style="border-left-color: #DBB9CC;">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <a href="/boards/${board.id}/links"
                                                   class="text-xs font-weight-bold text-primary text-uppercase mb-1"
                                                   style="color: #DBB9CC;">${board.name}</a>
                                                <div class="h5 mb-0 font-weight-bold text-gray-800">${board.description}</div>
                                            </div>
                                        </div>
                                        <div class="row mt-3">
                                            <div class="col text-center">
                                                <a href="/boards/edit/${board.id}" class="btn btn-sm edit-btn mr-2"
                                                   style="background-color: #DBB9CC; color: white; display: none;">Edytuj</a>
                                                <form action="${pageContext.request.contextPath}/boards/delete/${board.id}"
                                                      method="post" style="display: none;">
                                                    <input type="submit" class="btn btn-sm delete-btn"
                                                           style="background-color: #DBB9CC; color: white;" value="Usuń"
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
                    </div>
                    <button id="scrollRight" class="nav-arrow"><i class="fas fa-chevron-right"></i></button>
                </div>

                <!-- Recipe Section -->
                <h1>Lista przepisów</h1>
                <div class="recipes-container">
<%--                <div id="recipes-container" class="d-flex flex-wrap"></div>--%>
<%--&lt;%&ndash;                <button formaction="/boards/list" id="load-more" class="btn btn-primary">Load More</button>&ndash;%&gt;--%>
<%--                <div class="d-flex flex-wrap ">--%>
                    <c:forEach var="recipe" items="${recipes}">
                        <div class="recipe-item">
                            <img src="${recipe.imageUrl}" alt="${recipe.name}">
                            <div class="recipe-name-overlay">
                                <h5>${recipe.name}</h5>
                            </div>
                            <div class="recipe-info">
                                <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">

                                <h5>${recipe.name}</h5>
                                <p>Wartosć odżywcza na 1 porcję:</p>
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
                        </div>
                    </c:forEach>
                </div>
<%--            </div>--%>
<%--        </div>--%>
    </div>
</div>

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>

<!-- Logout Modal-->
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                <a class="btn btn-primary" href="login.html">Logout</a>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap core JavaScript-->
<script src="<c:url value="/resources/vendor/jquery/jquery.min.js"/>"></script>
<script src="<c:url value="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"/>"></script>
<!-- Core plugin JavaScript-->
<script src="<c:url value="/resources/vendor/jquery-easing/jquery.easing.min.js"/>"></script>
<!-- Custom scripts for all pages-->
<script src="<c:url value="/resources/js/sb-admin-2.min.js"/>"></script>
<!-- Custom Scroll Script -->
<script src="<c:url value="/resources/js/demo/board-scroll.js"/>"></script>

</body>
</html>
