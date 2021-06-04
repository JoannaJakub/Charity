<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="pl">
<%@ include file="../userHeader.jsp" %>

<section class="login-page">
    <h2>Czy jesteś pewien zamknięcia wątku?</h2>
    <table class="btn btn--without-border active">
        <tr>
            <td>
                <a href="<c:url value="/contactsOfUser"/>" class="btn btn--without-active">NIE</a>
            </td>
            <td>
                <a href="<c:url value="/contactDeleteByUser/${param.id}"/>" class="btn btn--without-active">TAK</a>
            </td>
        </tr>
    </table>
</section>
</header>
</body>
</html>
