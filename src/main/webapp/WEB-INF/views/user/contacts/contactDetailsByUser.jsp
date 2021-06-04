<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="pl">
<%@ include file="../userHeader.jsp" %>

<section class="login-page" align="left">
    <h2>Szczegóły wiadomości</h2>
    <tbody>
    <table class="btn btn--without-border-align active">
        <form:form items="${contactDetailsByUser}" var="contactDetailsByUser">
            <tr>
                <td>Kategoria</td>
                <td><c:out value="${contactDetailsByUser.contactCategory.name}"/></td>
            </tr>
            <tr>
                <td>Imię</td>
                <td><c:out value="${contactDetailsByUser.name}"/></td>
            </tr>
            <tr>
                <td>Nazwisko</td>
                <td><c:out value="${contactDetailsByUser.surname}"/></td>
            </tr>
            <tr>
                <td>Email</td>
                <td><c:out value="${contactDetailsByUser.email}"/></td>
            </tr>
            <tr>
                <td>Wiadomość</td>
                <td><c:out value="${contactDetailsByUser.message}"/></td>
            </tr>
            <tr>
                <td>Data wysłania</td>
                <td><c:out value="${contactDetailsByUser.createdDate}"/></td>
            </tr>
            <tr>
                <td>Data modyfikacji</td>
                <td><c:out value="${contactDetailsByUser.updateDate}"/></td>
            </tr>
        </form:form>
        </tbody>
    </table>
    <div class="form-group form-group--buttons">
        <br>
        <a href="<c:url value="/contactsOfUser"/>" class="btn btn--without-border">Powrót</a></li>
        <a href="<c:url value="/contactEditByUser/${contactDetailsByUser.id}"/>"
           class="btn btn--without-border">Edycja</a></li>
        <a href="<c:url value="/contactConfirmDeleteByUser/?id=${contactDetailsByUser.id}"/>"
           class="btn btn--without-border">Usuń</a></li>
    </div>
</section>
</body>
</html>
