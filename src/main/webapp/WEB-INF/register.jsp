<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="partials/head.jsp">
        <jsp:param name="title" value="Register For Our Site!" />
    </jsp:include>
</head>
<body id="body">
    <jsp:include page="partials/navbar.jsp" />
    <div class="container">
        <h1>Please fill in your information.</h1>
        <form action="/register" method="post">
            <div class="form-group">
                <label for="username">Username</label>
                <input id="username" name="username" class="form-control" type="text" placeholder="${usernameInput}">
                <label name ="usernameError" id="usernameError" class="text-red">${usernameError}</label>
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <input id="email" name="email" class="form-control" type="text" placeholder="${emailInput}">
                <label name ="emailError" id="emailError" class="text-red">${emailError}</label>

            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input id="password" name="password" class="form-control" type="password">
            <%--</div>--%>
            <%--<div class="container">--%>
                <label id="passwordErrorMessage" class="text-red" hidden>${passwordErrorMessage}</label>
                <div id="passwordErrors" hidden>${passwordErrors}</div>
                <div class="row">
                    <ol id="passwordCriteria">
                        <li>Password length must have at least 8 characters</li>
                        <li>Password must have at least one special character</li>
                        <li>Password must have at least one uppercase character</li>
                        <li>Password must have at least one lowercase character</li>
                        <li>Password must have at least one digit character</li>
                    </ol>
                    <ol id="passwordList" class="text-red"></ol>
                </div>

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

        //Functions to check that the username is not blank. If the input is empty for a username, the submit button is disabled.
        let username = document.getElementById("username");
        let emptyUsername = true;

        username.oninput = function(){
            let usernameInput = document.getElementById("username").value;
            if(usernameInput.length > 0 ){
                document.getElementById("submit").removeAttribute("disabled")
                console.log(emptyUsername);
                emptyUsername = false;
                console.log(emptyUsername);
            }
            else{
                emptyUsername = true;
            }
        };

        document.getElementById("submit").onmouseover = function(){
            let usernameInput = document.getElementById("username").value;
            if(usernameInput.length > 0 ){
                // document.getElementById("submit").removeAttribute("disabled")
                console.log(emptyUsername);
                emptyUsername = false;
                console.log(emptyUsername);
            }
            else{
                emptyUsername = true;
            }
            if(!emptyUsername){
                document.getElementById("submit").removeAttribute("disabled")
            }else{
                document.getElementById("submit").setAttribute("disabled", "")
            }
        }

        //Password Error List code to display individual errors.
        let passwordList = document.getElementById("passwordList");
        let passwordErrors = document.getElementById("passwordErrors").innerText;
        console.log(passwordErrors)
        let errors = passwordErrors.split("!!");
        errors.pop();
        if(errors.length>0){
            errors.forEach(function (error) {
                //create new li element
                var newNumberListItem = document.createElement("li");

                //create new text node
                var numberListValue = document.createTextNode(error);

                //add text node to li element
                newNumberListItem.appendChild(numberListValue);

                //add new list element built in previous steps to unordered list
                //called numberList
                passwordList.appendChild(newNumberListItem);
            })
            document.getElementById("passwordCriteria").setAttribute("hidden","");
            document.getElementById("passwordErrorMessage").removeAttribute("hidden");

        }
        console.log(errors);
    </script>
</body>
</html>
