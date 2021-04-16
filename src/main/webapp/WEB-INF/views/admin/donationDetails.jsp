<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
            <td>>Id</tr>
            <td>Data</td>
            <td>Godzina</td>
            <td>ilość</td>
            <td>Miasto</td>
            <td>Kod pocztowy</td>
            <td>Ulica</td>
            <td>Numer telefonu</td>
            <td>Kategorie</td>
            <td>Instutucja</td>
            <td>Uzytkownik</td>

        </tr>
        </thead>
        <tbody>

        <form:form items="${donationDetails}" var="donationDetails">
            <tr>
                <td><c:out value="${donationDetails.id}"/></td>
                <td><c:out value="${donationDetails.pickUpDate}"/></td>
                <td><c:out value="${donationDetails.pickUpTime}"/></td>
                <td><c:out value="${donationDetails.quantity}"/></td>
                <td><c:out value="${donationDetails.city}"/></td>
                <td><c:out value="${donationDetails.zipCode}"/></td>
                <td><c:out value="${donationDetails.street}"/></td>
                <td><c:out value="${donationDetails.phoneNumber}"/></td>
                <td><c:out value="${donationDetails.categories}"/></td>
                <td><c:out value="${donationDetails.institution}"/></td>

            </tr>
        </form:form>


        </tbody>
    </table>

</section>

<script src="<c:url value="../resources/js/app.js"/>"></script>
</body>
</html>
