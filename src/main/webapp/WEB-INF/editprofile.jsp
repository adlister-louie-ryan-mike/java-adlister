<%--
  Created by IntelliJ IDEA.
  User: ryanschmid
  Date: 10/24/18
  Time: 12:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <jsp:include page="partials/head.jsp">
        <jsp:param name="title" value="Adlister" />
    </jsp:include>
</head>
<body>
<jsp:include page="partials/navbar.jsp" />
<form action="/profile/edit/?userid=${user.id}" method="POST">
    <h1>Please update your information:</h1>
    <div class="form-group">
        <label for="username">Username: ${user.username}</label>
        <input id="username" name="username" class="form-control" type="text" placeholder="Updated Username">
    </div>
    <div class="form-group">
        <label for="email">Email: ${user.email} </label>
        <input id="email" name="email" class="form-control" type="text" placeholder="Update Email">
    </div>
    <div class="form-group">
        <label for="password">Password: </label>
        <input id="password" name="password" class="form-control" type="password">
    </div>
    <div class="form-group">
        <label for="confirm_password">Confirm Password: </label>
        <input id="confirm_password" name="confirm_password" class="form-control" type="password">
    </div>
    <input id="user.id" name="user.id" class="form-control" type="hidden" value="${user.id}">
    <input type="submit" class="btn btn-primary btn-block" value="Update">
</form>
</div>




</form>
</body>
</html>
