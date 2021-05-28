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
            <li><a href="<c:url value="/adminContact/#contactsList"/>" class="btn btn--without-border">Lista wiadomości</a></li>
            <li><a href="<c:url value="/adminContact/#contactCategoryDivision"/>" class="btn btn--without-border">Wiadomości z podziałem na kategorie</a></li>
            <li><a href="<c:url value="/adminContact/#categoriesListInstitution"/>" class="btn btn--without-border">Lista kategorii wg fundacji</a></li>
            <li><a href="<c:url value="/adminContact/#contactCategoryList"/>" class="btn btn--without-border">Kategorie wiadomości</a></li>

        </ul>
    </nav>
</header>

<section class="login-page" id="contactCategoryDivision">
    <h2>Wiadomości z podziałem na kategorie </h2>
    <table style="width:100%" border="1" cellpadding="9">

        <thead>
        <tr>
            <th>Kategoria</th>
            <th>Id</th>
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

        <c:forEach items="${contactByCategory}" var="contactByCategory">
            <tr>
                <td><c:out value="${contactByCategory.contactCategory.name}"/></td>
                <td><c:out value="${contactByCategory.id}"/></td>
                <td><c:out value="${contactByCategory.message}"/></td>
                <td><c:out value="${contactByCategory.createdDate}"/></td>
                <td ><a href="<c:url value="/contactConfirmDelete/?id=${adminContactq.id}"/>">Usuń</a></td>
                <td ><a href="<c:url value="/contactEdit/${adminContactq.id}"/>">Edytuj</a></td>
                <td ><a href="<c:url value="/contactDetails/${adminContactq.id}"/>">Szczegóły</a></td>
                <td ><a href="<c:url value="/oneUserContacts/${adminContactq.user.id}"/>">Wiadomości użytkownika</a></td>
                <td ><a href="<c:url value="/contactReplay/${adminContactq.id}"/>">Odpowiedz</a></td>
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

</body>
</html>
