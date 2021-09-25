<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="pl">
<%@ include file="../userHeader.jsp" %>

<section class="login-page">
    <h2>Szczegóły użytkownika</h2>
    <table class="btn btn--without-border active">
        <form:form action="userEditPersonalDetails" modelAttribute="userEditPersonalDetails">
            <tr>
                <td>Imie</td>
                <td><form:input value="${userPersonalDetails.firstName}" path="firstName"/></td>
                <form:errors path="firstName"/>
            </tr>
            <tr>
                <td>Nazwisko</td>
                <td><form:input value="${userPersonalDetails.lastName}" path="lastName"/></td>
                <form:errors path="lastName"/>
            </tr>
            <tr>
                <td>Email</td>
                <td><form:input value="${userPersonalDetails.email}" path="email"/></td>
                <form:errors path="email"/>
            </tr>
            <tr>
                <td>
                    <a href="<c:url value="/changePassword"/>" class="btn btn--without-active">Zmień hasło</a>
                </td>
            </tr>
            <tr>
                <td>
                    <a href="<c:url value="/userPersonalDetails"/>" class="btn btn--without-active">Powrót</a>
                </td>
                <td>
                    <button type="submit" class="btn">Zapisz</button>
                </td>
            </tr>
        </form:form>
    </table>
</section>
</header>
</body>
</html>
