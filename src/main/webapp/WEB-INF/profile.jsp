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
        <a href="/profile/edit/?userid=${user.id}">Edit Profile</a>
        <h1>Welcome, ${sessionScope.user.username}!</h1>
    </div>
    <c:forEach var="ad" items="${ads}">
        <div class="col-md-4">
            <h3><a href="/ads/?id=${ad.id}&seller=${ad.userId}">${ad.title}</h3>
            <form action="/profile" method="POST">
                <a href="/ads/edit/?id=${ad.id}"><button type="button">Edit</button></a>
                <input id="ad.id" name="ad.id" class="form-control" type="hidden" value="${ad.id}">
                <input type="submit" class="btn btn-primary col3" value="Delete Ad">
            </form>
            <p>${ad.description}</p>

        </div>
    </c:forEach>
<jsp:include page="/WEB-INF/partials/resnav.jsp">
    <jsp:param name="logged_in" value="${sessionScope.logged_in}"/>
</jsp:include>

</body>
</html>
