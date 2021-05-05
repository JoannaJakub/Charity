<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="pl">
<%@ include file="../adminHeader.jsp" %>


  <section class="login-page">
    <h2>Lista fundacji</h2>


    <table style="width:100%" border="1" cellpadding="9">

      <thead>
      <tr>
        <th>Id</th>
        <th>Nazwa</th>
        <th>Opis</th>
        <th>Usuń</th>
        <th>Edytuj</th>
        <th>Szczegóły</th>
      </tr>
      </thead>
      <tbody>

      <c:forEach items="${adminInstitution}" var="adminInstitution">
      <tr>
        <td><c:out value="${adminInstitution.id}"/></td>
        <td><c:out value="${adminInstitution.name}"/></td>
        <td><c:out value="${adminInstitution.description}"/></td>
        <td ><a href="<c:url value="/institutionConfirmDelete/?id=${adminInstitution.id}"/>">Usuń</a></td>
        <td ><a href="<c:url value="/institutionEdit/${adminInstitution.id}"/>">Edytuj</a></td>
        <td ><a href="<c:url value="/institutionDetails/${adminInstitution.id}"/>">Szczegóły</a></td>
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
<section class="login-page">
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
    <c:forEach items="${institutionDonations}" var="institutionDonations">
      <tr>
        <td><c:out value="${institutionDonations.institution}"/></td>
        <td><c:out value="${institutionDonations.id}"/></td>
        <td><c:out value="${institutionDonations.pickUpDate}"/></td>
        <td><c:out value="${institutionDonations.pickUpTime}"/></td>
        <td><c:out value="${institutionDonations.quantity}"/></td>
        <td><c:out value="${institutionDonations.city}"/></td>
        <td><c:out value="${institutionDonations.zipCode}"/></td>
        <td><c:out value="${institutionDonations.street}"/></td>
        <td><c:out value="${institutionDonations.phoneNumber}"/></td>
        <td><a href="/donationDelete/${institutionDonations.id}">Usuń</a></td>
        <td><a href="/donationEdit/${institutionDonations.id}">Edytuj</a></td>
        <td><a href="/donationDetails/${institutionDonations.id}">Szczegóły</a></td>
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
<section class="login-page">
  <h2>Lista fundacji według kategorii</h2>
  <table style="width:100%" border="1" cellpadding="9">

    <thead>
    <tr>
      <th>Kategorie</th>
      <th>Instytucje</th>
    </tr>
    </thead>
    <tbody>

    <c:forEach items="${institutionCategories}" var="institutionCategories">
      <tr>
        <td><c:out value="${institutionCategories.institution}"/></td>
        <td><c:out value="${institutionCategories.categories}"/></td>

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
  </body>
</html>
