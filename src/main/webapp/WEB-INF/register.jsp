<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="partials/head.jsp">
        <jsp:param name="title" value="Register For Our Site!" />
    </jsp:include>
</head>
<body>
    <jsp:include page="partials/navbar.jsp" />
    <div class="container">
        <h1>Please fill in your information.</h1>
        <form action="/register" method="post">
            <div class="form-group">
                <label for="username">Username</label>
                <input id="username" name="username" class="form-control" type="text" placeholder="${usernameInput}">
                <label name ="error" id="error" class="text-red">${error}</label>
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <input id="email" name="email" class="form-control" type="text" placeholder="${emailInput}">
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input id="password" name="password" class="form-control" type="password">
            </div>
            <div class="form-group">
                <label for="confirm_password">Confirm Password</label>
                <input id="confirm_password" name="confirm_password" class="form-control" type="password">
            </div>
            <input type="submit" class="btn btn-primary btn-block" id="submit" disabled>
        </form>
    </div>
    <jsp:include page="/WEB-INF/partials/resnav.jsp">
        <jsp:param name="logged_in" value="${sessionScope.logged_in}"/>
    </jsp:include>

    <script>
        let username = document.getElementById("username");
        username.onkeyup = function(){
            let usernameInput = document.getElementById("username").value;
            // let password = document.getElementById("username").value;
            // let email = document.getElementById("email").value;
            if(usernameInput.length > 0 ){
                document.getElementById("submit").removeAttribute("disabled")
            }
        };

        // }
    </script>
</body>
</html>
