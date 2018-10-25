<%--
  Created by IntelliJ IDEA.
  User: michaelstrezishar
  Date: 10/19/18
  Time: 11:41 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <jsp:include page="../partials/head.jsp">
        <jsp:param name="title" value="Adlister" />
    </jsp:include>
</head>
<body class="">
        <form action="/ads/edit/" method="POST">
            <%--<c: var="ad" items="${ad}"></c:>--%>
            <div class="form-group col3">
                <label for="title">Old Title: ${ad.title}</label>
                <input id="title" name="title" class="form-control" type="text" placeholder="Updated Title">
            <%--</div>--%>
            <%--<div class="form-group col3">--%>
                <label for="description">Old Description: ${ad.description}</label>
                <input id="description" name="description" class="form-control" type="text" placeholder="Updated Description">
                <input id="ad.id" name="ad.id" class="form-control" type="hidden" value="${ad.id}">
            </div>
            <input id="submit" type="submit" class="btn btn-primary col3" value="Update">
        </form>


        <script>
            //Functions to check that the username is not blank. If the input is empty for a username, the submit button is disabled.
            let title = document.getElementById("title");
            let description = document.getElementById("description");

            let emptyTitle = true;
            let emptyDescription = true;


            title.oninput = function(){
                let titleInput = document.getElementById("title").value;
                if(titleInput.length > 0 ){
                    document.getElementById("submit").removeAttribute("disabled");
                    console.log(emptyTitle);
                    emptyTitle = false;
                    console.log(emptyTitle);
                }
                else{
                    emptyUsername = true;
                }
            };

            description.oninput = function(){
                let descInput = document.getElementById("description").value;
                if(descInput.length > 0 ){
                    document.getElementById("submit").removeAttribute("disabled");
                    console.log(emptyTitle);
                    emptyTitle = false;
                    console.log(emptyTitle);
                }
                else{
                    emptyUsername = true;
                }
            };

            document.getElementById("submit").onmouseover = function(){
                let titleInput = document.getElementById("title").value;
                let descInput = document.getElementById("description").value;
                if(titleInput.length > 0 && descInput.length > 0){
                    // document.getElementById("submit").removeAttribute("disabled")
                    console.log(emptyTitle, emptyDescription);
                    emptyTitle = false;
                    emptyDescription = false;
                    console.log(emptyTitle, emptyDescription);
                    document.getElementById("submit").removeAttribute("disabled")
                }
                else{
                    emptyTitle = true;
                    emptyDescription = true;
                    document.getElementById("submit").setAttribute("disabled", "")
                }
            }

        </script>
</body>
</html>
