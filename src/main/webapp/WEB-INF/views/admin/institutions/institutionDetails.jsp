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
    <h2>Szczegóły fundacji</h2>
    <table>
        <thead>
        <td>Id</td>
        <td>Nazwa</td>
        <td>Opis</td>
        </thead>
        <tbody>
        <form:form items="${institutionDetails}" var="institutionDetails">
            <tr>
                <td><c:out value="${institutionDetails.id}"/></td>
                <td><c:out value="${institutionDetails.name}"/></td>
                <td><c:out value="${institutionDetails.description}"/></td>
            </tr>
        </form:form>
        </tbody>
    </table>
    <div class="form-group form-group--buttons">
        <br>
        <a href="<c:url value="/adminInstitution"/>" class="btn btn--without-border">Powrót</a></li>
        <a href="<c:url value="/institutionEdit/${institutionDetails.id}"/>"
           class="btn btn--without-border">Edycja</a></li>
        <a href="<c:url value="/institutionConfirmDelete/?id=${institutionDetails.id}"/>"
           class="btn btn--without-border">Usuń</a></li>
    </div>
</section>
<section class="login-page">
    <h2>Lista darowizn dla fundacji</h2>
    <table>
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
        <c:forEach items="${oneInstitutionDonations}" var="oneInstitutionDonations">
            <tr>
                <td><a href="<c:url value="/donationDetails/${oneInstitutionDonations.id}"/>"><c:out
                        value="${oneInstitutionDonations.id}"/></a></td>
                <td><c:out value="${oneInstitutionDonations.pickUpDate}"/></td>
                <td><c:out value="${oneInstitutionDonations.pickUpTime}"/></td>
                <td><c:out value="${oneInstitutionDonations.quantity}"/></td>
                <td><c:out value="${oneInstitutionDonations.city}"/></td>
                <td><c:out value="${oneInstitutionDonations.zipCode}"/></td>
                <td><c:out value="${oneInstitutionDonations.street}"/></td>
                <td><c:out value="${oneInstitutionDonations.phoneNumber}"/></td>
                <td><a href="/donationDelete/${oneInstitutionDonations.id}">Usuń</a></td>
                <td><a href="/donationEdit/${oneInstitutionDonations.id}">Edytuj</a></td>
                <td><a href="/donationDetails/${oneInstitutionDonations.id}">Szczegóły</a></td>
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
<script src="<c:url value="../resources/js/app.js"/>"></script>
</body>
</html>
