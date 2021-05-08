<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="pl">
<%@ include file="../adminHeader.jsp" %>
<header>
  <nav class="container container--70">
    <ul>
      <li><a href="<c:url value="#donationsList"/>" class="btn btn--without-border">Lista darowizn</a></li>
      <li><a href="<c:url value="#lastDonation"/>" class="btn btn--without-border">Ostatnia darowizna</a></li>
      <li><a href="<c:url value="#donationsListCategory"/>" class="btn btn--without-border">Lista darowizn wg kategorii</a></li>
      <li><a href="<c:url value="#donationsListInstitution"/>" class="btn btn--without-border">Lista darowizn wg fundacji</a></li>
      <li><a href="<c:url value="/adminForm"/>" class="btn btn--without-border">Dodaj darowizne</a></li>

    </ul>
  </nav>
</header>


  <section class="login-page" id="donationsList">
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
        <th>Edytuj</th>
        <th>Szczegóły</th>

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
        <td ><a href="<c:url value="/donationConfirmDelete/?id=${adminDonation.id}"/>">Usuń</a></td>
        <td ><a href="<c:url value="/donationEdit/${adminDonation.id}"/>">Edytuj</a></td>
        <td ><a href="<c:url value="/donationDetails/${adminDonation.id}"/>">Szczegóły</a></td>
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

<section class="login-page" id="lastDonation">
  <h2>Ostatnio dodana darowizna</h2>
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
      <th>Edytuj</th>
      <th>Szczegóły</th>

    </tr>
    </thead>
    <tbody>

    <c:forEach items="${lastDonation}" var="lastDonation">
      <tr>
        <td><c:out value="${lastDonation.id}"/></td>
        <td><c:out value="${lastDonation.pickUpDate}"/></td>
        <td><c:out value="${lastDonation.pickUpTime}"/></td>
        <td><c:out value="${lastDonation.quantity}"/></td>
        <td><c:out value="${lastDonation.city}"/></td>
        <td><c:out value="${lastDonation.zipCode}"/></td>
        <td><c:out value="${lastDonation.street}"/></td>
        <td><c:out value="${lastDonation.phoneNumber}"/></td>
        <td ><a href="<c:url value="/donationConfirmDelete/?id=${lastDonation.id}"/>">Usuń</a></td>
        <td ><a href="<c:url value="/donationEdit/${lastDonation.id}"/>">Edytuj</a></td>
        <td ><a href="<c:url value="/donationDetails/${lastDonation.id}"/>">Szczegóły</a></td>
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
<section class="login-page" id="donationsListCategory">
  <h2>Lista darowizn wg kategorii</h2>
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
    <c:forEach items="${donationCategories}" var="donationCategories">
      <tr>
        <td><c:out value="${donationCategories.categories}"/></td>
        <td><c:out value="${donationCategories.id}"/></td>
        <td><c:out value="${donationCategories.pickUpDate}"/></td>
        <td><c:out value="${donationCategories.pickUpTime}"/></td>
        <td><c:out value="${donationCategories.quantity}"/></td>
        <td><c:out value="${donationCategories.city}"/></td>
        <td><c:out value="${donationCategories.zipCode}"/></td>
        <td><c:out value="${donationCategories.street}"/></td>
        <td><c:out value="${donationCategories.phoneNumber}"/></td>
        <td><a href="/donationDelete/${donationCategories.id}">Usuń</a></td>
        <td><a href="/donationEdit/${donationCategories.id}">Edytuj</a></td>
        <td><a href="/donationDetails/${donationCategories.id}">Szczegóły</a></td>
      </tr>
    </c:forEach>

    </tbody>
  </table>
  <br>
  <br>
  <br>
  <div class="form-group form-group--buttons">
    <a href="<c:url value="/categoryAdd"/>" class="btn btn--without-border">Dodaj kategorie</a>
  </div>
</section>
<section class="login-page" id="donationsListInstitution">
  <h2>Lista darowizn wg fundacji</h2>
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
    <c:forEach items="${donationInstitutions}" var="donationInstitutions">
      <tr>
        <td><c:out value="${donationInstitutions.institution}"/></td>
        <td><c:out value="${donationInstitutions.id}"/></td>
        <td><c:out value="${donationInstitutions.pickUpDate}"/></td>
        <td><c:out value="${donationInstitutions.pickUpTime}"/></td>
        <td><c:out value="${donationInstitutions.quantity}"/></td>
        <td><c:out value="${donationInstitutions.city}"/></td>
        <td><c:out value="${donationInstitutions.zipCode}"/></td>
        <td><c:out value="${donationInstitutions.street}"/></td>
        <td><c:out value="${donationInstitutions.phoneNumber}"/></td>
        <td><a href="/donationDelete/${donationInstitutions.id}">Usuń</a></td>
        <td><a href="/donationEdit/${institutionDonations.id}">Edytuj</a></td>
        <td><a href="/donationDetails/${donationInstitutions.id}">Szczegóły</a></td>
      </tr>
    </c:forEach>

    </tbody>
  </table>
  <br>
  <br>
  <br>
  <div class="form-group form-group--buttons">
    <a href="<c:url value="/institutionAdd"/>" class="btn btn--without-border">Dodaj instytucje</a>
  </div>
</section>
  </body>
</html>
