<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views2/header.jsp" %>
<h2>Edytuj link</h2>
<form action="/user/edit/${link.id}" method="post">
    <label for="paramName">Link</label>
    <input type="text" name="paramName" id="paramName" value="${link.url}">
    <label for="paramTitle">Tytuł</label>
    <input type="text" name="paramTitle" id="paramTitle" value="${link.title}">
    <label for="paramDescription">Opis</label>
    <input type="text" name="paramDescription" id="paramDescription" value="${link.description}">
    <input type="submit" value="Zapisz">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>
<%@ include file="/WEB-INF/views2/footer.jsp" %>
