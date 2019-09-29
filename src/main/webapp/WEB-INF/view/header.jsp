<%-- 
    Document   : header
    Created on : Jul 4, 2019, 1:36:09 PM
    Author     : burakzengin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>


   <c:choose>
                                    <c:when test="${user != null}">
                   
<script type="text/javascript">
var $zoho=$zoho || {};$zoho.salesiq = $zoho.salesiq || 
{widgetcode:"aa889b43d9ecad0cad621093595ec564cfe70ffd6301938a91b4030c060dc30aa9fd362f404d7afd57c74d18a1e218c5", values:{},ready:function(){
        $zoho.salesiq.chat.logo("static/images/nlogo.png");
       $zoho.salesiq.chatbutton.icon("6");
       
}};
var d=document;s=d.createElement("script");s.type="text/javascript";s.id="zsiqscript";s.defer=true;
s.src="https://salesiq.zoho.com/widget";t=d.getElementsByTagName("script")[0];t.parentNode.insertBefore(s,t);d.write("<div id='zsiqwidget'></div>");
</script>
          
                                </c:when>
                                <c:otherwise>
         
<script type="text/javascript">
var $zoho=$zoho || {};$zoho.salesiq = $zoho.salesiq || 
{widgetcode:"b299a6154c1f6aed89f3910ff6728c47a1a904d0f64313ca7d3951defdb65e3fd0ff5be8f56d0758473fe7a97cebadce", values:{},ready:function(){
	$zoho.salesiq.chat.logo("static/images/nlogo.png");
	   $zoho.salesiq.chatbutton.icon("6");


}};
var d=document;
s=d.createElement("script");
s.type="text/javascript";
s.id="zsiqscript";
s.defer=true;
s.src="https://salesiq.zoho.eu/widget";t=d.getElementsByTagName("script")[0];t.parentNode.insertBefore(s,t);d.write("<div id='zsiqwidget'></div>");
//$zoho.salesiq.chat.logo("http://localhost:8009/BookingPetz/static/images/bookingpetz2.svg");

</script>
                                </c:otherwise>
                                </c:choose>

