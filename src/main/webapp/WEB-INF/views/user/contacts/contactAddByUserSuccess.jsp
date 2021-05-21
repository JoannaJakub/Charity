<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="pl">
<%@ include file="../userHeader.jsp" %>
<section>
    <h2>
        <br>
        Pomyślnie wysłano zgłoszenie.
        <br>
    </h2>
</section>
<section class="steps" id="steps">
    <h1>Chcesz wysłać jeszcze jedną wiadomość?</h1>
    <a href="<c:url value="/contactAddByUser"/>" class="btn btn--without-border">Kliknij tutaj</a></li>
</section>
</body>
</html>
