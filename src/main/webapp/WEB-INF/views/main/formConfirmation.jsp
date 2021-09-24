<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="pl">
<%@ include file="header.jsp" %>

<section>
    <h2>
        <br>
        Dziękujemy za przesłanie formularza.
        <br>
        <br>
        Na maila prześlemy wszelkie informacje o odbiorze.
    </h2>
</section>
<section class="steps" id="steps">
    <h1>Masz coś jeszcze do przekazania?</h1>
    <a href="<c:url value="/form"/>" class="btn btn--without-border">Kliknij tutaj</a></li>
</section>
</body>
</html>
