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
    <h2>Lista darowizn użytkownika

        <c:forEach items="${oneUserContacts}" var="oneUserContacts">
            <tr>
                <td><c:out value="${oneUserContacts.user.firstName}"/></td>
            </tr>
        </c:forEach>

    </h2>
    <h3>
        <table style="width:100%" border="1" cellpadding="9">

            <thead>
            <tr>
                <th>Id użytkownika</th>
                <th>Imie</th>
                <th>Nazwisko</th>
                <th>Email</th>
            </tr>
            </thead>
            <tbody>

            <c:forEach items="${oneUserContacts}" var="oneUserContacts">
                <tr>
                    <td><c:out value="${oneUserContacts.user.id}"/></td>
                    <td><c:out value="${oneUserContacts.name}"/></td>
                    <td><c:out value="${oneUserContacts.surname}"/></td>
                    <td><c:out value="${oneUserContacts.email}"/></td>
                </tr>
            </c:forEach>

            </tbody>
        </table>
    </h3>
    <table style="width:100%" border="1" cellpadding="9">

        <thead>
        <tr>
            <th>Id</th>
            <th>Treść</th>
            <th>Data wysłania</th>
            <th>Data modyfikacji</th>
            <th>Usuń</th>
            <th>Odpowiedz</th>


        </tr>
        </thead>
        <tbody>

        <c:forEach items="${oneUserContacts}" var="oneUserContacts">
            <tr>
                <td><c:out value="${oneUserContacts.id}"/></td>
                <td><c:out value="${oneUserContacts.message}"/></td>
                <td><c:out value="${oneUserContacts.createdDate}"/></td>
                <td><c:out value="${oneUserContacts.updateDate}"/></td>
                <td><a href="/donationDelete/${oneUserContacts.id}">Usuń</a></td>
                <td><a href="/donationEdit/${oneUserContacts.id}">Edytuj</a></td>
            </tr>
        </c:forEach>

        </tbody>
    </table>
    <br>
    <br>
    <br>
    <div class="form-group form-group--buttons">
        <a href="form" class="btn btn--without-border">Dodaj darowizne</a>
    </div>
</section>

</body>
</html>
