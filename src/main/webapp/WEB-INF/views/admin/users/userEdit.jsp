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

    <h2>Edycja użytkownika</h2>

    <tbody>
    <table class="btn btn--without-border-align active">
        <form:form method="post" modelAttribute="userEdit">
            <tr>
                <td>ID</td>
                <td><c:out value="${id}"/></td>

            </tr>
            <tr>
                <td>Imie</td>
                <td><form:input path="firstName"/></td>
            </tr>
            <tr>
                <td>Nazwisko</td>
                <td><form:input path="lastName"/></td>
            </tr>
            <tr>
                <td>Email</td>
                <td><form:input path="email"/></td>
            </tr>
            <tr>
                <td>Hasło</td>
                <td><form:input path="password"/></td>
            </tr>
            <tr>
            <td>Hasło</td>
            <td><form:input path="retypePassword"/></td>
            </tr>
            <tr>
                <td>Uprawnienie admin</td>
                <td><form:input path="enabled"/></td>
            </tr>
            <tr>
                <td>
                    <a href="<c:url value="/admin"/>" class="btn btn--without-active">Powrót</a></li>
                </td>
                <td>
                    <button type="submit" class="btn btn--without-active"/>Zapisz</button>
                </td>
            </tr>

        </form:form>
        </tbody>
    </table>

</section>

<script src="<c:url value="../resources/js/app.js"/>"></script>
</body>
</html>
