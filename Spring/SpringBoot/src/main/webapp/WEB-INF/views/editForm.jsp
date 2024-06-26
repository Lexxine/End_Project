<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views2/header.jsp" %>

<div class="container">
    <h2 class="text-center">Edytuj link</h2>
    <form action="/user/edit/${link.id}" method="post" class="form-container">
        <div class="form-group">
            <label for="paramName">URL:</label>
            <input type="text" id="paramName" name="paramName" class="form-control" value="${link.url}" required>
        </div>

        <div class="form-group">
            <label for="paramTitle">Tytuł:</label>
            <input type="text" id="paramTitle" name="paramTitle" class="form-control" value="${link.title}" required>
        </div>

        <div class="form-group">
            <label for="paramDescription">Opis:</label>
            <textarea id="paramDescription" name="paramDescription" class="form-control" required>${link.description}</textarea>
        </div>

        <div class="form-group">
            <label for="boardId">Tablica:</label>
            <select id="boardId" name="boardId" class="form-control" required>
                <c:forEach var="board" items="${boards}">
                    <option value="${board.id}" ${link.board.id == board.id ? 'selected' : ''}>${board.name}</option>
                </c:forEach>
            </select>
        </div>

        <div class="form-group text-center">
            <button type="submit" class="btn btn-primary" style="background-color:#DFB1C7FF;border: #DFB1C7FF">Zaktualizuj</button>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </div>
    </form>
</div>

<%@ include file="/WEB-INF/views2/footer.jsp" %>