<jsp:include page="signinModal.jsp"></jsp:include>
<jsp:include page="signupModal.jsp"></jsp:include>
<jsp:include page="signupEmail.jsp"></jsp:include>
<jsp:include page="signupVerifymail.jsp"></jsp:include>
<jsp:include page="signupVerifymailFailed.jsp"></jsp:include>
<jsp:include page="resetPasswordEmailModal.jsp"></jsp:include>
<jsp:include page="resetPasswordSendMailOK.jsp"></jsp:include>
<jsp:include page="resetPasswordSendMailFailed.jsp"></jsp:include>
<jsp:include page="resetPasswordSuccess.jsp"></jsp:include>
<jsp:include page="wrongPasswordModal.jsp"></jsp:include>
    <!-- Header -->
    <header class="header">
        <div class="header_content d-flex flex-row align-items-center justify-content-start">
            <div><img src="static/images/bookingpetz2.svg"></div>
            <div class="ml-auto d-flex flex-row align-items-center justify-content-start">
                <nav class="main_nav">
                <c:choose>
                    <c:when test="${page.equals('home')}">
                        <ul class="d-flex flex-row align-items-start justify-content-start">
                            <li class="active" style="margin-top: 10px;"><a href="home">Home</a></li>
                            <li style="margin-top: 10px;"><a href="about">About us</a></li>
                            <li style="margin-top: 10px;"><a href="blog">Blog</a></li>
                            <li style="margin-top: 10px;"><a href="contact">Contact</a></li>
                                <c:choose>
                                    <c:when test="${user != null}">
                                    <li>
                                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <img src="static/vendors/images/img.jpg" width="40" height="40" class="rounded-circle" alt="" style="margin-right: 5px;"> ${user.name} ${user.surname}
                                        </a>
                                        <div class="dropdown-menu" style="background: transparent;" aria-labelledby="navbarDropdown">
                                            <a class="dropdown-item" href="profile">Dashboard</a>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="logout">Logout</a>
                                        </div>
                                    </li>
                                </c:when>
                                <c:otherwise>
                                    <li style="margin-top: 10px;"><a href="home" data-toggle="modal" data-target="#signinForm" style="color: white;">Sign Up & Sign In</a></li>
                                    </c:otherwise>
                                </c:choose>
                        </ul>
                    </c:when>
                    <c:when test="${page.equals('about')}">
                        <ul class="d-flex flex-row align-items-start justify-content-start">
                            <li style="margin-top: 10px;"><a href="home">Home</a></li>
                            <li style="margin-top: 10px;" class="active"><a href="about">About us</a></li>
                            <li style="margin-top: 10px;"><a href="blog">Blog</a></li>
                            <li style="margin-top: 10px;"><a href="contact">Contact</a></li>
                                <c:choose>
                                    <c:when test="${user != null}">"
                                    <li>"
                                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <img src="static/vendors/images/img.jpg" width="40" height="40" class="rounded-circle" alt="" style="margin-right: 5px;"> ${user.name} ${user.surname}
                                        </a>"
                                        <div class="dropdown-menu" style="background: transparent;" aria-labelledby="navbarDropdown">
                                            <a class="dropdown-item" href="profile">Dashboard</a>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="logout">Logout</a>
                                        </div>
                                    </li>
                                </c:when>
                                <c:otherwise>
                                    <li style="margin-top: 10px;"><a href="home" data-toggle="modal" data-target="#signinForm" style="color: white;">Sign Up & Sign In</a></li>
                                    </c:otherwise>
                                </c:choose>
                        </ul>
                    </c:when>
                    <c:when test="${page.equals('blog')}">
                        <ul class="d-flex flex-row align-items-start justify-content-start">
                            <li style="margin-top: 10px;"><a href="home">Home</a></li>
                            <li style="margin-top: 10px;"><a href="about">About us</a></li>
                            <li style="margin-top: 10px;" class="active"><a href="blog">Blog</a></li>
                            <li style="margin-top: 10px;"><a href="contact">Contact</a></li>
                                <c:choose>
                                    <c:when test="${user != null}">
                                    <li>
                                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <img src="static/vendors/images/img.jpg" width="40" height="40" class="rounded-circle" alt="" style="margin-right: 5px;"> ${user.name} ${user.surname}
                                        </a>
                                        <div class="dropdown-menu" style="background: transparent;" aria-labelledby="navbarDropdown">
                                            <a class="dropdown-item" href="profile">Dashboard</a>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="logout">Logout</a>
                                        </div>
                                    </li>
                                </c:when>
                                <c:otherwise>
                                    <li style="margin-top: 10px;"><a href="home" data-toggle="modal" data-target="#signinForm" style="color: white;">Sign Up & Sign In</a></li>
                                    </c:otherwise>
                                </c:choose>
                        </ul>
                    </c:when>
                    <c:when test="${page.equals('contact')}">
                        <ul class="d-flex flex-row align-items-start justify-content-start">
                            <li style="margin-top: 10px;"><a href="home">Home</a></li>
                            <li style="margin-top: 10px;"><a href="about">About us</a></li>
                            <li style="margin-top: 10px;"><a href="blog">Blog</a></li>
                            <li style="margin-top: 10px;" class="active"><a href="contact">Contact</a></li>
                                <c:choose>
                                    <c:when test="${user != null}">
                                    <li>
                                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <img src="static/vendors/images/img.jpg" width="40" height="40" class="rounded-circle" alt="" style="margin-right: 5px;"> ${user.name} ${user.surname}
                                        </a>
                                        <div class="dropdown-menu" style="background: transparent;" aria-labelledby="navbarDropdown">
                                            <a class="dropdown-item" href="profile">Dashboard</a>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="logout">Logout</a>
                                        </div>
                                    </li>
                                </c:when>
                                <c:otherwise>
                                    <li style="margin-top: 10px;"><a href="home" data-toggle="modal" data-target="#signinForm" style="color: white;">Sign Up & Sign In</a></li>
                                    </c:otherwise>
                                </c:choose>
                        </ul>
                    </c:when>
                    <c:otherwise>
                        <ul class="d-flex flex-row align-items-start justify-content-start">
                            <li class="active" style="margin-top: 10px;"><a href="home">Home</a></li>
                            <li style="margin-top: 10px;"><a href="about">About us</a></li>
                            <li style="margin-top: 10px;"><a href="blog">Blog</a></li>
                            <li style="margin-top: 10px;"><a href="contact">Contact</a></li>
                                <c:choose>
                                    <c:when test="${user != null}">
                                    <li>
                                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <img src="static/vendors/images/img.jpg" width="40" height="40" class="rounded-circle" alt="" style="margin-right: 5px;"> ${user.name} ${user.surname}
                                        </a>
                                        <div class="dropdown-menu" style="background: transparent;" aria-labelledby="navbarDropdown">
                                            <a class="dropdown-item" href="profile">Dashboard</a>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="logout">Logout</a>
                                        </div>
                                    </li>
                                </c:when>
                                <c:otherwise>
                                    <li style="margin-top: 10px;"><a href="home" data-toggle="modal" data-target="#signinForm" style="color: white;">Sign Up & Sign In</a></li>
                                    </c:otherwise>
                                </c:choose>
                        </ul>
                    </c:otherwise>
                </c:choose>
            </nav>
            <!--<div class="book_button"><a href="home">Book Now</a></div>-->


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
                <li><a href="blog">Blog</a></li>
                <li><a href="contact">Contact</a></li>
            </ul>
        </nav>
    </div>
    <!--    <div class="menu_extra">
            <div class="book_button"><a href="#">Book Online</a></div>
            <div class="menu_phone d-flex flex-row align-items-center justify-content-center">
                <img src="static/images/phone-2.png" alt="">
                <span>0183-12345678</span>
            </div>
        </div>-->
</div>

