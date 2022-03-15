<%-- 
    Document   : login
    Created on : Oct 23, 2020, 12:43:44 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Shop Homepage - Start Bootstrap Template</title>

        <!-- Bootstrap core CSS -->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="css/shop-homepage.css" rel="stylesheet">

    </head>

    <body>


        <!-- Page Content -->
        <div class="container">

            <div class="row">
                <div class="col-lg-3"></div>
                <div class="col-lg-6">
                    <form action="login" method="POST">
                        <h3>Login Form</h3>
                        <div class="form-group">
                            <label for="exampleInputUsername1">Username</label>
                            <input type="text" class="form-control" id="exampleInputUsername1" aria-describedby="emailHelp" name="username">
                            <small id="emailHelp" class="form-text text-muted">We'll never share your username with anyone else.</small>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1">Password</label>
                            <input type="password" class="form-control" id="exampleInputPassword1" name="password">
                            <small id="emailHelp" class="form-text text-muted">We'll never share your password with anyone else.</small>
                        </div>
                        <div class="form-group form-check">
                            <input name="remember" type="checkbox" class="form-check-input" id="exampleCheck1">
                            <label class="form-check-label" for="exampleCheck1">Remember me</label>
                        </div>
                        <h4 style="color: red">${err}</h4>
                        <button type="submit" class="btn btn-primary">Login</button>
                    </form>
                </div>
                <div class="col-lg-3"></div>
            </div>

        </div>
        <!-- /.container -->



        <!-- Bootstrap core JavaScript -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    </body>

</html>
