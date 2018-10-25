<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The Ads" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />

<div class="container">
    <h1>Here Are all the ads!</h1>

    <c:forEach var="ad" items="${ads}">
        <div class="col-md-6">
            <h3>${ad.title}</h3>
            <h5><a href="/ads/?id=${ad.id}&seller=${ad.userId}">${ad.id}</a></h5>
            <p>${ad.description}</p>
        </div>
    </c:forEach>
</div>
<jsp:include page="/WEB-INF/partials/resnav.jsp">
    <jsp:param name="logged_in" value="${sessionScope.logged_in}"/>
</jsp:include>
</body>
</html>
