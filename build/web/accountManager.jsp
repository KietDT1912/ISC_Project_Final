<%-- 
    Document   : accountManager
    Created on : Oct 25, 2020, 9:39:38 AM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Account Manager</title>

        <!-- Bootstrap core CSS -->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="css/shop-homepage.css" rel="stylesheet">
    </head>
    <body>
        <!-- Navigation -->
        <%@include file="NavComponent.jsp" %>


        <div class="container">
            <div class="row">
                
                    <div class="card-body">
                        
                            <table class="table table-borderless table-dark">
                                <thead>
                                    <tr>
                                        <th scope="col">#</th>
                                        <th scope="col">UserName</th>
                                        <th scope="col">Password</th>
                                        <th scope="col">Display Name</th>
                                        <th scope="col">Address</th>
                                        <th scope="col">Email</th>
                                        <th scope="col">Phone</th>
                                        <th scope="col">Status</th>
                                        <th scope="col">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${listAccount}" var="A">
                                        <tr>
                                            <th scope="row">1</th>
                                            <td>${A.userName}</td>
                                            <td>${A.password}</td>
                                            <td>${A.displayName}</td>
                                            <td>${A.address}</td>
                                            <td>${A.email}</td>
                                            <td>${A.phone}</td>
                                            <c:choose>

                                                <c:when test="${A.status ==1}">
                                                    <td>Active</td>
                                                    <td><a href="ban?userName=${A.userName}" class="btn btn-info">Ban</a></td>
                                                </c:when>
                                                <c:otherwise>
                                                    <td>Not Active</td>
                                                    <td><a href="unban?userName=${A.userName}" class="btn btn-info">UnBan</a></td>
                                                </c:otherwise>

                                            </c:choose>

                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        
                    </div>
                </div>
            
        </div>

        <!-- Footer -->
<!--        <footer class="py-5 bg-dark">
            <div class="container">
                <p class="m-0 text-center text-white">Copyright &copy; Your Website 2020</p>
            </div>
             /.container 
        </footer>-->

        <!-- Bootstrap core JavaScript -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
