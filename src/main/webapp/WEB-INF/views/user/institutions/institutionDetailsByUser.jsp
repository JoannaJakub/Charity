<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="pl">
<%@ include file="../userHeader.jsp" %>

<section class="login-page">
    <h2>Szczegóły fundacji</h2>
    <table>
        <td>Nazwa</td>
        <td>Opis</td>

        <form:form items="${institutionDetailsByUser}" var="institutionDetailsByUser">
            <tr>
                <td><c:out value="${institutionDetailsByUser.name}"/></td>
                <td><c:out value="${institutionDetailsByUser.description}"/></td>
            </tr>
        </form:form>
    </table>
</section>
</header>
</body>
</html>
