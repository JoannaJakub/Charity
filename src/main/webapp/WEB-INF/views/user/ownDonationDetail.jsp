<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="pl">
<%@ include file="userHeader.jsp" %>

<section class="login-page">
    <h2>Szczegóły użytkownika</h2>
    <tbody>
    <table style="width:35%" cellpadding="15" class="btn btn--without-border active">
        <form:form action="ownDonationDetail" modelAttribute="ownDonationDetail">
            <input type="hidden" name="user" value="${user.id}">
            <tr>
                <td>Nazwisko</td>
                <td><c:out value="${ownDonationDetail.pickUpDate}"/></td>
            </tr>
            <tr>
                <td>Godzina</td>
                <td><c:out value="${ownDonationDetail.pickUpTime}"/></td>
            </tr>

            <tr>
                <td>Ilość</td>
                <td><c:out value="${ownDonationDetail.quantity}"/></td>
            </tr>
            <tr>
                <td>Miasto</td>
                <td><c:out value="${ownDonationDetail.city}"/></td>
            </tr>
            <tr>
                <td>Kod pocztowy</td>
                <td><c:out value="${ownDonationDetail.zipCode}"/></td>
            </tr>
            <tr>
                <td>Ulica</td>
                <td><c:out value="${ownDonationDetail.street}"/></td>
            </tr>
            <tr>
                <td>Numer telefonu</td>
                <td><c:out value="${ownDonationDetail.phoneNumber}"/></td>
            </tr>
            <tr>
                <td>Kategorie</td>
                <td><c:out value="${ownDonationDetail.categories}"/></td>
            </tr>
            <tr>
                <td>Instutucja</td>
                <td><c:out value="${ownDonationDetail.institution.name}"/></td>
            </tr>
            <tr>
                <td>
                    <a href="<c:url value="/ownDonation"/>" class="btn btn--without-active">Powrót</a></li>
                </td>
                <td>
                    <a href="<c:url value="/ownDonationEdit/${ownDonationDetail.id}"/>" class="btn btn--without-active">Edytuj</a>
                </td>
            </tr>

        </form:form>
        </tbody>
    </table>
    </tbody>
</section>
</html>

