<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views2/header.jsp" %>
<div class="container">
    <h2 class="text-center">Dodaj link</h2>
    <form action="/user/add" method="post" class="form-container">
        <div class="form-group">
            <label for="paramName">URL:</label>
            <input type="text" id="paramName" name="paramName" class="form-control" required>
        </div>

        <div class="form-group">
            <label for="paramTitle">Tytuł:</label>
            <input type="text" id="paramTitle" name="paramTitle" class="form-control" required>
        </div>

        <div class="form-group">
            <label for="paramDescription">Opis:</label>
            <textarea id="paramDescription" name="paramDescription" class="form-control" required></textarea>
        </div>

        <div class="form-group">
            <label for="thumbnailUrl">URL zdjęcia przepisu:</label>
            <input type="text" id="thumbnailUrl" name="thumbnailUrl" class="form-control">
        </div>

        <div class="form-group">
            <label for="boardId">Tablica:</label>
            <select id="boardId" name="boardId" class="form-control" required>
                <c:forEach var="board" items="${boards}">
                    <option value="${board.id}">${board.name}</option>
                </c:forEach>
            </select>
        </div>

        <div class="form-group text-center">
            <button type="submit" class="btn btn-primary" style="background-color:#DFB1C7FF;border: 2px solid #DFB1C7FF;border-radius: 30px">Dodaj</button>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </div>
    </form>
</div>

<%@ include file="/WEB-INF/views2/footer.jsp" %>
