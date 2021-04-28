<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
  <title>Document</title>
  <link rel="stylesheet" href="<c:url value="resources/css/style.css"/>"/>
</head>
<body>
<header class="header--form-page">
  <nav class="container container--70">
    <ul class="nav--actions">
      <li class="logged-user">
        Witaj Agata
        <ul class="dropdown">
          <li><a href="#">Zmień hasło</a></li>
          <li><a href="#">Wyloguj</a></li>
        </ul>
      </li>
    </ul>

    <ul>
      <li><a href="<c:url value="/form"/>" class="btn btn--without-border active">Start</a></li>
      <li><a href="<c:url value="/ownDonation"/>" class="btn btn--without-border">Moje darowizny</a></li>
      <li><a href="<c:url value="/userPersonalDetails"/>" class="btn btn--without-border">Moje dane</a></li>
      <li><a href="<c:url value="/contact"/>" class="btn btn--without-border">Zgłoś problem</a></li>
    </ul>
  </nav>
