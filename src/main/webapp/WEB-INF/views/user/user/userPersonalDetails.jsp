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
        <form:form action="userPersonalDetails" modelAttribute="userPersonalDetails">
            <input type="hidden" name="user" value="${user.id}">
            <tr>
                <td>Imie</td>
                <td><c:out value="${userPersonalDetails.firstName}"/></td>
            </tr>
            <tr>
                <td>Nazwisko</td>
                <td><c:out value="${userPersonalDetails.lastName}"/></td>
            </tr>
            <tr>
                <td>Email</td>
                <td><c:out value="${userPersonalDetails.email}"/></td>
            </tr>

            <tr>
                <td>
                    <a href="<c:url value="/form"/>" class="btn btn--without-active">Powrót</a></li>
                </td>
                <td>
                    <a href="<c:url value="/userEditPersonalDetails"/>" class="btn btn--without-active">Edytuj</a>
                </td>
            </tr>

        </form:form>
    </table>
</section>
</body>
</html>
