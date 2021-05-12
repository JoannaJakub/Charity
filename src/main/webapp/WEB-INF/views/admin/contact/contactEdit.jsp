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
    <table style="width:35%" cellpadding="15" class="btn btn--without-border active">
        <form:form  items="${contactEdit}" var="contactEdit">
            <tr>
                <td>ID</td>
                <td><c:out value="${id}"/></td>

            </tr>
            <tr>
                <td>Id użytkownika</td>
                <td><c:out value="${contactEdit.user.id}"/></td>
            </tr>
            <tr>
                <td>Imię</td>
                <td><c:out value="${contactEdit.name}"/></td>
            </tr>
            <tr>
                <td>Nazwisko</td>
                <td><c:out value="${contactEdit.surname}"/></td>
            </tr>
            <tr>
                <td>Email</td>
                <td><c:out value="${contactEdit.email}"/></td>
            </tr>
        </form:form>
        <form:form method="post" modelAttribute="contactEdit2">

            <tr>
                <td>Wiadomość</td>
                <td><form:input path="message"/></td>
            </tr>
            <tr>
                <td>Data wysłania</td>
                <td><form:input path="createdDate"/></td>
            </tr>
            <tr>
                <td>Data modyfikacji</td>
                <td><form:input path="updateDate"/></td>
            </tr>
            <tr>
                <td>
                    <a href="<c:url value="/adminContact"/>" class="btn btn--without-active">Powrót</a></li>
                </td>
                <td>
                    <button type="submit" class="btn btn--without-active"/>
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
