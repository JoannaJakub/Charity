<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="pl">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Document</title>
    <link rel="stylesheet" href="<c:url value="resources/css/style.css"/>" />
  </head>
  <body>
  <%@ include file="../adminHeader.jsp" %>


  <section class="login-page">
    <h2>Lista kategorii</h2>


    <table style="width:100%" border="1" cellpadding="9">

      <thead>
      <tr>
        <th>Id</th>
        <th>Nazwa</th>
        <th>Usuń</th>
        <th>Edytuj</th>
        <th>Szczegóły</th>
      </tr>
      </thead>
      <tbody>

      <c:forEach items="${adminCategory}" var="adminCategory">
      <tr>
        <td><c:out value="${adminCategory.id}"/></td>
        <td><c:out value="${adminCategory.name}"/></td>
        <td ><a href="/categoryDelete/${adminCategory.id}">Usuń</a></td>
        <td ><a href="/categoryEdit/${adminCategory.id}">Edytuj</a></td>
        <td ><a href="/categoryDetails/${adminCategory.id}">Szczegóły</a></td>
      </tr>
      </c:forEach>

      </tbody>
    </table>
    <br>
    <br>
    <br>
    <div class="form-group form-group--buttons">
      <a href="categoryAdd" class="btn btn--without-border">Dodaj kategorie</a>
    </div>
  </section>

  <%@ include file="../../footer.jsp" %>
  </body>
</html>
