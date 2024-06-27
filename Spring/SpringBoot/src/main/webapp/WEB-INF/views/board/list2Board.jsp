<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


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
            display: flex;
            flex-wrap: wrap;
            gap: 20px; /* Increase the gap between items */
        }

        .recipe-item {
            position: relative;
            width: 260px; /* Reduced width */
            height: 270px; /* Reduced height */
            overflow: hidden;
            border-radius: 10px;
            flex: 0 0 auto;
            margin-bottom: 20px; /* Increase the gap between rows */
        }

        .recipe-item:hover {
            background-color: white; /* White background on hover */
            border: 1px solid #ccc; /* Gray border color on hover */
        }

        .recipe-item img {
            width: 60%; /* Reduced width */
            height: 60%; /* Reduced height */
            position: absolute;
            top: 5%; /* Set distance from the top */
            left: 50%;
            transform: translateX(-50%);
            border-radius: 50%; /* Ensure the image is a perfect circle */
        }

        .recipe-info h5 {
            margin-top: 0;
            margin-bottom: 10px;
            font-size: 18px
            /*text-align: center;*/
        }

        .recipe-item:hover img {
            width: 35%; /* Further reduced width on hover */
            height: 35%; /* Further reduced height on hover */
            top: 5%; /* Set distance from the top */
            left: 50%;
            transform: translateX(-50%);
            border-radius: 50%; /* Ensure the image is a perfect circle on hover */
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
            color: #5a5c69;
        }

        .recipe-item:hover .recipe-info {
            transform: translateY(0);
        }

        .nutrition-info {
            display: flex;
            justify-content: space-around;
            margin-top: 10px;
            color: #5a5c69;
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

        .sidebar {
            width: 420px; /* Increased width */
            background-color: rgba(244, 244, 244, 0);
            padding: 30px;
            margin-right: 20px;
            align-self: flex-start;
            margin-left: 100px;
            margin-top: 25px;
        }

        .sidebar button {
            display: block;
            background-color: transparent;
            border: none;
            padding: 0 0;
            text-align: left;
            width: 100%;
            font-size: 16px;
            cursor: pointer;
            color: black;
            transition: color 0.3s ease;
            margin-top: 10px;
        }

        .sidebar button:hover {
            color: #dfb1c7;
        }

        .sidebar h4 {
            text-align: left;
            font-size: 20px;
            color: black;
        }

        body {
            font-family: serif;
        }

        .recipe-item .heart-button {
            position: absolute;
            top: 1px;
            right: 10px;
            font-size: 1.5rem;
            color: #808080;
            background-color: transparent;
            border: none;
            cursor: pointer;
            z-index: 1;
        }

        .recipe-item .heart-icon {
            font-size: inherit;
        }

        .recipe-link {
            color: #5a5c69;
        }

        .modal {
            display: none;
        }

        .pagination {
            display: flex;
            justify-content: center;
            padding: 20px 0;
        }

        .page-item.disabled .page-link {
            pointer-events: none;
            cursor: default;
            color: #ccc;
        }

        .page-item.active .page-link {
            background-color: #dfb1c7;
            color: white;
        }

        .container {
            max-width: 1500px;
            padding: 20px;
            background-color: white;
            align-self: center;
        }

        .content-container {
            display: flex;
            justify-content: flex-start;
        }

        .container h1 {
            text-align: center;
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
                                                   style="color: #DBB9CC;font-size: 18px">${board.name}</a>
                                                <div class="h5 mb-0 font-weight-bold text-gray-800" style="font-size: 15px">${board.description}</div>
                                            </div>
                                        </div>
                                        <div class="row mt-3">
                                            <div class="col text-center">
                                                <a href="/boards/edit/${board.id}" class="btn btn-sm edit-btn mr-2"
                                                   style="background-color: #808080; color: white; display: none;">Edytuj</a>
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
                <div class="container">
                    <h1>Lista przepisów</h1>
                    <div class="content-container">
                        <div class="sidebar">
                            <h4>Rodzaje przepisów</h4>
                            <form id="breakfast" action="/boards/fetchRecipes" method="post">
                                <input type="hidden" name="query" value="breakfast">
                                <button type="submit">Śniadania</button>
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            </form>
                            <form id="mainCourse" action="/boards/fetchRecipes" method="post">
                                <input type="hidden" name="query" value="main course">
                                <button type="submit">Dania główne</button>
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            </form>
                            <form id="soup" action="/boards/fetchRecipes" method="post">
                                <input type="hidden" name="query" value="soup">
                                <button type="submit">Zupy</button>
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            </form>
                            <form id="salad" action="/boards/fetchRecipes" method="post">
                                <input type="hidden" name="query" value="salad">
                                <button type="submit">Sałatki</button>
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            </form>
                            <form id="dessert" action="/boards/fetchRecipes" method="post">
                                <input type="hidden" name="query" value="dessert">
                                <button type="submit">Desery</button>
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            </form>
                            <form id="snack" action="/boards/fetchRecipes" method="post">
                                <input type="hidden" name="query" value="snack">
                                <button type="submit">Przekąski</button>
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            </form>
                            <form id="beverage" action="/boards/fetchRecipes" method="post">
                                <input type="hidden" name="query" value="beverage">
                                <button type="submit">Napoje</button>
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            </form>
                        </div>

                        <div class="recipes-container">
                            <c:forEach var="recipe" items="${recipes}">
                                <div class="recipe-item">
                                    <div id="saveModal" class="modal">
                                        <div class="modal-content">
                                            <span class="close"></span>
                                            <form id="saveRecipeForm" action="/recipes/saveRecipe" method="post">
                                                <input type="hidden" name="title" id="recipeName"
                                                       value="${recipe.title}">
                                                <input type="hidden" name="image" id="recipeImageUrl"
                                                       value="${recipe.image}">
                                                <input type="hidden" name="sourceUrl" id="recipeUrl"
                                                       value="${recipe.sourceUrl}">
                                                <c:forEach var="nutrient" items="${recipe.nutrition.nutrients}">
                                                    <c:if test="${nutrient.name == 'Calories'}">
                                                        <input type="hidden" name="calories" id="recipeCalories"
                                                               value="${Math.round(nutrient.amount / recipe.servings)}">
                                                    </c:if>
                                                    <c:if test="${nutrient.name == 'Carbohydrates'}">
                                                        <input type="hidden" name="carbs" id="recipeCarbs"
                                                               value="${Math.round(nutrient.amount / recipe.servings)}">
                                                    </c:if>
                                                    <c:if test="${nutrient.name == 'Protein'}">
                                                        <input type="hidden" name="protein" id="recipeProtein"
                                                               value="${Math.round(nutrient.amount / recipe.servings)}">
                                                    </c:if>
                                                    <c:if test="${nutrient.name == 'Fat'}">
                                                        <input type="hidden" name="fat" id="recipeFat"
                                                               value="${Math.round(nutrient.amount / recipe.servings)}">
                                                    </c:if>
                                                </c:forEach>
                                                <label for="boardId">Wybierz tablicę:</label>
                                                <select id="boardId" name="boardId" required>
                                                    <c:forEach var="board" items="${boards}">
                                                        <option value="${board.id}">${board.name}</option>
                                                    </c:forEach>
                                                </select>
                                                <input type="hidden" name="${_csrf.parameterName}"
                                                       value="${_csrf.token}"/>
                                                <button type="submit" class="btn btn-primary">Zapisz</button>
                                            </form>
                                        </div>
                                    </div>
                                    <button class="heart-button" style="display: none">
                                        <i class="heart-icon fas fa-heart"></i>
                                    </button>
                                    <img src="${recipe.image}" alt="${recipe.title}">
                                    <a href="${recipe.sourceUrl}" target="_blank" class="recipe-link">
                                        <div class="recipe-name-overlay">
                                            <h5>${recipe.title}</h5>
                                        </div>
                                        <div class="recipe-info">
                                            <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
                                                  rel="stylesheet">
                                            <h5>${recipe.title}</h5>
                                            <p>Wartosć odżywcza na 1 porcję:</p>
                                            <div class="nutrition-info">
                                                <div class="nutrition-info">
                                                    <c:forEach var="nutrient" items="${recipe.nutrition.nutrients}">
                                                        <c:if test="${nutrient.name == 'Calories'}">
                                                            <div class="nutrition-item">
                                                <span>
                                                    <c:out value="${Math.round(nutrient.amount / recipe.servings)}"/>
                                                </span>
                                                                <div class="nutrition-label">kcal</div>
                                                            </div>
                                                        </c:if>
                                                        <c:if test="${nutrient.name == 'Carbohydrates'}">
                                                            <div class="nutrition-item">
                                                <span>
                                                    <c:out value="${Math.round(nutrient.amount / recipe.servings)}"/>
                                                </span>
                                                                <div class="nutrition-label">W</div>
                                                            </div>
                                                        </c:if>
                                                        <c:if test="${nutrient.name == 'Protein'}">
                                                            <div class="nutrition-item">
                                                <span>
                                                    <c:out value="${Math.round(nutrient.amount / recipe.servings)}"/>
                                                </span>
                                                                <div class="nutrition-label">B</div>
                                                            </div>
                                                        </c:if>
                                                        <c:if test="${nutrient.name == 'Fat'}">
                                                            <div class="nutrition-item">
                                                <span>
                                                    <c:out value="${Math.round(nutrient.amount / recipe.servings)}"/>
                                                </span>
                                                                <div class="nutrition-label">T</div>
                                                            </div>
                                                        </c:if>
                                                    </c:forEach>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </c:forEach>
                        </div>
                    </div>

                    <c:if test="${not empty recipes}">
                        <nav aria-label="Recipe navigation">
                            <ul class="pagination">
                                <li class="page-item ${page == 0 ? 'disabled' : ''}">
                                    <a class="page-link" href="<c:url value='/boards/list?page=${page-1}'/>"
                                       aria-label="Previous">
                                        <span aria-hidden="true">&laquo;</span>
                                        <span class="sr-only">Previous</span>
                                    </a>
                                </li>
                                <c:forEach begin="0" end="${recipes.size() / 32}" var="pageNumber">
                                    <li class="page-item ${pageNumber == page ? 'active' : ''}">
                                        <a class="page-link"
                                           href="<c:url value='/boards/list?page=${pageNumber}'/>">${pageNumber + 1}</a>
                                    </li>
                                </c:forEach>
                                <li class="page-item ${recipes.size() < 32 ? 'disabled' : ''}">
                                    <a class="page-link" href="<c:url value='/boards/list?page=${page+1}'/>"
                                       aria-label="Next">
                                        <span aria-hidden="true">&raquo;</span>
                                        <span class="sr-only">Next</span>
                                    </a>
                                </li>
                            </ul>
                        </nav>
                    </c:if>
                </div>


                <%--                <form id="nextPageForm" action="/boards/list" method="GET">--%>
                <%--                    <input type="hidden" name="query" value="${query}"/>--%>
                <%--                    <input type="hidden" name="nextLink" value="${nextLink}"/>--%>
                <%--                    <button type="submit" class="btn btn-primary">Next Page</button>--%>
                <%--                </form>--%>


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
        <script src="<c:url value="/resources/js/demo/index2.js"/>"></script>


</body>
</html>