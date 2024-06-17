<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views2/header.jsp" %>
<h2>Edytuj link</h2>
<form action="/user/edit/${link.id}" method="post">
    <label for="paramName">URL:</label>
    <input type="text" id="paramName" name="paramName" value="${link.url}" required><br>

    <label for="paramTitle">Tytuł:</label>
    <input type="text" id="paramTitle" name="paramTitle" value="${link.title}" required><br>

    <label for="paramDescription">Opis:</label>
    <textarea id="paramDescription" name="paramDescription" required>${link.description}</textarea><br>

    <label for="boardId">Tablica:</label>
    <select id="boardId" name="boardId" required>
        <c:forEach var="board" items="${boards}">
            <option value="${board.id}" ${link.board.id == board.id ? 'selected' : ''}>${board.name}</option>
        </c:forEach>
    </select><br>

    <button type="submit">Zaktualizuj</button>
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>
<%@ include file="/WEB-INF/views2/footer.jsp" %>
