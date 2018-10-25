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
            <h3><a href="/ads/?id=${ad.id}&seller=${ad.userId}">${ad.title}</h3>
            <input id="ad.id" name="ad.id" class="form-control" type="hidden" value="${ad.id}">
            <p>${ad.description}</p>
        </div>
    </c:forEach>
</div>

</body>
</html>
