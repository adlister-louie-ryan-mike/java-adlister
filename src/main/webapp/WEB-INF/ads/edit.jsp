<%--
  Created by IntelliJ IDEA.
  User: michaelstrezishar
  Date: 10/19/18
  Time: 11:41 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <jsp:include page="../partials/head.jsp">
        <jsp:param name="title" value="Adlister" />
    </jsp:include>
</head>
<body class="">
        <form action="/ads/edit" method="POST">
            <div class="form-group col3">
                <label for="title">Old Title: ${ad.title}</label>
                <input id="title" name="title" class="form-control" type="text" placeholder="Updated Title">
            <%--</div>--%>
            <%--<div class="form-group col3">--%>
                <label for="description">Old Description: ${ad.description}</label>
                <input id="description" name="description" class="form-control" type="password" placeholder="Updated Description">
            </div>
            <input type="submit" class="btn btn-primary col3" value="Update">
        </form>
</body>
</html>