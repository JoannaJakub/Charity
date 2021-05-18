<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="pl">
<%@ include file="userHeader.jsp" %>


  <section class="login-page">
    <h2>Lista darowizn</h2>


    <table style="width:100%" border="1" cellpadding="9">

      <thead>
      <tr>
        <th>Data</th>
        <th>Godzina</th>
        <th>ilość</th>
        <th>Miasto</th>
        <th>Kod pocztowy</th>
        <th>Ulica</th>
        <th>Numer telefonu</th>
        <th>Dla Fundacji</th>
        <th>Usuń</th>
        <th>Edytuj</th>
        <th>Szczegóły</th>

      </tr>
      </thead>
      <tbody>

      <c:forEach items="${ownDonation}" var="ownDonation">
        <input type="hidden" name="user" value="${user.id}">
      <tr>
        <td><c:out value="${ownDonation.pickUpDate}"/></td>
        <td><c:out value="${ownDonation.pickUpTime}"/></td>
        <td><c:out value="${ownDonation.quantity}"/></td>
        <td><c:out value="${ownDonation.city}"/></td>
        <td><c:out value="${ownDonation.zipCode}"/></td>
        <td><c:out value="${ownDonation.street}"/></td>
        <td><c:out value="${ownDonation.phoneNumber}"/></td>
        <td><c:out value="${ownDonation.institution.name}"/></td>
        <td ><a href="/donationConfirmDeleteByUser/?id=${ownDonation.id}">Usuń</a></td>
        <td ><a href="/ownDonationEdit/${ownDonation.id}">Edytuj</a></td>
        <td ><a href="/donationDetails/${ownDonation.id}">Szczegóły</a></td>
      </tr>
      </c:forEach>

      </tbody>
    </table>
    <br>
    <br>
    <br>
    <div class="form-group form-group--buttons">
      <a href="form" class="btn btn--without-border">Dodaj darowizne</a>
    </div>
  </section>

  </body>
</html>
