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

    <form:form modelAttribute="changePassword" method="post">
        <input type="hidden" name="user" value="${user.id}">
        <tr>
            <td><c:out value="${id}"/></td>
            <td>Hasło</td>
            <td><form:input path="password"/></td>
        </tr>
        <tr>
            <td>Hasło</td>
            <td><form:input path="retypePassword"/></td>
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

</section>

<script src="<c:url value="../resources/js/app.js"/>"></script>
</body>
</html>
