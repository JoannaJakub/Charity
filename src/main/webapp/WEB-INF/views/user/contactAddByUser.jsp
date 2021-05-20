<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="pl">
<%@ include file="userHeader.jsp" %>
    <section class="login-page">
        <h2>Prześlij wiadomość</h2>
        <form:form action="contactAddByUserSuccess" modelAttribute="contactAddByUser" method="post">
            <input type="hidden" name="user" value="${user.id}">
            <input type="hidden" name="name" placeholder="Nazwisko" path="surname" value="${user.firstName}"/>
            <input type="hidden" name="surname" placeholder="Nazwisko" path="surname" value="${user.lastName}"/>
            <input type="hidden" name="email" placeholder="Email" path="email" value="${user.email}"/>

            <div class="form-group">
                <textarea name="message" placeholder="Wiadomość" rows="3" path="message"></textarea>
                <br>
                <form:errors path="message"/>
            </div>
            <div class="form-group">
                <button class="btn" type="submit">Wyślij</button>
            </div>
        </form:form>
    </section>
</header>
</body>
</html>
