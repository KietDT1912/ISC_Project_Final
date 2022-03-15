<%-- 
    Document   : sideBarComponent
    Created on : Oct 22, 2020, 9:35:56 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="col-lg-3">
    
    <h1 class="my-4">Shop Name</h1>
    <div> <%@include file="searchBarComponent.jsp" %></div>
    <div class="list-group">
        <c:forEach items="${listCategory}" var="C">
            <a href="filter?categoryId=${C.id}" class="list-group-item">${C.categoryName}</a>
        </c:forEach>
    </div>
    <p></p>
    
</div>

