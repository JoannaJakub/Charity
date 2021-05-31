<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="pl">
<%@ include file="../userHeader.jsp" %>

<section class="login-page" id="donationsList">
    <h2>Lista darowizn</h2>
    <table>
        <tr>
            <th>Data</th>
            <th>Ilość</th>
            <th>Miasto</th>
            <th>Kategorie</th>

        </tr>

        <c:forEach items="${lastlyDonatedForum}" var="lastlyDonatedForum">
            <tr>
                <td><c:out value="${lastlyDonatedForum.pickUpDate}"/></td>
                <td><c:out value="${lastlyDonatedForum.quantity}"/></td>
                <td><c:out value="${lastlyDonatedForum.city}"/></td>
                <td><c:out value="${lastlyDonatedForum.categories}"/></td>
            </tr>
        </c:forEach>

    </table>
    <br>
    <br>
    <br>
    <div class="form-group form-group--buttons">
        <a href="<c:url value="/form"/>" class="btn btn--without-border">Dodaj darowizne</a>
    </div>
</section>

</header>
</body>
</html>
