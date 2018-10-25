<%--
  Created by IntelliJ IDEA.
  User: ryanschmid
  Date: 10/24/18
  Time: 12:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <jsp:include page="partials/head.jsp">
        <jsp:param name="title" value="Adlister" />
    </jsp:include>
</head>
<body id="body">
<jsp:include page="partials/navbar.jsp" />
<div class="container">
    <h1>Please update your information:</h1>
    <form action="/profile/edit/?userid=${user.id}" method="POST">
        <div class="form-group">
            <h3 id="username">Username: ${user.username}</h3>
            <%--<input id="username" name="username" class="form-control" type="text" placeholder="${usernameInput}">--%>
            <%--<label name ="usernameError" id="usernameError" class="text-red">${usernameError}</label>--%>

        </div>
        <div class="form-group">
            <label for="email">Email: ${user.email} </label>
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
        <div class="form-group">
            <label for="confirm_password">Confirm Password: </label>
            <input id="confirm_password" name="confirm_password" class="form-control" type="password">
        </div>
        <input id="user.id" name="user.id" class="form-control" type="hidden" value="${user.id}">
        <input id="submit" type="submit" class="btn btn-primary btn-block" value="Update">
    </form>
</div>
<jsp:include page="/WEB-INF/partials/resnav.jsp">
    <jsp:param name="logged_in" value="${sessionScope.logged_in}"/>
</jsp:include>

<script>

    //Functions to check that the username is not blank. If the input is empty for a username, the submit button is disabled.
    let email = document.getElementById("email");
    let password = document.getElementById("password");

    let emptyEmail = true;
    let emptyPassword = true;


    email.oninput = function(){
        let emailInput = document.getElementById("email").value;
        if(emailInput.length > 0 ){
            document.getElementById("submit").removeAttribute("disabled");
            console.log(emptyEmail);
            emptyEmail = false;
            console.log(emptyEmail);
        }
        else{
            emptyEmail = true;
        }
    };

    password.oninput = function(){
        let passwordInput = document.getElementById("password").value;
        if(passwordInput.length > 0 ){
            document.getElementById("submit").removeAttribute("disabled");
            console.log(emptyPassword);
            emptyPassword = false;
            console.log(emptyPassword);
        }
        else{
            emptyPassword = true;
        }
    };
    document.getElementById("submit").onmouseover = function(){
        let emailInput = document.getElementById("email").value;
        let passwordInput = document.getElementById("password").value;
        if(emailInput.length > 0 && passwordInput.length > 0){
            // document.getElementById("submit").removeAttribute("disabled")
            let emptyEmail = false;
            let emptyPassword = false;
            document.getElementById("submit").removeAttribute("disabled");
        }
        else{
            emptyEmail = true;
            emptyPassword = true;
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
