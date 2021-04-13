<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="pl">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Document</title>
    <link rel="stylesheet" href="<c:url value="resources/css/style.css"/>" />
  </head>
  <body>
  <header>
    <nav class="container container--70">
      <ul class="nav--actions">
        <li><a href="<c:url value="/login"/>">Zaloguj</a></li>
        <li class="highlighted"><a href="<c:url value="/register"/>">Załóż konto</a></li>
      </ul>

      <ul>
        <li><a href="<c:url value="/admin"/>" class="btn btn--without-border active">Start</a></li>
        <li><a href="<c:url value="admin"/>"  class="btn btn--without-border">Użytkownicy</a></li>
        <li><a href="<c:url value="adminDonation"/>" class="btn btn--without-border">Darowizny</a></li>
        <li><a href="<c:url value="adminInstitution"/>" class="btn btn--without-border">Fundacje</a></li>
        <li><a href=#contact" class="btn btn--without-border">Kontakt</a></li>
      </ul>
    </nav>
  </header>


  <section class="login-page">
    <h2>Lista darowizn</h2>


    <table style="width:100%" border="1" cellpadding="9">

      <thead>
      <tr>
        <th>Id</th>
        <th>Data</th>
        <th>Godzina</th>
        <th>ilość</th>
        <th>Miasto</th>
        <th>Kod pocztowy</th>
        <th>Ulica</th>
        <th>Numer telefonu</th>
        <th>Usuń</th>

      </tr>
      </thead>
      <tbody>

      <c:forEach items="${adminDonation}" var="adminDonation">
      <tr>
        <td><c:out value="${adminDonation.id}"/></td>
        <td><c:out value="${adminDonation.pickUpDate}"/></td>
        <td><c:out value="${adminDonation.pickUpTime}"/></td>
        <td><c:out value="${adminDonation.quantity}"/></td>
        <td><c:out value="${adminDonation.city}"/></td>
        <td><c:out value="${adminDonation.zipCode}"/></td>
        <td><c:out value="${adminDonation.street}"/></td>
        <td><c:out value="${adminDonation.phoneNumber}"/></td>
        <td ><a href="/donationDelete/${adminDonation.id}">Usuń</a></td>
      </tr>
      </c:forEach>

      </tbody>
    </table>

  </section>

  <%@ include file="../footer.jsp" %>
  </body>
</html>
