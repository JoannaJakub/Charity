<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
    <form:form action="contactAddSuccessAdmin" modelAttribute="contactAdd" method="post">
        <div class="form--steps-counter">
            <label for="contactCategory">Wybierz kategorie</label>
            <br>
            <h4>
                <form:select path="contactCategory" items="${contactCategory}" itemLabel="name" itemValue="id"/>
            </h4>
        </div>
        <form:select path="user" items="${user}" type="long" class="form-control"/>
        <br>
        <div class="form-group">
            <form:input name="message" placeholder="Wiadomość" rows="3" path="message"></form:input>
            <br>
            <form:errors path="message"/>
        </div>
        <div class="form-group">
            <button class="btn" type="submit">Wyślij</button>
        </div>
    </form:form>
</section>
</body>
</html>
