<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views2/header.jsp" %>
<div class="container">
    <h2 class="text-center">Edytuj Tablicę</h2>
    <form:form modelAttribute="board" action="${pageContext.request.contextPath}/boards/edit/${board.id}" method="post" class="form-container">
        <div class="form-group">
            <form:label path="name">Tytuł</form:label>
            <form:input path="name" class="form-control"/>
        </div>
        <div class="form-group">
            <form:label path="description">Opis</form:label>
            <form:textarea path="description" class="form-control"/>
        </div>
        <div class="form-group text-center">
            <button type="submit" class="btn btn-primary" style="background-color:#DFB1C7FF;border: #DFB1C7FF">Zapisz</button>
        </div>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    </form:form>
</div>


<%@ include file="/WEB-INF/views2/footer.jsp" %>
