<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Document</title>
    <link rel="stylesheet" href="<c:url value="resources/css/style.css"/>"/>
</head>
<body>
<%@ include file="../adminHeader.jsp" %>

<section class="login-page">
    <h2>Dodaj kategorię</h2>
    <form:form action="contactCategoryAddSuccess" modelAttribute="contactCategory" method="post">
        <div class="form-group">
            <form:hidden path="id"/>
            <form:input placeholder="Nazwa" path="name" id="name"/>
            <form:errors path="name"/>
        </div>
        <div class="form-group form-group--buttons">
            <a href="<c:url value="/adminContact#contactCategoryList"/>" class="btn btn--without-border">Powrót</a>
            <button class="btn" type="submit">Dodaj</button>
        </div>
    </form:form>
</section>
</body>
</html>
