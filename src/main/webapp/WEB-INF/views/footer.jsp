<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<footer>
    <div class="contact" id="contact">
        <h2>Skontaktuj się z nami</h2>
        <h3>Formularz kontaktowy</h3>
        <form:form method="post" action="contactAddSuccess" modelAttribute="contact">
            <input type="hidden" name="createdDate" value="${contact.createdDate}">
            <div class="form-group">
                <label>
                    <input type="text" name="name" placeholder="Imię" path="name"/>
                    <form:errors path="name"/>
                </label>
            </div>
            <div class="form-group form-group--20">
                <input type="text" name="surname" placeholder="Nazwisko" path="surname"/>

                <form:errors path="surname"/>
            </div>
            <div class="form-group form-group--20">
                <input type="text" name="email" placeholder="Email" path="email"/>
                <form:errors path="email"/>
            </div>
            <div class="form-group">
                <textarea name="message" placeholder="Wiadomość" rows="3" path="message"></textarea>
                <br>
                <form:errors path="message"/>
            </div>
            <div>
                <button class="btn" type="submit">Wyślij</button>
            </div>
        </form:form>
    </div>
    <div class="bottom-line">
        <span class="bottom-line--copy">Copyright &copy; 2018</span>
        <div class="bottom-line--icons">
            <a href="#" class="btn btn--small"><img src="<c:url value="resources/images/icon-facebook.svg"/>"/></a>
            <a href="#" class="btn btn--small"><img src="<c:url value="resources/images/icon-instagram.svg"/>"/></a>
        </div>
    </div>
</footer>
<script src="<c:url value="resources/js/app.js"/>"></script>
