<%-- 
    Document   : NavComponent
    Created on : Oct 22, 2020, 4:35:55 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
        <c:choose>
            <c:when test="${sessionScope.account !=null}">
                <a class="navbar-brand">Hello: ${sessionScope.account.displayName}</a>
            </c:when>
            <c:otherwise>
                <a class="navbar-brand">Welcome To XE ĐIỆN ISC</a>
            </c:otherwise>
        </c:choose>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="home">Home
                        <span class="sr-only">(current)</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="cart">Cart</a>
                </li>
                <c:choose>
                    <c:when test="${sessionScope.account !=null}">
                        <c:if test="${sessionScope.account.role_id ==1}">
                        <li class="nav-item">
                            <a class="nav-link" href="account-manager">Account Manager</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="product-manager">Product Manager</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="create">Creator</a>
                        </li>
                        </c:if>
                        <li class="nav-item">
                            <a class="nav-link" href="logout">Logout</a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="nav-item">
                            <a class="nav-link" href="login">Login</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="register">Register</a>
                        </li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div>
    </div>
</nav>
