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

<c:forEach var="ad" items="${ads}">
    <div class="col-md-6">
        <h2>${ad.title}</h2>
        <h5>${ad.id}</h5>
        <p>${ad.description}</p>
    </div>
</c:forEach>


</body>
</html>
