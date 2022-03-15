<%-- 
    Document   : Creator
    Created on : Oct 14, 2020, 4:11:57 PM
    Author     : Admin
--%>

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
        <div class="container">
            <!--begin of menu-->
            <%@include file="NavComponent.jsp" %>
            <!--end of menu-->
            <!--begin of form-->
            <form class="col-sm-12" action="create" method="post">
                <h2>Create Product</h2>
                <c:set var="E" value="${requestScope.ERR}"/>
                <div class="form-group">
                    <label for="exampleFormControlInput1">Category Type</label>
                    <select name="category_id" class="form-control" id="exampleCheck1">
                        <option value="1">Tools</option>
                        <option value="2">Measurement</option>
                        <option value="3">HomeGarden</option>
                        <option value="4">Improment</option>                               
                    </select>
                </div>
                <div class="form-group">
                    <label for="exampleFormControlInput1">Name</label>
                    <input name="name" type="text" class="form-control" id="exampleFormControlInput1" required>
                    <c:if test="${not empty E.nameDup}">
                        <font color="red">
                        ${E.nameDup}
                        </font>
                    </c:if>
                </div>
                <div class="form-group">
                    <label for="exampleFormControlInput1">Code</label>
                    <input name="code" type="text" class="form-control" id="exampleFormControlInput1" required>
                    <c:if test="${not empty E.codeDup}">
                        <font color="red">
                        ${E.codeDup}
                        </font>
                    </c:if>
                </div>
                <div class="form-group">
                    <label for="exampleFormControlInput1">Quantity</label>
                    <input name="quantity" type="number" class="form-control" id="exampleInputPhone1" min="0" required oninput="validity.valid||(value='');">
                </div>
                <div class="form-group">
                    <label for="exampleFormControlInput1">Price</label>
                    <input name="price" type="number" class="form-control" id="exampleInputPhone1" min="0" oninput="validity.valid||(value='');" required>
                </div>
                <div class="form-group">
                    <label for="exampleFormControlTextarea1">Description</label>
                    <textarea name="description" class="form-control" id="exampleFormControlTextarea1" rows="10"></textarea>
                </div>
                <div class="form-group">
                    <label for="exampleFormControlInput1">Link image</label>
                    <input name="imageLink" type="text" class="form-control" id="exampleFormControlInput1" required>
                    <c:if test="${not empty E.imageErr}">
                        <font color="red">
                        ${E.imageErr}
                        </font>
                    </c:if>
                </div>
                <div class="form-group">
                    <label for="exampleFormControlInput1">Status</label>
                    <select name="status" class="form-control" id="exampleCheck1">
                        <option value="1">Active</option>
                        <option value="0">Not Active</option>
                    </select>
                </div>
                <div><button type="submit" class="btn btn-primary">Create</button></div>
                <p>                </p>

            </form>
            <!--end of form-->
        </div>



        <!-- Bootstrap core JavaScript -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    </body>
</html>
