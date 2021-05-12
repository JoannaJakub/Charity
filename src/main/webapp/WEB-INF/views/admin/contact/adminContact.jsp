<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Document</title>
    <link rel="stylesheet" href="<c:url value="resources/css/style.css"/>"/>
</head>
<body>
<%@ include file="../adminHeader.jsp" %>
<header>
    <nav class="container container--70">
        <ul>
            <li><a href="<c:url value="#contactsList"/>" class="btn btn--without-border">Lista wiadomości</a></li>
            <li><a href="<c:url value="/adminCategory"/>" class="btn btn--without-border">Ostatnia kategoria</a></li>
            <li><a href="<c:url value="#categoriesListDonations"/>" class="btn btn--without-border">Lista kategorii wg darowizn</a></li>
            <li><a href="<c:url value="#categoriesListInstitution"/>" class="btn btn--without-border">Lista kategorii wg fundacji</a></li>
            <li><a href="<c:url value="/categoryAdd"/>" class="btn btn--without-border">Dodaj kategorie</a></li>

        </ul>
    </nav>
</header>

<section class="login-page" id="contactsList">
    <h2>Lista wiadomości</h2>


    <table style="width:100%" border="1" cellpadding="9">

        <thead>
        <tr>
            <th>Id</th>
            <th>Id użytkownika</th>
            <th>Wiadomość</th>
            <th>Data przesłania wiadomości</th>
            <th>Usuń</th>
            <th>Edytuj</th>
            <th>Szczegóły</th>
            <th>Darowizny użytkownika</th>

        </tr>
        </thead>
        <tbody>

        <c:forEach items="${adminContact}" var="adminContact">
            <tr>
                <td><c:out value="${adminContact.id}"/></td>
                <td><c:out value="${adminContact.user.id}"/></td>
                <td><c:out value="${adminContact.message}"/></td>
                <td><c:out value="${adminContact.createdDate}"/></td>
                <td ><a href="<c:url value="/contactConfirmDelete/?id=${adminContact.id}"/>">Usuń</a></td>
                <td ><a href="<c:url value="/contactEdit/${adminContact.id}"/>">Edytuj</a></td>
                <td ><a href="<c:url value="/contactDetails/${adminContact.id}"/>">Szczegóły</a></td>
                <td ><a href="<c:url value="/oneUserDonations/${adminContact.id}"/>">Darowizny użytkownika</a></td>
            </tr>
        </c:forEach>

        </tbody>
    </table>
    <br>
    <br>
    <br>
    <div class="form-group form-group--buttons">
        <a href="register" class="btn btn--without-border">Dodaj użytkownika</a>
    </div>
</section>

<section class="login-page" id="categoriesListDonations">
    <h2>Lista kategorii wg darowizn</h2>
    <table style="width:100%" border="1" cellpadding="9">

        <thead>
        <tr>
            <th>Id</th>
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
        <c:forEach items="${categoryDonations}" var="categoryDonations">
            <tr>
                <td><c:out value="${categoryDonations.categories}"/></td>
                <td><c:out value="${categoryDonations.id}"/></td>
                <td><c:out value="${categoryDonations.pickUpDate}"/></td>
                <td><c:out value="${categoryDonations.pickUpTime}"/></td>
                <td><c:out value="${categoryDonations.quantity}"/></td>
                <td><c:out value="${categoryDonations.city}"/></td>
                <td><c:out value="${categoryDonations.zipCode}"/></td>
                <td><c:out value="${categoryDonations.street}"/></td>
                <td><c:out value="${categoryDonations.phoneNumber}"/></td>
                <td><a href="/donationDelete/${categoryDonations.id}">Usuń</a></td>
                <td><a href="/donationEdit/${categoryDonations.id}">Edytuj</a></td>
                <td><a href="/donationDetails/${categoryDonations.id}">Szczegóły</a></td>
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
<section class="login-page" id="categoriesListInstitution">
    <h2>Lista kategorii według fundacji</h2>
    <table style="width:100%" border="1" cellpadding="9">

        <thead>
        <tr>
            <th>Kategorie</th>
            <th>Instytucje</th>
        </tr>
        </thead>
        <tbody>

        <c:forEach items="${categoryInstitutions}" var="categoryInstitutions">
            <tr>
                <td><c:out value="${categoryInstitutions.categories}"/></td>
                <td><c:out value="${categoryInstitutions.institution}"/></td>

            </tr>
        </c:forEach>

        </tbody>
    </table>
    <br>
    <br>
    <br>
    <div class="form-group form-group--buttons">
        <a href="<c:url value="/institutionAdd"/>" class="btn btn--without-border">Dodaj fundacje</a>
    </div>
</section>

</body>
</html>
