<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Create a new Ad" />
    </jsp:include>
</head>
<body>
    <div class="container">
        <h1>Create a new Ad</h1>
        <form action="/ads/create" method="POST">
            <div class="form-group">
                <label for="title">Title</label>
                <input id="title" name="title" class="form-control" type="text">
            </div>
            <div class="form-group">
                <label for="description">Description</label>
                <textarea id="description" name="description" class="form-control" type="text"></textarea>
            </div>

            <div>
                <br>
                <p>Category</p>
            <select name="category">
                <c:forEach var="category" items="${categories}">
                    <option value = "${category.categoryId}">${category.categoryDesc}</option>
                </c:forEach>
            </select>
            </div>

            <input type="submit" class="btn btn-block btn-primary" id="submit" disabled>
        </form>
    </div>

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

        document.getElementById("submit").onmouseover = function(){
            let titleInput = document.getElementById("title").value;
            if(titleInput.length > 0 ){
                // document.getElementById("submit").removeAttribute("disabled")
                console.log(emptyTitle);
                emptyTitle = false;
                console.log(emptyTitle);
            }
            else{
                emptyTitle = true;
            }
            if(!emptyTitle){
                document.getElementById("submit").removeAttribute("disabled")
            }else{
                document.getElementById("submit").setAttribute("disabled", "")
            }
        }

    </script>
</body>
</html>
