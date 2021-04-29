<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="pl">
<%@ include file="userHeader.jsp" %>


<section class="login-page">
    <h2>Szczegóły użytkownika</h2>

    <form:form action="changePasswordSuccess" modelAttribute="changePassword" method="post">
        <div class="form-group">
            <form:input type="password" name="password" placeholder="Hasło" path="password" />
            <form:errors path="password"/>
        </div>
        <div class="form-group">
            <form:input type="password" name="retypePassword" placeholder="Powtórz hasło" path="retypePassword"   />
            <form:errors path="retypePassword"/>
        </div>

        <div class="form-group form-group--buttons">
            <a href="<c:url value="/login"/>" class="btn btn--without-border">Zaloguj się</a>
            <button class="btn" type="submit">Załóż konto</button>
        </div>
    </form:form>

</section>

<script src="<c:url value="../resources/js/app.js"/>"></script>
</body>
</html>
