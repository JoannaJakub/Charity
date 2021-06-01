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
    <h2>Moje wiadomości
    </h2>
    <table>
        <tr>
            <th>Id</th>
            <th>Treść</th>
            <th>Data wysłania</th>
            <th>Data modyfikacji</th>
            <th>Kategoria</th>
            <th>Zamknij</th>
            <th>Edytuj</th>
            <th>Szczegóły</th>
        </tr>
        <c:forEach items="${contactsOfUser}" var="contactsOfUser">
            <tr>
                <td><c:out value="${contactsOfUser.id}"/></td>
                <td><c:out value="${contactsOfUser.message}"/></td>
                <td><c:out value="${contactsOfUser.createdDate}"/></td>
                <td><c:out value="${contactsOfUser.updateDate}"/></td>
                <td><c:out value="${contactsOfUser.contactCategory.name}"/></td>
                <td><a href="<c:url value="/contactConfirmDeleteByUser/?id=${contactsOfUser.id}"/>">Zamknij</a></td>
                <td><a href="/contactEditByUser/${contactsOfUser.id}">Edytuj</a></td>
                <td><a href="/contactDetailsByUser/${contactsOfUser.id}">Szczegóły</a></td>
            </tr>
        </c:forEach>
    </table>
    <br>
    <br>
    <br>
    <div class="form-group form-group--buttons">
        <a href="<c:url value="/contactAddByUser"/>" class="btn btn--without-border">Dodaj wiadomość</a>
    </div>
</section>
</body>
</html>
