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
        <a href="/profile/edit/?userid=${user.id}">Edit Profile</a>
    </div>
    <c:forEach var="ad" items="${ads}">
        <div class="col-md-6">
            <a href="/ads/edit/?id=${ad.id}"><button type="button">Edit</button></a>
            <h3>${ad.title}</h3>
            <h4><a href="/ads/?id=${ad.id}&seller=${user.id}">${ad.id}</a></h4>
            <p>${ad.description}</p>

            <form action="/profile" method="POST">
                <input id="ad.id" name="ad.id" class="form-control" type="hidden" value="${ad.id}">
                <input type="submit" class="btn btn-primary col3" value="Delete Ad">
            </form>
        </div>
    </c:forEach>
<jsp:include page="/WEB-INF/partials/resnav.jsp">
    <jsp:param name="logged_in" value="${sessionScope.logged_in}"/>
</jsp:include>

</body>
</html>
