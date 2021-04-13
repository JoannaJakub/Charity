<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="pl">
<%@ include file="adminHeader.jsp" %>


  <section class="login-page">
    <h2>Lista darowizn</h2>


    <table style="width:100%" border="1" cellpadding="9">

      <thead>
      <tr>
        <th>Id</th>
        <th>Nazwa</th>
        <th>Opis</th>
        <th>Usuń</th>
      </tr>
      </thead>
      <tbody>

      <c:forEach items="${adminInstitution}" var="adminInstitution">
      <tr>
        <td><c:out value="${adminInstitution.id}"/></td>
        <td><c:out value="${adminInstitution.name}"/></td>
        <td><c:out value="${adminInstitution.description}"/></td>
        <td ><a href="/institutionDelete/${adminInstitution.id}">Usuń</a></td>
      </tr>
      </c:forEach>

      </tbody>
    </table>

  </section>

  <%@ include file="../footer.jsp" %>
  </body>
</html>
