<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views2/header.jsp" %>

<h2>Dodaj Tablicę</h2>

<form:form modelAttribute="board" action="${pageContext.request.contextPath}/boards/add" method="post">
    <div>
        <form:label path="name">Tytuł</form:label>
        <form:input path="name" />
    </div>
    <div>
        <form:label path="description">Opis</form:label>
        <form:textarea path="description" />
    </div>
    <div>
        <input type="submit" value="Dodaj" />
    </div>
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form:form>

<%@ include file="/WEB-INF/views2/footer.jsp" %>
