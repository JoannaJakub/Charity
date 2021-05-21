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
    <h2>Czy jesteś pewien usunięcia darowizny?</h2>
    <table style="width:35%" cellpadding="45" class="btn btn--without-border active">
        <tr>
            <td>
                <a href="<c:url value="/ownDonation"/>" class="btn btn--without-active">NIE</a>
            </td>
            <td>
                <a href="<c:url value="/donationDeleteByUser/${param.id}"/>" class="btn btn--without-active">TAK</a>
            </td>
        </tr>
    </table>
</section>
</header>
</body>
</html>
