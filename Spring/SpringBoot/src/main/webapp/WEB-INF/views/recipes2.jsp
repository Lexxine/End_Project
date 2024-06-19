
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
        <h4>${recipe.source}</h4>
    </div>
</c:forEach>
</body>
</html>


