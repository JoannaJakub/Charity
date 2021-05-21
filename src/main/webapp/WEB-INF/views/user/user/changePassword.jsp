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
    <h2>Zmień hasło</h2>
    <form:form modelAttribute="changePassword" method="post" action="changePasswordSuccess">
        <div class="form-group">
            <input path="password" placeholder="Hasło"/>
            <form:errors path="password"/>
        </div>
        <div class="form-group">
            <input path="retypePassword" required="password" placeholder="Powtórz hasło"/>

        </div>
        <div class="form-group form-group--buttons">
            <a href="<c:url value="/form"/>" class="btn btn--without-border">Powrót</a>
            <button class="btn btn--without-active" type="submit">Zmień</button>
        </div>
    </form:form>
</section>
</body>
</html>
