<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="pl">
<%@ include file="../adminHeader.jsp" %>

<section class="login-page">
    <h2>Lista darowizn użytkownika

        <c:forEach items="${oneUserDonations}" var="oneUserDonations">
            <tr>
                <td><c:out value="${oneUserDonations.user.firstName}"/></td>
            </tr>
        </c:forEach>
    </h2>
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

        <c:forEach items="${oneUserDonations}" var="oneUserDonations">
            <tr>
                <td><c:out value="${oneUserDonations.id}"/></td>
                <td><c:out value="${oneUserDonations.pickUpDate}"/></td>
                <td><c:out value="${oneUserDonations.pickUpTime}"/></td>
                <td><c:out value="${oneUserDonations.quantity}"/></td>
                <td><c:out value="${oneUserDonations.city}"/></td>
                <td><c:out value="${oneUserDonations.zipCode}"/></td>
                <td><c:out value="${oneUserDonations.street}"/></td>
                <td><c:out value="${oneUserDonations.phoneNumber}"/></td>
                <td><a href="/donationDelete/${oneUserDonations.id}">Usuń</a></td>
                <td><a href="/donationEdit/${oneUserDonations.id}">Edytuj</a></td>
                <td><a href="/donationDetails/${oneUserDonations.id}">Szczegóły</a></td>
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
