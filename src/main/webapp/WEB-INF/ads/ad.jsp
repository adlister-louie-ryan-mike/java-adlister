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
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />
<h1>Ad Info!</h1>

<div var="ad" items="${ad}">
    <div class="col-md-6">
        <h2>${ad.title}</h2>
        <p>${ad.description}</p>
    </div>
</div>
<div var="seller" items="${seller}">
    <div class="col-md-6">
        <h4>Seller Info</h4>
            <p>Username: ${seller.username}</p>
            <p>Email: ${seller.email}</p>
    </div>
</div>

<p><a href="/ads">Go Back</a></p>



</body>
</html>
