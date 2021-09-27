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
            <li><a href="<c:url value="#contactCategoryDivision"/>" class="btn btn--without-border">Wiadomości z
                podziałem na kategorie</a></li>
            <li><a href="<c:url value="#contactsUsers"/>" class="btn btn--without-border">Lista użytkowników z
                pytaniami</a></li>
            <li><a href="<c:url value="/contactAddAdmin"/>" class="btn btn--without-border">Dodaj wiadomość</a></li>
            <li><a href="<c:url value="#contactCategoryList"/>" class="btn btn--without-border">Kategorie wiadomości</a>
            </li>
        </ul>
    </nav>
</header>
<section class="login-page" id="contactsList">
    <h2>Lista wiadomości</h2>
    <table>
        <thead>
        <tr>
            <th>Id</th>
            <th>Wiadomość</th>
            <th>Kategoria</th>
            <th>Data przesłania wiadomości</th>
            <th>Id użytkownika</th>
            <th>Email użytkownika</th>
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
                <td><a href="<c:url value="/contactDetails/${adminContact.id}"/>"><c:out
                        value="${adminContact.id}"/></a></td>
                <td><a href="<c:url value="/contactDetails/${adminContact.id}"/>"><c:out
                        value="${adminContact.message}"/></a></td>
                <td><a href="<c:url value="/contactByCategory/${adminContact.contactCategory.id}"/>"><c:out
                        value="${adminContact.contactCategory.name}"/></a></td>
                <td><c:out value="${adminContact.createdDate}"/></td>
                <td><a href="<c:url value="/userDetails/${adminContact.user.id}"/>"><c:out
                        value="${adminContact.user.id}"/></a></td>
                <td><a href="<c:url value="/userDetails/${adminContact.user.id}"/>"><c:out
                        value="${adminContact.email}"/></a></td>
                <td><a href="<c:url value="/contactConfirmDelete/?id=${adminContact.id}"/>">Usuń</a></td>
                <td><a href="<c:url value="/contactEdit/${adminContact.id}"/>">Edytuj</a></td>
                <td><a href="<c:url value="/contactDetails/${adminContact.id}"/>">Szczegóły</a></td>
                <td><a href="<c:url value="/oneUserContacts/${adminContact.user.id}"/>">Wiadomości użytkownika</a></td>
                <td><a href="<c:url value="/contactReplay/${adminContact.id}"/>">Odpowiedz</a></td>
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
<section class="login-page" id="contactsUsers">
    <h2>Lista użytkowników z pytaniami</h2>
    <table>
        <thead>
        <tr>
            <th>Id użytkownika</th>
            <th>Email użytkownika</th>
            <th>Id</th>
            <th>Wiadomość</th>
            <th>Kategoria</th>
            <th>Data przesłania wiadomości</th>
            <th>Wiadomości użytkownika</th>
            <th>Odpowiedz</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${contactsUsers}" var="contactsUsers">
            <tr>
                <td><a href="<c:url value="/userDetails/${contactsUsers.user.id}"/>"><c:out
                        value="${contactsUsers.user.id}"/></a></td>
                <td><a href="<c:url value="/userDetails/${contactsUsers.user.id}"/>"><c:out
                        value="${contactsUsers.user.email}"/></a></td>
                <td><a href="<c:url value="/contactDetails/${contactsUsers.id}"/>"><c:out
                        value="${contactsUsers.id}"/></a></td>
                <td><a href="<c:url value="/contactDetails/${contactsUsers.id}"/>"><c:out
                        value="${contactsUsers.message}"/></a></td>
                <td><a href="<c:url value="/contactByCategory/${contactsUsers.contactCategory.id}"/>"><c:out
                        value="${contactsUsers.contactCategory.name}"/></a></td>
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
<section class="login-page" id="contactCategoryDivision">
    <h2>Wiadomości z podziałem na kategorie</h2>
    <table>
        <thead>
        <tr>
            <th>Id kategorii</th>
            <th>Kategoria</th>
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
        <c:forEach items="${adminContactq}" var="adminContactq">
            <tr>
                <td><a href="<c:url value="/contactByCategory/${adminContactq.contactCategory.id}"/>"><c:out
                        value="${adminContactq.contactCategory.id}"/></a></td>
                <td><a href="<c:url value="/contactByCategory/${adminContactq.contactCategory.id}"/>"><c:out
                        value="${adminContactq.contactCategory.name}"/></a></td>
                <td><a href="<c:url value="/userDetails/${adminContactq.user.id}"/>"><c:out
                        value="${adminContactq.user.id}"/></a></td>
                <td><a href="<c:url value="/userDetails/${adminContactq.id}"/>"><c:out
                        value="${adminContactq.message}"/></a></td>
                <td><c:out value="${adminContactq.createdDate}"/></td>
                <td><a href="<c:url value="/contactConfirmDelete/?id=${adminContactq.id}"/>">Usuń</a></td>
                <td><a href="<c:url value="/contactEdit/${adminContactq.id}"/>">Edytuj</a></td>
                <td><a href="<c:url value="/contactDetails/${adminContactq.id}"/>">Szczegóły</a></td>
                <td><a href="<c:url value="/oneUserContacts/${adminContactq.user.id}"/>">Wiadomości użytkownika</a></td>
                <td><a href="<c:url value="/contactReplay/${adminContactq.id}"/>">Odpowiedz</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <br>
    <br>
    <br>
    <div class="form-group form-group--buttons">
        <a href="<c:url value="/contactCategoryAdd"/>" class="btn btn--without-border">Dodaj kategorie wiadomości</a>
    </div>
</section>
<section class="login-page" id="contactCategoryList">
    <h2>Lista kategorii wiadomości</h2>
    <table>
        <thead>
        <tr>
            <th>Id</th>
            <th>Kategoria</th>
            <th>Lista wiadomości</th>
            <th>Usuń</th>
            <th>Edytuj</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${contactCategoryList}" var="contactCategoryList">
            <tr>
                <td><c:out value="${contactCategoryList.id}"/></td>
                <td><a href="<c:url value="/contactByCategory/${contactCategoryList.id}"/>"><c:out
                        value="${contactCategoryList.name}"/><a/></td>
                <td><a href="<c:url value="/contactByCategory/${contactCategoryList.id}"/>">Lista wiadomości<a/></td>
                <td><a href="<c:url value="/contactCategoryConfirmDelete/?id=${contactCategoryList.id}"/>">Usuń</a></td>
                <td><a href="<c:url value="/contactCategoryEdit/${contactCategoryList.id}"/>">Edytuj</a></td>
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
