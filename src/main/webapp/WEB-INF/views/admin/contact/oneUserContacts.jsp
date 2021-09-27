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
    <h2>Lista wiadomości użytkownika
        <c:forEach items="${oneUserContacts}" var="oneUserContacts">
            <tr>
                <td><c:out value="${oneUserContacts.user.email}"/></td>
            </tr>
        </c:forEach>
    </h2>
    <h3>
        <table>

            <thead>
            <tr>
                <th>Id użytkownika</th>
                <th>Imie</th>
                <th>Nazwisko</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${oneUserContacts}" var="oneUserContacts">
                <tr>
                    <td><a href="<c:url value="/userDetails/${oneUserContacts.user.id}"/>"><c:out
                            value="${oneUserContacts.user.id}"/></a></td>
                    <td><a href="<c:url value="/userDetails/${oneUserContacts.user.id}"/>"><c:out
                            value="${oneUserContacts.user.firstName}"/></a></td>
                    <td><a href="<c:url value="/userDetails/${oneUserContacts.user.id}"/>"><c:out
                            value="${oneUserContacts.user.lastName}"/></a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </h3>
    <br>
    <br>
    <table>
        <thead>
        <tr>
            <th>Id</th>
            <th>Treść</th>
            <th>Data wysłania</th>
            <th>Data modyfikacji</th>
            <th>Usuń</th>
            <th>Odpowiedz</th>
            <th>Szczegóły</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${oneUserContacts}" var="oneUserContacts">
            <tr>
                <td><c:out value="${oneUserContacts.id}"/></td>
                <td><a href="<c:url value="/contactDetails/${oneUserContacts.id}"/>"><c:out
                        value="${oneUserContacts.message}"/></a></td>
                <td><c:out value="${oneUserContacts.createdDate}"/></td>
                <td><c:out value="${oneUserContacts.updateDate}"/></td>
                <td><a href="<c:url value="/contactConfirmDelete/?id=${oneUserContacts.id}"/>">Usuń</a></td>
                <td><a href="<c:url value="/contactEdit/${oneUserContacts.id}"/>">Edytuj</a></td>
                <td><a href="<c:url value="/contactDetails/${oneUserContacts.id}"/>">Szczegóły</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <br>
    <div class="form-group form-group--buttons">
        <a href="<c:url value="/contactAddAdmin"/>" class="btn btn--without-border">Dodaj wiadomość</a>
    </div>
</section>
</body>
</html>
