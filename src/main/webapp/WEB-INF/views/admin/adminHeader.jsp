<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Document</title>
    <link rel="stylesheet" href="<c:url value="../resources/css/style.css"/>"/>
</head>
<body>
<header>
    <nav class="container container--70">
        <ul class="nav--actions">
            <li><a href="<c:url value="/login"/>">Zaloguj</a></li>
            <li class="highlighted"><a href="<c:url value="/register"/>">Załóż konto</a></li>
        </ul>
        <ul>
            <li><a href="<c:url value="/admin"/>" class="btn btn--without-border">Użytkownicy</a></li>
            <li><a href="<c:url value="/adminDonation"/>" class="btn btn--without-border">Darowizny</a></li>
            <li><a href="<c:url value="/adminInstitution"/>" class="btn btn--without-border">Fundacje</a></li>
            <li><a href="<c:url value="/adminCategory"/>" class="btn btn--without-border">Kategorie</a></li>
            <li><a href="<c:url value="/adminContact"/>" class="btn btn--without-border">Wiadomości</a></li>
        </ul>
    </nav>
    <title>Some relevant title</title>
</header>