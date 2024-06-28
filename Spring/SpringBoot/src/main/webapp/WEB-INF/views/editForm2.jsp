<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views2/header.jsp" %>

<div class="container">
    <h2 class="text-center">Edytuj przepis</h2>


    <form action="/recipes/edit/${recipe.id}" method="post" class="form-container">
        <div class="form-group">
            <label for="paramName">Nazwa przepisu:</label>
            <input type="text" id="paramName" name="title" value="${recipe.name}" required class="form-control"><br>
        </div>
        <div class="form-group">
            <label for="imageUrl">URL do obrazka:</label>
            <input type="text" id="imageUrl" name="image" value="${recipe.imageUrl}" required class="form-control"><br>
        </div>
        <div class="form-group">
            <label for="urlToRecipy">URL do przepisu:</label>
            <input type="text" id="urlToRecipy" name="sourceUrl" value="${recipe.urlToRecipy}" required class="form-control"><br>
        </div>
        <div class="form-group">
            <label for="calories">Kalorie:</label>
            <input type="text" id="calories" name="calories" value="${recipe.calories}" required class="form-control"><br>
        </div>
        <div class="form-group">
            <label for="carbs">Węglowodany:</label>
            <input type="text" id="carbs" name="carbs" value="${recipe.carbs}" required class="form-control"><br>
        </div>
        <div class="form-group">
            <label for="protein">Białko:</label>
            <input type="text" id="protein" name="protein" value="${recipe.protein}" required class="form-control"><br>
        </div>
        <div class="form-group">
            <label for="fat">Tłuszcz:</label>
            <input type="text" id="fat" name="fat" value="${recipe.fat}" required class="form-control"><br>
        </div>
        <div class="form-group">
            <label for="boardId">Tablica:</label>
            <select id="boardId" name="boardId" required class="form-control">
                <c:forEach var="board" items="${boards}">
                    <option value="${board.id}" ${recipe.board.id == board.id ? 'selected' : ''}>${board.name}</option>
                </c:forEach>
            </select><br>
        </div>
        <div class="form-group text-center">
            <button type="submit" class="btn btn-primary" style="background-color:#DFB1C7FF;border: #DFB1C7FF;border-radius: 30px">Zapisz</button>
        </div>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    </form>
</div>


<%@ include file="/WEB-INF/views2/footer.jsp" %>
