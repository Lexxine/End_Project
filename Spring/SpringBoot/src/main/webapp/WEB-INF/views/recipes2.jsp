<%--<%@ page language="java" contentType="text/html; charset=UTF-8"--%>
<%--         pageEncoding="UTF-8"%>--%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>--%>
<%--<!DOCTYPE html>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <meta charset="UTF-8">--%>
<%--    <title>Lista przepisów</title>--%>
<%--</head>--%>
<%--<body>--%>
<%--<h1>Lista przepisów</h1>--%>
<%--<c:forEach var="recipe" items="${recipes}">--%>
<%--    <div>--%>
<%--        <h2>${recipe.title}</h2>--%>
<%--        <img src="${recipe.image}" alt="${recipe.title}">--%>
<%--        <p>${recipe.summary}</p>--%>
<%--    </div>--%>
<%--</c:forEach>--%>
<%--</body>--%>
<%--</html>--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Recipes</title>
</head>
<body>
<h2>Recipes</h2>
<c:forEach var="recipe" items="${recipes}">
    <div>
        <h3>${recipe.name}</h3>
        <img src="${recipe.imageUrl}" alt="${recipe.name}" />
    </div>
</c:forEach>
</body>
</html>


