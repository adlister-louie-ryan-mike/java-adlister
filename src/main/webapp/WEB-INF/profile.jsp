<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile" />
    </jsp:include>
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />

    <div class="container">
        <h1>Welcome, ${sessionScope.user.username}!</h1>
    </div>
    <c:forEach var="ad" items="${ads}">
        <div class="col-md-6">
            <a href="/ads/edit/?id=${ad.id}"><button type="button">Edit</button></a>
            <h2>${ad.title}</h2>
            <h5><a href="/ads/?id=${ad.id}">${ad.id}</a></h5>
            <p>${ad.description}</p>
        </div>
    </c:forEach>

</body>
</html>
