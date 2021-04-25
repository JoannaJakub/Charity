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
    <h2>Szczegóły kategori</h2>


    <table style="width:50%" border="1" cellpadding="20">

        <thead>
            <td>Id</td>
            <td>Nazwa</td>
        </thead>
        <tbody>

        <form:form items="${categoryDetails}" var="categoryDetails">
            <tr>
                <td><c:out value="${categoryDetails.id}"/></td>
                <td><c:out value="${categoryDetails.name}"/></td>

            </tr>
        </form:form>


        </tbody>
    </table>

    <div class="form-group form-group--buttons">
        <br>
        <a href="<c:url value="/adminCategory"/>" class="btn btn--without-border">Powrót</a></li>
        <a href="<c:url value="/categoryEdit/${categoryDetails.id}"/>" class="btn btn--without-border">Edycja</a></li>
        <a href="<c:url value="/categoryConfirmDelete/?id=${categoryDetails.id}"/>" class="btn btn--without-border">Usuń</a></li>
    </div>
</section>


<script src="<c:url value="../resources/js/app.js"/>"></script>
</body>
</html>
