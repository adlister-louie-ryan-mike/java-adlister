<%--
  Created by IntelliJ IDEA.
  User: michaelstrezishar
  Date: 10/24/18
  Time: 9:32 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
    <c:choose>
        <c:when test="${param.logged_in}">
            let logHide = document.getElementsByClassName("user_in");
        </c:when>
        <c:otherwise>
            let logHide = document.getElementsByClassName("user_out");
         </c:otherwise>
    </c:choose>
    for(elem of logHide){
        elem.style.display = "none";
    }
</script>
