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
    <h2>Edycja użytkownika</h2>


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
      <form:form method="post" modelAttribute="userEdit">
          <form:input path="id" label/>
          <form:input path="firstName"/>
          <form:input path="lastName"/>
          <form:input path="email"/>
          <form:input path="enabled"/>
        <input type="submit" value="Save">
      </form:form>
      </tbody>
    </table>

  </section>

<script src="<c:url value="../resources/js/app.js"/>"></script>
  </body>
</html>
