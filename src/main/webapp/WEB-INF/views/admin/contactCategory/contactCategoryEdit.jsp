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
    <h2>Edycja wiadomości</h2>
    <tbody>
    <table class="btn btn--without-border-align active">
        <form:form method="post" modelAttribute="contactCategoryName">
            <tr>
                <td>Id</td>
                <td><c:out value="id"/></td>
            </tr>
            <tr>
                <td>Nazwa</td>
                <td><form:input path="name"/></td>
            </tr>
            <tr>
                <td>
                    <a href="<c:url value="/adminContact#contactCategoryList"/>" class="btn btn--without-active">Powrót</a></li>
                </td>
                <td>
                    <button type="submit" class="btn btn--without-active"/>Zapisz</button>
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
