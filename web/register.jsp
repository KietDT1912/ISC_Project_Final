<%-- 
    Document   : register
    Created on : Oct 23, 2020, 12:45:28 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                    <form action="register" method="POST">
                        <h3>Register Form</h3>
                        <c:set var="E" value="${requestScope.Err}"/>
                        <div class="form-group">
                            <label for="exampleInputUsername1">Username</label>
                            <input type="text" class="form-control" id="exampleInputUsername1" aria-describedby="emailHelp" name="username" required>
                            <small id="emailHelp" class="form-text text-muted">We'll never share your username with anyone else.</small>
                            <c:if test="${not empty E.usernameDup}">
                                <font color="red">
                                ${E.usernameDup}
                                </font>
                            </c:if>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1">Password</label>
                            <input type="password" class="form-control" id="exampleInputPassword1" name="password" required>
                            <small id="emailHelp" class="form-text text-muted">We'll never share your password with anyone else.</small>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1">How Can We Call You</label>
                            <input type="text" class="form-control" id="exampleInputPassword1" name="displayName" required>
                            <small id="emailHelp" class="form-text text-muted">We want to direct you towards the friendliest.</small>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">Address</label>
                            <input type="text" class="form-control" id="exampleInputAddress" name="address" required>
                            <small id="emailHelp" class="form-text text-muted">We'll never share your address with anyone else.</small>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">Email</label>
                            <input type="email" class="form-control" id="exampleInputEmail1" name="email" required>
                            <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                             <c:if test="${not empty E.emailDup}">
                                <font color="red">
                                ${E.emailDup}
                                </font>
                            </c:if>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPhone1">Phone</label>
                            <input type="number" class="form-control" id="exampleInputPhone1" name="phone"  required>
                            <small id="emailHelp" class="form-text text-muted">We'll never share your phone with anyone else.</small>
                             <c:if test="${not empty E.phoneDup}">
                                <font color="red">
                                ${E.phoneDup}
                                </font>
                            </c:if>
                        </div>
                        <div>
                            ${err}
                        </div>
                        <button type="submit" class="btn btn-primary">Register</button>
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

