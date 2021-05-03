<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="pl">
<%@ include file="../adminHeader.jsp" %>


<section class="login-page">

    <h2>Zmiany zostały pomyślnie zapisane</h2>

    <tbody>
    <table style="width:80%"  cellpadding="15" class="btn btn--without-border active">
        <form:form items="${userConfirmEdit}" var="userConfirmEdit" >
            <tr>
                <td>ID</td>
                <td><c:out value="${id}"/></td>

            </tr>
            <tr>
                <td>Imie</td>
                <td><c:out value="${userConfirmEdit.firstName}"/></td>
            </tr>
            <tr>
                <td>Nazwisko</td>
                <td><c:out value="${userConfirmEdit.lastName}"/></td>
            </tr>
            <tr>
                <td>Email</td>
                <td><c:out value="${userConfirmEdit.email}"/></td>
            </tr>
            <tr>
                <td>Hasło</td>
                <td><c:out value="${userConfirmEdit.password}"/></td>
            </tr>
            <tr>
                <td>Hasło</td>
                <td><c:out value="${userConfirmEdit.retypePassword}"/></td>
            </tr>
            <tr>
                <td>Uprawnienie admin</td>
                <td><c:out value="${userConfirmEdit.enabled}"/></td>
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
