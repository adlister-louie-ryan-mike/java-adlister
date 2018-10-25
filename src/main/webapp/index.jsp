<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Welcome to my site!"/>
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>
<div class="container">
    <h1>Welcome to ManLister!</h1>
    <h4 class="center">"The web's best marketplace for homemade booze, powertools, and beard care products"</h4>
    <div class="row">

        <div class="col2 center">
            <h4 class="card-title" onclick="window.location='/ads/byCategory?category=1'">Auto & Truck</h4>
        </div>
        <div class="col2 center">
            <h4 class="card-title" onclick="window.location='/ads/byCategory?category=2'">Outdoor & Sports</h4>
        </div>
        <div class="col2 center">

            <h4 class="card-title" onclick="window.location='/ads/byCategory?category=3'">Beards & Booze</h4>
        </div>
        <div class="col2 center">
            <h4 class="card-title" onclick="window.location='/ads/byCategory?category=4'">Tools</h4>
        </div>
        <div class="col2 center">
            <h4 class="card-title" onclick="window.location='/ads/byCategory?category=5'">Services</h4>
        </div>
</div>
<div>
    <div class="col2 center">
        <img src="https://codeup.com/wp-content/uploads/2015/11/2013-10-10_codeup_mark_horizontal.png">
    </div>
    <div class="col2 center">
        <img src="http://www.brgriffin.com/wp-content/uploads/2018/06/BrandonGriffin-old-spice-smelf.jpg">
    </div>
    <div class="col2 center">
        <img src="https://media.treehugger.com/assets/images/2013/11/tesla-electric-pickup-truck-photo.jpg.860x0_q70_crop-scale.jpg">
    </div>
    <div class="col2 center">
        <img src="https://www.investors.com/wp-content/uploads/2017/10/LSMAIN-grant-101317-newscom.jpg">
    </div>
    <div class="col2 center">
        <img src="https://codeup.com/wp-content/uploads/2015/11/2013-10-10_codeup_mark_horizontal.png">
    </div>
</div>
</div>
<jsp:include page="/WEB-INF/partials/resnav.jsp">
    <jsp:param name="logged_in" value="${sessionScope.logged_in}"/>

</jsp:include>
</body>
</html>
