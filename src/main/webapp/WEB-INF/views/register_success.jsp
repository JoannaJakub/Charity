<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
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
  <%@ include file="headerLogReg.jsp" %>

  <section>
    <div class="slogan container container--90">
      <h2>
        <br>
        Proces rejestracji przebiegł pomyślnie.
        <br>

      </h2>
    </div>
  </section>

  <section class="steps" id="steps">
    <h1>Chcesz się zalogować?</h1>
    <a href="<c:url value="/login"/>" class="btn btn--without-border">Kliknij tutaj</a></li>
  </section>

  <%@ include file="footer.jsp" %>
  </body>
</html>
