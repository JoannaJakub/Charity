<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="pl">
<%@ include file="../adminHeader.jsp" %>


  <section class="login-page">
    <h2>Lista użytkowników</h2>


    <table style="width:100%" border="1" cellpadding="9">

      <thead>
      <tr>
        <th>Id</th>
        <th>Email</th>
        <th>Enabled</th>
        <th>Imie</th>
        <th>Nazwisko</th>
        <th>Usuń</th>
        <th>Edytuj</th>

      </tr>
      </thead>
      <tbody>

      <c:forEach items="${admin}" var="admin">
      <tr>
        <td><c:out value="${admin.id}"/></td>
        <td><c:out value="${admin.email}"/></td>
        <td><c:out value="${admin.enabled}"/></td>
        <td><c:out value="${admin.firstName}"/></td>
        <td><c:out value="${admin.lastName}"/></td>
        <td ><a href="/userDelete/${admin.id}">Usuń</a></td>
        <td ><a href="/userEdit/${admin.id}">Edytuj</a></td>
      </tr>
      </c:forEach>

      </tbody>
    </table>
    <br>
    <br>
    <br>
    <div class="form-group form-group--buttons">
      <a href="register" class="btn btn--without-border">Dodaj użytkownika</a>
    </div>
  </section>

  <%@ include file="../../footer.jsp" %>
  </body>
</html>
