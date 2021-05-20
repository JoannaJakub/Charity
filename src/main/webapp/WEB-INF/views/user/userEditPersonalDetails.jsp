<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="pl">
<%@ include file="userHeader.jsp" %>

<section class="login-page">
    <h2>Szczegóły użytkownika</h2>
    <table style="width:35%" cellpadding="15" class="btn btn--without-border active">
        <form:form action="userEditPersonalDetailsConfirmation" modelAttribute="userEditPersonalDetails" method="post">
            <input type="hidden" name="user" value="${user.id}">
            <input type="hidden" name="user" value="${user.password}">
            <input type="hidden" name="user" value="${user.retypePassword}">
            <tr>
                <td>Imie</td>
                <td><form:input value="${userPersonalDetails.firstName}" path="firstName"/></td>
            </tr>
            <tr>
                <td>Nazwisko</td>
                <td><form:input value="${userPersonalDetails.lastName}" path="lastName"/></td>
            </tr>
            <tr>
                <td>Email</td>
                <td><form:input value="${userPersonalDetails.email}" path="email"/></td>
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
