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
    <h2>Edycja darowizny</h2>
    <tbody>
    <table class="btn btn--without-border-align active">
        <form:form method="post" modelAttribute="donationEdit">
            <tr>
                <td>ID</td>
                <td><c:out value="${id}"/></td>
            </tr>
            <tr>
                <td>Data odbioru</td>
                <td><form:input path="pickUpDate"/></td>
            </tr>
            <tr>
                <td>Godzina odbioru</td>
                <td><form:input path="pickUpTime"/></td>
            </tr>
            <tr>
                <td>Ilość worków</td>
                <td><form:input path="quantity"/></td>
            </tr>
            <tr>
                <td>Miasto</td>
                <td><form:input path="city"/></td>
            </tr>
            <tr>
                <td>Kod pocztowy</td>
                <td><form:input path="zipCode"/></td>
            </tr>
            <tr>
                <td>Ulica</td>
                <td><form:input path="street"/></td>
            </tr>
            <tr>
                <td>Numer telefonu</td>
                <td><form:input path="phoneNumber"/></td>
            </tr>
            <tr>
                <td>institution</td>
                <td><form:input path="institution"/></td>
            </tr>
            <tr>
                <td>categories</td>
                <td><form:input path="categories"/></td>
            </tr>
            <tr>
                <td>
                    <a href="<c:url value="/adminDonation"/>" class="btn btn--without-active">Powrót</a></li>
                </td>
                <td>
                    <button type="submit"  class="btn btn--without-active"/>
                    Zapisz</button>
                </td>
            </tr>
        </form:form>
        </tbody>
    </table>
    <div class="form-group form-group--buttons">
        <br>
    </div>
</section>
<script src="<c:url value="../resources/js/app.js"/>"></script>
</body>
</html>
