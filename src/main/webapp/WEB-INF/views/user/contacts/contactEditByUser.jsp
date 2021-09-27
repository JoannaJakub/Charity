<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="pl">
<%@ include file="../userHeader.jsp" %>

<section class="login-page">
    <h2>Edycja wiadomości</h2>
    <table class="btn btn--without-border-align active">
        <form:form method="post" modelAttribute="contactEditByUser">
            <input type="hidden" name="user" value="${user.id}">
            <input type="hidden" name="name" placeholder="Nazwisko" path="surname" value="${user.firstName}"/>
            <input type="hidden" name="surname" placeholder="Nazwisko" path="surname" value="${user.lastName}"/>
            <input type="hidden" name="email" placeholder="Email" path="email" value="${user.email}"/>
            <tr>
                <br>
                <td>Wiadomość</td>
                <td>
                    <form:select path="contactCategory" items="${contactCategory}" itemLabel="name" itemValue="id" />
                </td>
            </tr>
            <tr>
                <td>Wiadomość</td>
                <td>
                    <br>
                    <form:input path="message"/>
                    <form:errors path="message"/>

                </td>
            </tr>
            <tr>
                <td>
                    <a href="<c:url value="/contactsOfUser"/>" class="btn btn--without-active">Powrót</a></li>
                </td>
                <td>
                    <button type="submit" class="btn btn--without-active"/>
                    Zapisz</button>
                </td>
            </tr>
        </form:form>
    </table>
</section>
</html>


