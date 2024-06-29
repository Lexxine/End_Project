<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <style>
        .modal-content2 {
            background-color: #fefefe;
            margin-top: 10px;
            padding: 20px;
            width: 80%;
            width: 1000px;
            border-radius: 10px;
            position: relative;
            margin-left: 150px;

        }
        .modal-content2 select {
            width: 100%;
            padding: 10px;
            margin-top: 10px;
            margin-bottom: 20px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            display: none;
        }

        .modal-content2 button {
            background-color: #dfb1c7;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 20px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            align-self: center;
        }

        .modal-content2 button:hover {
            background-color: #c290a5;
        }
    </style>

</head>
<body id="page-top">

<div class="modal-content2">
    <form id="filters" action="/boards/fetchRecipesWithFilters" method="post">
        <label for="query">Alergeny:</label>
        <select name="query" id="query" multiple>
            <option  value="dairy">Mleko</option>
            <option value="egg">Jajka</option>
            <option  value="gluten">Gluten</option>
            <option   value="grain">Ziarna</option>
            <option  value="peanut">Orzeszki ziemne</option>
            <option  value="seafood">Owoce morza</option>
            <option  value="sesame">Sezam</option>
            <option  value="shellfish">Skorupiaki</option>
            <option  value="soy">Soja</option>
        </select>

        <button style="display: none" type="submit">Szukaj</button>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    </form>
</div>
<i class="fas fa-utensils fa-2x text-gray-300"></i>



</body>
</html>