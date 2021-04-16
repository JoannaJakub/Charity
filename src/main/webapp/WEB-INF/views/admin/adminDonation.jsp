<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="pl">
<%@ include file="adminHeader.jsp" %>


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
        <td ><a href="/donationDelete/${adminDonation.id}">Usuń</a></td>
        <td ><a href="/donationEdit/${adminDonation.id}">Edytuj</a></td>
        <td ><a href="/donationDetails/${adminDonation.id}">Szczegóły</a></td>
      </tr>
      </c:forEach>

      </tbody>
    </table>

  </section>

  <%@ include file="../footer.jsp" %>
  </body>
</html>
