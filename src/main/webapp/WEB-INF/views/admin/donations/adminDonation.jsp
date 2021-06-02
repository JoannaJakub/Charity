<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
            <li><a href="<c:url value="#donationsListCategory"/>" class="btn btn--without-border">Lista darowizn wg
                kategorii</a></li>
            <li><a href="<c:url value="#donationsListInstitution"/>" class="btn btn--without-border">Lista darowizn wg
                fundacji</a></li>
            <li><a href="<c:url value="#userDonations"/>" class="btn btn--without-border">Lista użytkowników i ich darowizny</a></li>
            <li><a href="<c:url value="/adminForm"/>" class="btn btn--without-border">Dodaj darowiznę</a></li>
        </ul>
    </nav>
</header>
<section class="login-page" id="donationsList">
    <h2>Lista darowizn</h2>
    <table>
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
                <td><a href="<c:url value="/donationConfirmDelete/?id=${adminDonation.id}"/>">Usuń</a></td>
                <td><a href="<c:url value="/donationEdit/${adminDonation.id}"/>">Edytuj</a></td>
                <td><a href="<c:url value="/donationDetails/${adminDonation.id}"/>">Szczegóły</a></td>
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
                <td><a href="<c:url value="/donationConfirmDelete/?id=${lastDonation.id}"/>">Usuń</a></td>
                <td><a href="<c:url value="/donationEdit/${lastDonation.id}"/>">Edytuj</a></td>
                <td><a href="<c:url value="/donationDetails/${lastDonation.id}"/>">Szczegóły</a></td>
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
    <table>
        <thead>
        <tr>
            <th>Nazwa kategori</th>
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
                <td><c:out value="${donationCategories.categories[0].name}"/></td>
                <td><c:out value="${donationCategories.id}"/></td>
                <td><c:out value="${donationCategories.pickUpDate}"/></td>
                <td><c:out value="${donationCategories.pickUpTime}"/></td>
                <td><c:out value="${donationCategories.quantity}"/></td>
                <td><c:out value="${donationCategories.city}"/></td>
                <td><c:out value="${donationCategories.zipCode}"/></td>
                <td><c:out value="${donationCategories.street}"/></td>
                <td><c:out value="${donationCategories.phoneNumber}"/></td>
                <td><a href="<c:url value="/donationConfirmDelete/?id=${donationCategories.id}"/>">Usuń</a></td>
                <td><a href="<c:url value="/donationEdit/${donationCategories.id}"/>">Edytuj</a></td>
                <td><a href="<c:url value="/donationDetails/${donationCategories.id}"/>">Szczegóły</a></td>
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
    <table>
        <thead>
        <tr>
            <th>Id fundacji</th>
            <th>Nazwa fundacji</th>
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
                <td><a href="<c:url value="/institutionDetails/${donationInstitutions.institution.id}"/>"><c:out
                        value="${donationInstitutions.institution.id}"/></a></td>
                <td><a href="<c:url value="/institutionDetails/${donationInstitutions.institution.id}"/>"><c:out
                        value="${donationInstitutions.institution.name}"/></a></td>
                <td><a href="<c:url value="/donationDetails/${donationInstitutions.id}"/>"><c:out
                        value="${donationInstitutions.id}"/></a></td>
                <td><c:out value="${donationInstitutions.pickUpDate}"/></td>
                <td><c:out value="${donationInstitutions.pickUpTime}"/></td>
                <td><c:out value="${donationInstitutions.quantity}"/></td>
                <td><c:out value="${donationInstitutions.city}"/></td>
                <td><c:out value="${donationInstitutions.zipCode}"/></td>
                <td><c:out value="${donationInstitutions.street}"/></td>
                <td><c:out value="${donationInstitutions.phoneNumber}"/></td>
                <td><a href="<c:url value="/donationConfirmDelete/?id=${donationInstitutions.id}"/>">Usuń</a></td>
                <td><a href="<c:url value="/donationEdit/${donationInstitutions.id}"/>">Edytuj</a></td>
                <td><a href="<c:url value="/donationDetails/${donationInstitutions.id}"/>">Szczegóły</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <br>
    <br>
    <br>
    <div class="form-group form-group--buttons">
        <a href="<c:url value="/institutionAdd"/>" class="btn btn--without-border">Dodaj fundację</a>
    </div>
</section>
<section class="login-page" id="userDonations">
    <h2>Lista użytkowników i ich darowizny
    </h2>
    <table>
        <thead>
        <tr>
            <th>Id użytkownika</th>
            <th>Użytkownik</th>
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
                <td><a href="<c:url value="/oneUserDonations/${adminDonation.user.id}"/>"><c:out
                        value="${adminDonation.user.id}"/></a></td>
                <td><a href="<c:url value="/oneUserDonations/${adminDonation.user.id}"/>"><c:out
                        value="${adminDonation.user.email}"/></a></td>
                <td><a href="<c:url value="/donationDetails/${adminDonation.id}"/>"><c:out
                        value="${adminDonation.id}"/></a></td>
                <td><c:out value="${adminDonation.pickUpDate}"/></td>
                <td><c:out value="${adminDonation.pickUpTime}"/></td>
                <td><c:out value="${adminDonation.quantity}"/></td>
                <td><c:out value="${adminDonation.city}"/></td>
                <td><c:out value="${adminDonation.zipCode}"/></td>
                <td><c:out value="${adminDonation.street}"/></td>
                <td><c:out value="${adminDonation.phoneNumber}"/></td>
                <td><a href="<c:url value="/donationConfirmDelete/?id=${adminDonation.id}"/>">Usuń</a></td>
                <td><a href="<c:url value="/donationEdit/${adminDonation.id}"/>">Edytuj</a></td>
                <td><a href="<c:url value="/donationDetails/${adminDonation.id}"/>">Szczegóły</a></td>
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
</body>
</html>
