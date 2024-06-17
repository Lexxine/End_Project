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
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
    <!-- Custom styles for this template-->
    <link href="<c:url value="/resources/css/sb-admin-2.css"/>" rel="stylesheet">

    <style>
        .board-item { display: none; }
        .board-item.visible { display: block; }
        .board-container { display: flex; overflow: hidden; position: relative; }
        .board-wrapper { display: flex; transition: transform 0.5s ease; }
        .nav-arrow { position: absolute; top: 50%; transform: translateY(-50%); font-size: 2rem; background: none; border: none; }
        #scrollLeft { left: 0; }
        #scrollRight { right: 0; }
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
            <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow"></nav>
            <!-- End of Topbar -->
            <!-- Begin Page Content -->
            <div class="container-fluid">
                <!-- Page Heading -->
                <div class="d-sm-flex align-items-center justify-content-between mb-4">
                    <h1 class="h3 mb-0 text-gray-800">Tablice</h1>
                    <a href="/boards/add" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">Dodaj tablicę</a>
                </div>
                <!-- Content Section -->
                <div class="board-container">
                    <button id="scrollLeft" class="nav-arrow"><i class="fas fa-chevron-left"></i></button>
                    <div class="board-wrapper" id="boardWrapper">
                        <c:forEach var="board" items="${boards}" varStatus="status">
                            <div class="col-xl-3 col-md-6 mb-4 board-item ${status.index < 3 ? 'visible' : ''}">
                                <div class="card border-left-primary shadow h-100 py-2" style="border-left-color: #DBB9CC;">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <a href="/boards/${board.id}/links" class="text-xs font-weight-bold text-primary text-uppercase mb-1" style="color: #DBB9CC;">${board.name}</a>
                                                <div class="h5 mb-0 font-weight-bold text-gray-800">${board.description}</div>
                                            </div>
                                        </div>
                                        <div class="row mt-3">
                                            <div class="col text-center">
                                                <a href="/boards/edit/${board.id}" class="btn btn-sm edit-btn mr-2" style="background-color: #DBB9CC; color: white; display: none;">Edytuj</a>
                                                <form action="${pageContext.request.contextPath}/boards/delete/${board.id}" method="post" style="display: none;">
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
                    <button id="scrollRight" class="nav-arrow"><i class="fas fa-chevron-right"></i></button>
                </div>
            </div>
            <!-- Footer -->
           <!-- <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Your Website 2021</span>
                    </div>
                </div>
            </footer> -->
            <!-- End of Footer -->
        </div>
        <!-- End of Content Wrapper -->
    </div>
    <!-- End of Page Wrapper -->
    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>
    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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

</div>
</body>
</html>
