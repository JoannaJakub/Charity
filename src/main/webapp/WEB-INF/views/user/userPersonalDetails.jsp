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
    <h2>Szczegóły użytkownika</h2>


    <table style="width:100%" border="1" cellpadding="9">

        <thead>
            <td>Id</td>
            <th>Email</th>
            <th>Imie</th>
            <th>Nazwisko</th>
            <th>Hasło</th>

        </thead>
        <tbody>

        <form:form items="${userPersonalDetails}" var="userPersonalDetails">
            <tr>
                <input type="hidden" name="user" value="${user.id}">
                <td><c:out value="${userPersonalDetails.id}"/></td>
                <td><c:out value="${userPersonalDetails.email}"/></td>
                <td><c:out value="${userPersonalDetails.firstName}"/></td>
                <td><c:out value="${userPersonalDetails.lastName}"/></td>
                <td><c:out value="${userPersonalDetails.password}"/></td>

            </tr>
        </form:form>


        </tbody>
    </table>
    <div class="form-group form-group--buttons">
        <br>
        <a href="<c:url value="/admin"/>" class="btn btn--without-border">Powrót</a></li>
        <a href="<c:url value="/userEdit/${userDetails.id}"/>" class="btn btn--without-border">Edycja</a></li>
        <a href="<c:url value="/userConfirmDelete/?id=${userDetails.id}"/>" class="btn btn--without-border">Usuń</a></li>
    </div>

</section>

<script src="<c:url value="../resources/js/app.js"/>"></script>
</body>
</html>
