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
            <li><a href="<c:url value="/adminCategory"/>" class="btn btn--without-border">Kategorie</a></li>
            <li><a href="<c:url value="#contactCategoryDivision"/>" class="btn btn--without-border">Wiadomości z podziałem na kategorie</a></li>
            <li><a href="<c:url value="#categoriesListInstitution"/>" class="btn btn--without-border">Lista kategorii wg fundacji</a></li>
            <li><a href="<c:url value="#contactCategoryList"/>" class="btn btn--without-border">Kategorie wiadomości</a></li>

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
            <th>Kategoria</th>
            <th>Data przesłania wiadomości</th>
            <th>Usuń</th>
            <th>Edytuj</th>
            <th>Szczegóły</th>
            <th>Wiadomości użytkownika</th>
            <th>Odpowiedz</th>

        </tr>
        </thead>
        <tbody>

        <c:forEach items="${adminContact}" var="adminContact">
            <tr>
                <td><c:out value="${adminContact.id}"/></td>
                <td><a href="<c:url value="/oneUserContacts/${adminContact.user.id}"/>"><c:out value="${adminContact.user.id}"/></a></td>
                <td><a href="<c:url value="/contactDetails/${adminContact.id}"/>"><c:out value="${adminContact.message}"/></a></td>
                <td><c:out value="${adminContact.contactCategory.name}"/></td>
                <td><c:out value="${adminContact.createdDate}"/></td>
                <td ><a href="<c:url value="/contactConfirmDelete/?id=${adminContact.id}"/>">Usuń</a></td>
                <td ><a href="<c:url value="/contactEdit/${adminContact.id}"/>">Edytuj</a></td>
                <td ><a href="<c:url value="/contactDetails/${adminContact.id}"/>">Szczegóły</a></td>
                <td ><a href="<c:url value="/oneUserContacts/${adminContact.user.id}"/>">Wiadomości użytkownika</a></td>
                <td ><a href="<c:url value="/contactReplay/${adminContact.id}"/>">Odpowiedz</a></td>
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

<section class="login-page" id="contactCategoryDivision">
    <h2>Wiadomości z podziałem na kategorie</h2>
    <table style="width:100%" border="1" cellpadding="9">

        <thead>
        <tr>
            <th>Kategoria</th>
            <th>Id</th>
            <th>Id użytkownika</th>
            <th>Wiadomość</th>
            <th>Data przesłania wiadomości</th>
            <th>Usuń</th>
            <th>Edytuj</th>
            <th>Szczegóły</th>
            <th>Wiadomości użytkownika</th>
            <th>Odpowiedz</th>

        </tr>
        </thead>
        <tbody>

        <c:forEach items="${adminContact}" var="adminContact">
            <tr>
                <td><c:out value="${adminContact.contactCategory.name}"/></td>
                <td><c:out value="${adminContact.id}"/></td>
                <td><a href="<c:url value="/oneUserContacts/${adminContact.user.id}"/>"><c:out value="${adminContact.user.id}"/></a></td>
                <td><a href="<c:url value="/contactDetails/${adminContact.id}"/>"><c:out value="${adminContact.message}"/></a></td>
                <td><c:out value="${adminContact.createdDate}"/></td>
                <td ><a href="<c:url value="/contactConfirmDelete/?id=${adminContact.id}"/>">Usuń</a></td>
                <td ><a href="<c:url value="/contactEdit/${adminContact.id}"/>">Edytuj</a></td>
                <td ><a href="<c:url value="/contactDetails/${adminContact.id}"/>">Szczegóły</a></td>
                <td ><a href="<c:url value="/oneUserContacts/${adminContact.user.id}"/>">Wiadomości użytkownika</a></td>
                <td ><a href="<c:url value="/contactReplay/${adminContact.id}"/>">Odpowiedz</a></td>
            </tr>
        </c:forEach>

        </tbody>
    </table>
    <br>
    <br>
    <br>
    <div class="form-group form-group--buttons">
        <a href="<c:url value="/contactCategoryAdd"/>" class="btn btn--without-border">Dodaj darowizne</a>
    </div>
</section>
<section class="login-page" id="contactCategoryList">
    <h2>Lista kategorii wiadomości</h2>
    <table style="width:100%" border="1" cellpadding="9">

        <thead>
        <tr>
            <th>Id</th>
            <th>Kategoria</th>
        </tr>
        </thead>
        <tbody>

        <c:forEach items="${contactCategoryList}" var="contactCategoryList">
            <tr>
                <td><c:out value="${contactCategoryList.id}"/></td>
                <td><c:out value="${contactCategoryList.name}"/></td>

            </tr>
        </c:forEach>

        </tbody>
    </table>
    <br>
    <br>
    <br>
    <div class="form-group form-group--buttons">
        <a href="<c:url value="/contactCategoryAdd"/>" class="btn btn--without-border">Dodaj kategorie</a>
    </div>
</section>

</body>
</html>
