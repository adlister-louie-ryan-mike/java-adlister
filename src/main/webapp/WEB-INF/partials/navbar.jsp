<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<nav class="navbar navbar-default" id="navbar">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <a class="navbar-brand" href="/ads">Adlister</a>
        </div>
        <ul class="nav navbar-nav navbar-right">
            <li class="user_out"><a href="/ads/create">Create an Ad!</a></li>
            <li class="user_in"><a href="/login">Login</a></li>
            <li class="user_out"><a href="/logout">Logout</a></li>
            <li class="user_in"><a href="/register">Register!</a></li>

        </ul>
        <form action="/ads/search" method="post" class="col active-cyan-3 active-cyan-4 mb-4">
            <input name="searchBar" class="form-control" type="text" placeholder="Search" aria-label="Search">
            <input type="submit" class="btn btn-primary btn-block" value="Search">
        </form>
    </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
