<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="pl">
<%@ include file="../userHeader.jsp" %>

<section class="login-page">
    <h2>Dodaj fundacje</h2>
    <form:form action="institutionAddByUserSuccess" modelAttribute="institutionAddByUser" method="post">
        <div class="form-group">
            <form:input placeholder="Nazwa" path="name" id="name"/>
            <form:errors path="name"/>
        </div>
        <div class="form-group">
            <form:input type="text" placeholder="Opis fundacji" path="description" id="description"/>
            <form:errors path="description"/>
        </div>
        <div class="form-group form-group--buttons">
            <a href="<c:url value="/form"/>" class="btn btn--without-border">Powrót</a>
            <button class="btn" type="submit">Dodaj</button>
        </div>
    </form:form>
</section>
<section class="login-page" id="institutionsList">
    <h2>Lista fundacji</h2>


    <table>

        <thead>
        <tr>
            <th>Nazwa</th>
            <th>Opis</th>
        </tr>
        </thead>
        <tbody>

        <c:forEach items="${institutionList}" var="institutionList">
            <tr>
                <td><a href="/institutionDetailsByUser/${institutionList.id}"><c:out
                        value="${institutionList.name}"/></a></td>
                <td><c:out value="${institutionList.description}"/></td>
            </tr>
        </c:forEach>

        </tbody>
    </table>
    <br>
    <br>
    <br>
    <div class="form-group form-group--buttons">
        <a href="<c:url value="/institutionAddByUser"/>" class="btn btn--without-border">Dodaj fundacje</a>
    </div>
</section>
</body>
</html>
