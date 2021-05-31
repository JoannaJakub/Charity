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

    <h2>Zmiany zostały pomyślnie zapisane</h2>

    <tbody>
    <table class="btn btn--without-border active">
        <form:form items="${userConfirmEditPersonalDetails}" var="userConfirmEditPersonalDetails" >
            <tr>
                <td>ID</td>
                <td><c:out value="${id}"/></td>

            </tr>
            <tr>
                <td>Imie</td>
                <td><c:out value="${userConfirmEditPersonalDetails.firstName}"/></td>
            </tr>
            <tr>
                <td>Nazwisko</td>
                <td><c:out value="${userConfirmEditPersonalDetails.lastName}"/></td>
            </tr>
            <tr>
                <td>Email</td>
                <td><c:out value="${userConfirmEditPersonalDetails.email}"/></td>
            </tr>
            <tr>
                <td>Hasło</td>
                <td><c:out value="${userConfirmEditPersonalDetails.password}"/></td>
            </tr>
            <tr>
                <td>Hasło</td>
                <td><c:out value="${userConfirmEditPersonalDetails.retypePassword}"/></td>
            </tr>
            <tr>
                <td>Uprawnienie admin</td>
                <td><c:out value="${userConfirmEditPersonalDetails.enabled}"/></td>
            </tr>
            <tr>
                <td>

                </td>
                <td>
                    <a href="<c:url value="/admin"/>" class="btn btn--without-active">Powrót do głównego panelu</a></li>
                </td>

            </tr>

        </form:form>

        </tbody>
    </table>

</section>

<script src="<c:url value="../resources/js/app.js"/>"></script>
</body>
</html>
