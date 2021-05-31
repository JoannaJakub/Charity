<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="pl">
<%@ include file="../userHeader.jsp" %>


<section class="login-page">
    <h2>Lista darowizn</h2>
    <table>
        <tr>
            <th>Data</th>
            <th>Godzina</th>
            <th>ilość</th>
            <th>Miasto</th>
            <th>Kod pocztowy</th>
            <th>Ulica</th>
            <th>Numer telefonu</th>
            <th>Szczegóły Fundacji</th>
            <th>Usuń</th>
            <th>Edytuj</th>
            <th>Szczegóły</th>

        </tr>

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
                <td><a href="/institutionDetailsByUser/${ownDonation.institution.id}"><c:out
                        value="${ownDonation.institution.name}"/></a></td>
                <td><a href="/donationConfirmDeleteByUser/?id=${ownDonation.id}">Usuń</a></td>
                <td><a href="/ownDonationEdit/${ownDonation.id}">Edytuj</a></td>
                <td><a href="/ownDonationDetail/${ownDonation.id}">Szczegóły</a></td>
            </tr>
        </c:forEach>

    </table>
    <br>
    <br>
    <br>
    <div class="form-group form-group--buttons">
        <a href="form" class="btn btn--without-border">Dodaj darowizne</a>
    </div>
</section>
<section class="login-page" id="categoriesListDonations">
    <h2>Lista kategorii</h2>
    <table>

        <thead>
        <tr>
            <th>Data darowizny</th>
            <th>Nazwa kategori</th>

        </tr>
        </thead>
        <tbody>

        <c:forEach items="${ownDonation}" var="ownDonation">
            <tr>
                <td><c:out value="${ownDonation.pickUpDate}"/></td>
                <td><c:out value="${ownDonation.categories}"/></td>

            </tr>
        </c:forEach>

        </tbody>
    </table>
    <br>
    <br>
    <br>

</section>
<section class="login-page" id="categoriesListInstitution">
    <h2>Lista fundacji</h2>
    <table>

        <thead>
        <tr>
            <th>Data darowizny</th>
            <th>Nazwa fundacji</th>

        </tr>
        </thead>
        <tbody>

        <c:forEach items="${ownDonation}" var="ownDonation">
            <tr>
                <td><c:out value="${ownDonation.pickUpDate}"/></td>
                <td><a href="/institutionDetailsByUser/${ownDonation.institution.id}"><c:out
                        value="${ownDonation.institution.name}"/></a></td>
            </tr>
        </c:forEach>

        </tbody>
    </table>
    <br>
    <br>
    <br>
    <div class="form-group form-group--buttons">
        <a href="<c:url value="/institutionAddByUser"/>" class="btn btn--without-border">Dodaj fundacje</a>
    </div>
</section>
</body>
</html>
