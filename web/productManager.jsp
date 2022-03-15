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

        <title>Product Manager</title>

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
                    
                        <table class="table table-bordered">
                            <thead class="thead-dark">
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">Image</th>
                                    <th scope="col">Name</th>
                                    <th scope="col">Code</th>
                                    <th scope="col">Quantity</th>
                                    <th scope="col">Price</th>
                                    <th scope="col">Description</th>
                                    <th scope="col">Category</th>
                                    <th scope="col">Status</th>
                                    <th scope="col">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${listProduct}" var="P">
                                    <tr>
                                        <th scope="row">${P.id}</th>
                                        <td><img class="card-img-bottom" src="images/${P.image}"></td>
                                        <td>${P.name}</td>
                                        <td>${P.code}</td>
                                        <td>${P.quantity}</td>
                                        <td>${P.price}$
                                        </td>
                                        <td>${P.description}</td>
                                        <td><select name="category">
                                                <c:forEach items="${listCategory}" var="C">
                                                    <c:if test="${P.categoryId == C.id}">
                                                        <option value="${P.categoryId}">${C.categoryName}</option>
                                                    </c:if>
                                                </c:forEach>
                                            </select></td>
                                           
                                                <c:choose>
                                                    <c:when test="${P.status ==1}">
                                                        <td>Active</td>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <td>Not Available</td>
                                                    </c:otherwise>
                                                </c:choose>
                                           
                                        <td><a href="update-product?code=${P.code}" class="btn btn-info">Update</a>
                                            <p> </p>
                                            <a href="delete-product?code=${P.code}" class="btn btn-info" onclick="return confirm('Are you sure you want to delete Product')">Delete</a></td>
                                           
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
