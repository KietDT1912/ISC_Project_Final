<%-- 
    Document   : home
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

    </head>

    <body>

        <!-- Navigation -->
        <%@include file="NavComponent.jsp" %>

        <!-- Page Content -->
        <div class="container">

            <div class="row">

                <%@include file="sideBarComponent.jsp"%>
                <!-- /.col-lg-3 -->

                <div class="col-lg-9">

                    <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
                        <ol class="carousel-indicators">
                            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                        </ol>
                        <div class="carousel-inner" role="listbox">
                            <div class="carousel-item active">
                                <img class="d-block img-fluid" src="images/slide1.jpg" alt="First slide">
                            </div>
                            <div class="carousel-item">
                                <img class="d-block img-fluid" src="images/slide2.jpg" alt="Second slide">
                            </div>
                            <div class="carousel-item">
                                <img class="d-block img-fluid" src="images/slide3.jpg" alt="Third slide">
                            </div>
                        </div>
                        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="sr-only">Next</span>
                        </a>
                    </div>

                    <div class="row">
                        <c:forEach items="${listProduct}" var="P">
                            <div class="col-lg-4 col-md-6 mb-4">
                                <div class="card h-100">
                                    <a href="detail?productId=${P.id}"><img class="card-img-top" src="images/${P.image}" alt=""></a>
                                    <div class="card-body">
                                        <h4 class="card-title">
                                            <a href="#">${P.name}</a>
                                        </h4>
                                        <h5>Price: ${P.price}</h5>
                                        <p class="card-text">${P.description}</p>
                                    </div>
                                    <div class="card-footer">
                                         <a href="addToCart?productId=${P.id}" class="btn btn-outline-primary">Add To Cart</a>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>

                    </div>
                    <!-- /.row -->
                    <c:if test="${totalPage > 1}">
                        <nav aria-label="..." class="d-flex justify-content-center">
                            <ul class="pagination pagination-lg">
                                <c:forEach begin="1" end="${totalPage}" var="i">
                                    <c:choose>
                                        <c:when test="${pageIndex == i}">
                                            <li class="page-item active" aria-current="page">
                                                <span class="page-link">
                                                    ${i}
                                                    <span class="sr-only">(current)</span>
                                                </span>
                                            </li>
                                        </c:when>
                                        <c:otherwise>
                                            <li class="page-item"><a class="page-link" href="home?pageIndex=${i}">${i}</a></li>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                            </ul>
                        </nav>
                    </c:if>
                </div>
                <!-- /.col-lg-9 -->

            </div>
            <!-- /.row -->

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