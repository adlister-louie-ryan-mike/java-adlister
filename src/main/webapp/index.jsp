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
    <h1 class="ind_title">Welcome to ManLister!</h1>
    <h4 id="ti_desc">"The web's best marketplace for homemade booze, powertools, and beard care products"</h4>
    <div class="row">

        <div class="col2">
            <img width="100px" height="150px" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFLfh6Dc0Lo1qWwpAbn_lex4xR5x_tx4-M93RkQTQ50b2cl8gqGg" alt="nsx">
            <h4 class="card-title" onclick="window.location='/ads/byCategory?category=1'">Auto & Truck</h4>
        </div>
        <div class="col2">
            <img width="100px" height="150px" src="http://www.bunn.com/sites/default/files/images/retail/header/outdoorsman-header-image_0.jpg" alt="outdoors">
            <h4 class="card-title" onclick="window.location='/ads/byCategory?category=2'">Outdoor & Sports</h4>
        </div>
        <div class="col2">
            <img width="100px" height="150px" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcStfV42u6LQPQz2r9vZHPQLbxp-zQ9AbBpc475qx-wuATlAwdkYSg">
            <h4 class="card-title" onclick="window.location='/ads/byCategory?category=3'">Beards & Booze</h4>
        </div>
        <div class="col2 center ">
            <img width="100px" height="150px" src="http://speedsociety.com/wp-content/uploads/2017/04/Screen-Shot-2017-04-15-at-7.51.14-AM-868x506.jpg" alt="chainsaw">
            <h4 class="card-title" onclick="window.location='/ads/byCategory?category=4'">Tools</h4>
        </div>
        <div id="serv" class="col2 center">
            <img width="100px" height="150px" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTd64GmkY8sAgcSO2G8iWN7Dk-ZGt8gWwaLShlRRQeeEQqDDvBz" alt="plumb">
            <h4 class="card-title" onclick="window.location='/ads/byCategory?category=5'">Services</h4>
        </div>
</div>
<%--<div>--%>
    <%--<div class="col2 center">--%>
        <%--<img width="100px" height="150px" src="https://codeup.com/wp-content/uploads/2015/11/2013-10-10_codeup_mark_horizontal.png">--%>
    <%--</div>--%>
    <%--<div class="col2 center">--%>
        <%--<img width="100px" height="150px" src="http://www.brgriffin.com/wp-content/uploads/2018/06/BrandonGriffin-old-spice-smelf.jpg">--%>
    <%--</div>--%>
    <%--<div class="col2 center">--%>
        <%--<img width="100px" height="150px" src="https://media.treehugger.com/assets/images/2013/11/tesla-electric-pickup-truck-photo.jpg.860x0_q70_crop-scale.jpg">--%>
    <%--</div>--%>
    <%--<div class="col2 center">--%>
        <%--<img width="100px" height="150px" src="https://www.investors.com/wp-content/uploads/2017/10/LSMAIN-grant-101317-newscom.jpg">--%>
    <%--</div>--%>
    <%--<div class="col2 center">--%>
        <%--<img width="100px" height="150px" src="https://codeup.com/wp-content/uploads/2015/11/2013-10-10_codeup_mark_horizontal.png">--%>
    <%--</div>--%>
<%--</div>--%>
<%--</div>--%>
<jsp:include page="/WEB-INF/partials/resnav.jsp">
    <jsp:param name="logged_in" value="${sessionScope.logged_in}"/>

</jsp:include>
</body>
</html>
