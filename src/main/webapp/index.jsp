<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Welcome to my site!" />
    </jsp:include>
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />
    <div class="container">
        <h1>Welcome to the Adlister!</h1>
        <div class="row">
            <div class="col-lg-3">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title" onclick="window.location='/ads/byCategory?category=1'">Jobs</h4>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-3">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title" onclick="window.location='/ads/byCategory?category=2'">Cars</h4>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-3">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title" onclick="window.location='/ads/byCategory?category=3'">Toys</h4>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-3">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title" onclick="window.location='/ads/byCategory?category=4'">Games</h4>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-3">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title" onclick="window.location='/ads/byCategory?category=5'">Services</h4>
                    </div>
                </div>
            </div>
        </div>
    </div>
<jsp:include page="/WEB-INF/partials/resnav.jsp">
    <jsp:param name="logged_in" value="${sessionScope.logged_in}"/>

</jsp:include>
</body>
</html>
