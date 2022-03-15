<%-- 
    Document   : detail
    Created on : Oct 22, 2020, 4:15:23 PM
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
        <link href="css/detail.css" rel="stylesheet">

        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,700" rel="stylesheet">

    </head>

    <body>

        <!-- Navigation -->
        <%@include file="NavComponent.jsp" %>

        <!--container-->
        <div class="container">
            <div class="row mb-5">
                <div class="card">
                    <div class="container-fliud">
                        <div class="wrapper row">
                            <div class="preview col-md-6">

                                <div class="preview-pic tab-content">
                                    <div class="tab-pane active" id="pic-1"><img src="images/${product.image}" /></div>
                                </div>
                                <ul class="preview-thumbnail nav nav-tabs">
                                    <li class="active"><a data-target="#pic-1" data-toggle="tab"><img src="images/${product.image}" /></a></li>
                                </ul>

                            </div>
                            <div class="details col-md-6">
                                <h3 class="product-title">${product.name}</h3>
                                <div class="rating">
                                    <div class="stars">
                                        <span class="fa fa-star checked"></span>
                                        <span class="fa fa-star checked"></span>
                                        <span class="fa fa-star checked"></span>
                                        <span class="fa fa-star"></span>
                                        <span class="fa fa-star"></span>
                                    </div>
                                </div>
                                <p class="product-description">${product.description}</p>
                                <h4 class="price">current price: <span>$${product.price}</span></h4>

                                <div class="action">
                                    <a href="addToCart?productId=${product.id}" class="add-to-cart btn btn-default" >add to cart</a>
                                </div>
                                    
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- /.container -->

        <!-- Footer -->
        <footer class="py-5 bg-dark">
            <div class="container">
                <p class="m-0 text-center text-white">Copyright &copy; Your Website 2020</p>
            </div>
            <!-- /.container -->
        </footer>

        <!-- Bootstrap core JavaScript -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        
        
    </body>

</html>