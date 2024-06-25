<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views2/header.jsp" %>

<h2>Edytuj przepis</h2>
<form action="/recipes/edit/${recipe.id}" method="post">
    <label for="paramName">Nazwa przepisu:</label>
    <input type="text" id="paramName" name="title" value="${recipe.name}" required><br>

    <label for="imageUrl">URL do obrazka:</label>
    <input type="text" id="imageUrl" name="image" value="${recipe.imageUrl}" required><br>

    <label for="urlToRecipy">URL do przepisu:</label>
    <input type="text" id="urlToRecipy" name="sourceUrl" value="${recipe.urlToRecipy}" required><br>

    <label for="calories">Kalorie:</label>
    <input type="text" id="calories" name="calories" value="${recipe.calories}" required><br>

    <label for="carbs">Węglowodany:</label>
    <input type="text" id="carbs" name="carbs" value="${recipe.carbs}" required><br>

    <label for="protein">Białko:</label>
    <input type="text" id="protein" name="protein" value="${recipe.protein}" required><br>

    <label for="fat">Tłuszcz:</label>
    <input type="text" id="fat" name="fat" value="${recipe.fat}" required><br>

    <label for="boardId">Tablica:</label>
    <select id="boardId" name="boardId" required>
        <c:forEach var="board" items="${boards}">
            <option value="${board.id}" ${recipe.board.id == board.id ? 'selected' : ''}>${board.name}</option>
        </c:forEach>
    </select><br>

    <button type="submit">Zaktualizuj</button>
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>

<%@ include file="/WEB-INF/views2/footer.jsp" %>
