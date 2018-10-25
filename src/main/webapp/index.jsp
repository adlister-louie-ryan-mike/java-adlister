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
                    <img height="100px" width="200px" onclick="window.location='/ads?category=1'" src="images/jobs_pic.jpg" alt="jobs">
                    <div class="card-body">
                        <h4 class="card-title" onclick="window.location='/ads?category=1'">Jobs</h4>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-3">
                <div class="card">
                    <img src="images/nsx_car.jpeg" onclick="window.location='/ads?category=2'" height="100px" width="200px" alt="nsx">
                    <div class="card-body">
                        <h4 class="card-title" onclick="window.location='/ads?category=2'">Cars</h4>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-3">
                <div class="card">
                    <img src="images/cobra_toy.jpg" onclick="window.location='/ads?category=3'" height="100px" width="200px" alt="cobra">
                    <div class="card-body">
                        <h4 class="card-title" onclick="window.location='/ads?category=3'">Toys</h4>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-3">
                <div class="card">
                    <img src="images/games.jpeg" onclick="window.location='/ads?category=4'" height="100px" width="200px" alt="games">
                    <div class="card-body">
                        <h4 class="card-title" onclick="window.location='/ads?category=4'">Games</h4>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-3">
                <div class="card">
                    <img src="images/services.jpeg" onclick="window.location='/ads?category=5'" height="100px" width="200px" alt="services">
                    <div class="card-body">
                        <h4 class="card-title" onclick="window.location='/ads?category=5'">Services</h4>
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
