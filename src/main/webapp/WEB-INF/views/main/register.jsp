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
<%@ include file="headerLogReg.jsp" %>

<section class="login-page">
    <h2>Załóż konto</h2>
    <form:form action="register_success" modelAttribute="user" method="post">
        <div class="form-group">
            <form:input type="firstName" name="firstName" placeholder="Imie" path="firstName"/>
            <form:errors path="firstName"/>
        </div>
        <div class="form-group">
            <form:input type="lastName" name="lastName" placeholder="Nazwisko" path="lastName"/>
            <form:errors path="lastName"/>
        </div>
        <div class="form-group">
            <form:input type="email" name="email" placeholder="Email" path="email"/>
            <form:errors path="email"/>
        </div>
        <div class="form-group">
            <form:input type="password" name="password" placeholder="Hasło" path="password"/>
            <form:errors path="password"/>
        </div>
        <div class="form-group">
            <form:input type="password" name="retypePassword" placeholder="Powtórz hasło" path="retypePassword"/>
            <form:errors path="retypePassword"/>
        </div>

        <div class="form-group form-group--buttons">
            <a href="<c:url value="/login"/>" class="btn btn--without-border">Zaloguj się</a>
            <button class="btn" type="submit">Załóż konto</button>
        </div>
    </form:form>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>