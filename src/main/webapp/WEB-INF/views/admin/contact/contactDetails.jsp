<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="pl">
<%@ include file="../adminHeader.jsp" %>


<section class="login-page" align="left">

    <h2>Szczegóły wiadomości</h2>

    <tbody>
    <table style="width:35%" cellpadding="15" class="btn btn--without-border-align active">
        <form:form items="${contactDetails}" var="contactDetails">
            <tr>
                <td>Kategoria</td>
                <td><c:out value="${contactDetails.contactCategory.name}"/></td>

            </tr>
            <tr>
                <td>ID</td>
                <td><c:out value="${id}"/></td>

            </tr>
            <tr>
                <td>Id użytkownika</td>
                <td><c:out value="${contactDetails.user.id}"/></td>
            </tr>
            <tr>
                <td>Imię</td>
                <td><c:out value="${contactDetails.name}"/></td>
            </tr>
            <tr>
                <td>Nazwisko</td>
                <td><c:out value="${contactDetails.surname}"/></td>
            </tr>
            <tr>
                <td>Email</td>
                <td><c:out value="${contactDetails.email}"/></td>
            </tr>
            <tr>
                <td>Wiadomość</td>
                <td><c:out value="${contactDetails.message}"/></td>
            </tr>
            <tr>
                <td>Data wysłania</td>
                <td><c:out value="${contactDetails.createdDate}"/></td>
            </tr>
            <tr>
                <td>Data modyfikacji</td>
                <td><c:out value="${contactDetails.updateDate}"/></td>
            </tr>
        </form:form>
        </tbody>
    </table>
    <div class="form-group form-group--buttons">
        <br>
        <a href="<c:url value="/adminContact"/>" class="btn btn--without-border">Powrót</a></li>
        <a href="<c:url value="/contactEdit/${contactDetails.id}"/>" class="btn btn--without-border">Edycja</a></li>
        <a href="<c:url value="/contactConfirmDelete/?id=${contactDetails.id}"/>"
           class="btn btn--without-border">Usuń</a></li>
    </div>

</section>

<script src="<c:url value="../resources/js/app.js"/>"></script>
</body>
</html>
