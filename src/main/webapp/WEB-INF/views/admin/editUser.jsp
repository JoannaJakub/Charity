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
    <h2>Lista użytkowników</h2>


    <table style="width:100%" border="1" cellpadding="9">

      <thead>
      <tr>
        <th>Id</th>
        <th>Email</th>
        <th>Enabled</th>
        <th>Imie</th>
        <th>Nazwisko</th>
        <th>Edytuj</th>

      </tr>
      </thead>
      <tbody>
      <form:form method="post" modelAttribute="admin" action="userEdit">
          <form:hidden path="id"/>
          <form:input path="admin.firstName"/>
          <form:input path="admin.lastName"/>
          <form:input path="admin.email"/>
          <form:input path="admin.enabled"/>
      </form:form>
      </tbody>
    </table>

  </section>

  <%@ include file="../footer.jsp" %>
  </body>
</html>
