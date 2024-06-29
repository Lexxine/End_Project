<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views2/header.jsp" %>

<style>
    .container {
        margin-top: 20px;
    }
</style>

<div class="container">
    <h2 class="text-center">Dodaj Tablicę</h2>

    <form:form modelAttribute="board" action="/boards/add" method="post" class="form-container">
        <div class="form-group">
            <form:label path="name">Tytuł</form:label>
            <form:input path="name" class="form-control"/>
        </div>
        <div class="form-group">
            <form:label path="description">Opis</form:label>
            <form:textarea path="description" class="form-control"/>
        </div>
        <div class="form-group text-center">
            <button type="submit" class="btn btn-primary"
                    style="background-color:#DFB1C7FF;border: 2px solid #DFB1C7FF;border-radius: 30px">Dodaj
            </button>
        </div>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    </form:form>
</div>

<%@ include file="/WEB-INF/views2/footer.jsp" %>
