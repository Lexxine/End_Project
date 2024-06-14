<%--
  Created by IntelliJ IDEA.
  User: ola
  Date: 13.06.2024
  Time: 13:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views2/header.jsp" %>
<h2>Dodaj link</h2>
<form action="add" method="post" >
    <label for="paramName">Adres url</label>
    <input type="text" name="paramName" id="paramName">
    <label for="paramTitle">Tytuł</label>
    <input type="text" name="paramTitle" id="paramTitle">
    <label for="paramDescription">Opis</label>
    <input type="text" name="paramDescription" id="paramDescription">
    <input type="submit" value="Send">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>
<%@ include file="/WEB-INF/views2/footer.jsp" %>
