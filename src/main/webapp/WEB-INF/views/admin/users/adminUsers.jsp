<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="pl">
<%@ include file="../adminHeader.jsp" %>

<header>
    <nav class="container container--70">
        <ul>
            <li><a href="<c:url value="#users"/>" class="btn btn--without-border">Lista użytkowników</a></li>
            <li><a href="<c:url value="#userDonations"/>" class="btn btn--without-border">Użytkownicy z darowiznami</a>
            </li>
            <li><a href="<c:url value="#contactsUsers"/>" class="btn btn--without-border">Lista użytkowników z
                pytaniami</a></li>
            <li><a href="<c:url value="/register"/>" class="btn btn--without-border">Dodaj użytkownika</a></li>
        </ul>
    </nav>
</header>
<section class="login-page" id="users">
    <h2>Lista użytkowników</h2>
    <table>
        <thead>
        <tr>
            <th>Id</th>
            <th>Email</th>
            <th>Enabled</th>
            <th>Imie</th>
            <th>Nazwisko</th>
            <th>Usuń</th>
            <th>Edytuj</th>
            <th>Szczegóły</th>
            <th>Darowizny użytkownika</th>
            <th>Wiadomości użytkownika</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${admin}" var="admin">
            <tr>
                <td><a href="<c:url value="/userDetails/${admin.id}"/>"><c:out
                        value="${admin.id}"/></a></td>
                <td><a href="<c:url value="/userDetails/${admin.id}"/>"><c:out
                        value="${admin.email}"/></a></td>
                <td><c:out value="${admin.enabled}"/></td>
                <td><c:out value="${admin.firstName}"/></td>
                <td><c:out value="${admin.lastName}"/></td>
                <td><a href="<c:url value="/userConfirmDelete/?id=${admin.id}"/>">Usuń</a></td>
                <td><a href="<c:url value="/userEdit/${admin.id}"/>">Edytuj</a></td>
                <td><a href="<c:url value="/userDetails/${admin.id}"/>">Szczegóły</a></td>
                <td><a href="<c:url value="/oneUserDonations/${admin.id}"/>">Darowizny użytkownika</a></td>
                <td><a href="<c:url value="/oneUserContacts/${admin.id}"/>">Wiadomości użytkownika</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <br>
    <br>
    <br>
    <div class="form-group form-group--buttons">
        <a href="<c:url value="/register"/>" class="btn btn--without-border">Dodaj użytkownika</a>
    </div>
</section>
<section class="login-page" id="userDonations">
    <h2>Lista użytkowników i ich darowizny
    </h2>
    <table>
        <thead>
        <tr>
            <th>Id użytkownika</th>
            <th>Użytkownik</th>
            <th>Id</th>
            <th>Data</th>
            <th>Godzina</th>
            <th>ilość</th>
            <th>Miasto</th>
            <th>Kod pocztowy</th>
            <th>Ulica</th>
            <th>Numer telefonu</th>
            <th>Usuń</th>
            <th>Edytuj</th>
            <th>Szczegóły</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${usersDonation}" var="usersDonation">
            <tr>
                <td><a href="<c:url value="/userDetails/${usersDonation.user.id}"/>"><c:out
                        value="${usersDonation.user.id}"/></a></td>
                <td><a href="<c:url value="/userDetails/${usersDonation.user.id}"/>"><c:out
                        value="${usersDonation.user.email}"/></a></td>
                <td><a href="<c:url value="/donationDetails/${usersDonation.id}"/>"><c:out
                        value="${usersDonation.id}"/></a></td>
                <td><c:out value="${usersDonation.pickUpDate}"/></td>
                <td><c:out value="${usersDonation.pickUpTime}"/></td>
                <td><c:out value="${usersDonation.quantity}"/></td>
                <td><c:out value="${usersDonation.city}"/></td>
                <td><c:out value="${usersDonation.zipCode}"/></td>
                <td><c:out value="${usersDonation.street}"/></td>
                <td><c:out value="${usersDonation.phoneNumber}"/></td>
                <td><a href="/donationDelete/${usersDonation.id}">Usuń</a></td>
                <td><a href="/donationEdit/${usersDonation.id}">Edytuj</a></td>
                <td><a href="/donationDetails/${usersDonation.id}">Szczegóły</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <br>
    <br>
    <br>
    <div class="form-group form-group--buttons">
        <a href="<c:url value="/adminForm"/>" class="btn btn--without-border">Dodaj darowizne</a>
    </div>
</section>
<section class="login-page" id="contactsUsers">
    <h2>Lista użytkowników z pytaniami</h2>
    <table>
        <thead>
        <tr>
            <th>Id użytkownika</th>
            <th>Email użytkownika</th>
            <th>Id wiadomości</th>
            <th>Wiadomość</th>
            <th>Kategoria</th>
            <th>Szczegóły</th>
            <th>Data przesłania wiadomości</th>
            <th>Wiadomości użytkownika</th>
            <th>Odpowiedz</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${contactsUsers}" var="contactsUsers">
            <tr>
                <td><a href="<c:url value="/oneUserContacts/${contactsUsers.user.id}"/>"><c:out
                        value="${contactsUsers.user.id}"/></a></td>
                <td><a href="<c:url value="/oneUserContacts/${contactsUsers.user.id}"/>"><c:out
                        value="${contactsUsers.user.email}"/></a></td>
                <td><a href="<c:url value="/contactDetails/${contactsUsers.id}"/>"><c:out
                        value="${contactsUsers.id}"/></a></td>
                <td><a href="<c:url value="/contactDetails/${contactsUsers.id}"/>"><c:out
                        value="${contactsUsers.message}"/></a></td>
                <td><a href="<c:url value="/contactByCategory/${contactsUsers.contactCategory.id}"/>"><c:out
                        value="${contactsUsers.contactCategory.name}"/></a></td>
                <td><a href="<c:url value="/contactDetails/${contactsUsers.id}"/>">Szczegóły</a></td>
                <td><c:out value="${contactsUsers.createdDate}"/></td>
                <td><a href="<c:url value="/oneUserContacts/${contactsUsers.user.id}"/>">Wiadomości użytkownika</a></td>
                <td><a href="<c:url value="/contactReplay/${contactsUsers.id}"/>">Odpowiedz</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <br>
    <br>
    <br>
    <div class="form-group form-group--buttons">
        <a href="<c:url value="/contactAddAdmin"/>" class="btn btn--without-border">Dodaj wiadomość</a>
    </div>
</section>
</html>
