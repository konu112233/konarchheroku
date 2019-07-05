<%-- 
    Document   : header
    Created on : Jul 4, 2019, 1:36:09 PM
    Author     : burakzengin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<!-- Header -->
<header class="header">
    <div class="header_content d-flex flex-row align-items-center justify-content-start">
        <div><img src="static/images/bookingpetz2.svg"></div>
        <div class="ml-auto d-flex flex-row align-items-center justify-content-start">
            <nav class="main_nav">
                <c:choose>
                    <c:when test="${page.equals('home')}">
                        <ul class="d-flex flex-row align-items-start justify-content-start">
                            <li class="active"><a href="home">Home</a></li>
                            <li><a href="about">About us</a></li>
                            <li><a href="#">Blog</a></li>
                            <li><a href="#">Contact</a></li>
                        </ul>
                    </c:when>
                    <c:when test="${page.equals('about')}">
                        <ul class="d-flex flex-row align-items-start justify-content-start">
                            <li><a href="home">Home</a></li>
                            <li class="active"><a href="about">About us</a></li>
                            <li><a href="#">Blog</a></li>
                            <li><a href="#">Contact</a></li>
                        </ul>
                    </c:when>
                </c:choose>
            </nav>
            <div class="book_button"><a href="#">Book Now</a></div>
            <div class="header_phone d-flex flex-row align-items-center justify-content-center">
                <img src="static/images/phone.png" alt="">
                <span>0183-12345678</span>
            </div>

            <!-- Hamburger Menu -->
            <div class="hamburger"><i class="fa fa-bars" aria-hidden="true"></i></div>
        </div>
    </div>
</header>

<!-- Menu -->

<div class="menu trans_400 d-flex flex-column align-items-end justify-content-start">
    <div class="menu_close"><i class="fa fa-times" aria-hidden="true"></i></div>
    <div class="menu_content">
        <nav class="menu_nav text-right">
            <ul>
                <li><a href="home">Home</a></li>
                <li><a href="about">About us</a></li>
                <li><a href="#">Blog</a></li>
                <li><a href="#">Contact</a></li>
            </ul>
        </nav>
    </div>
    <div class="menu_extra">
        <div class="book_button"><a href="#">Book Online</a></div>
        <div class="menu_phone d-flex flex-row align-items-center justify-content-center">
            <img src="static/images/phone-2.png" alt="">
            <span>0183-12345678</span>
        </div>
    </div>
</div>

