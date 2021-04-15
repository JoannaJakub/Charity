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

    <h2>Edycja użytkownika</h2>

    <tbody>
    <table style="width:35%"  cellpadding="15" class="btn btn--without-border active">
        <form:form method="post" modelAttribute="categoryEdit">
            <tr>
                <td>ID</td>
                <td><c:out value="${id}"/></td>

            </tr>
            <tr>
                <td>Nazwa</td>
                <td><form:input path="name"/></td>
            </tr>
            <tr>
                <td>

                </td>
                <td>
                    <button type="submit"/>Zapisz</button>
                </td>
            </tr>

        </form:form>
        </tbody>
    </table>

</section>

<script src="<c:url value="../resources/js/app.js"/>"></script>
</body>
</html>
