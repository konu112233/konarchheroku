<%-- 
    Document   : dashboardHeader
    Created on : Jul 12, 2019, 11:46:35 AM
    Author     : burakzengin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<div class="col-md-3 left_col">
    <div class="left_col scroll-view">
        <div class="navbar nav_title" style="border: 0;">
            <a href="profile" class="site_title"><img class="mb-4" src="static/images/svg/logobookingpetz.svg" alt="" width="52" height="52"> <span style="color: #3d9756; margin-left: 10px;"> Bookingpetz</span></a>
        </div>
        <div class="clearfix"></div>

        <div class="profile clearfix">
            <div class="profile_pic">
                <img src="static/vendors/images/img.jpg" alt="..." class="img-circle profile_img">
            </div>
            <div class="profile_info">
                <span>Welcome,</span>
                <h2>${user.name} ${user.surname}</h2>
            </div>
        </div>

        <br />

        <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
            <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
                <div class="menu_section">
                    <h3>General</h3>
                    <ul class="nav side-menu">
                        <li><a href="profile"><i class="fa fa-user"></i> Profile </a></li>
                        <li><a href="calendar"><i class="fa fa-calendar fa-lg" ></i>Calendar </a></li>
                        <li>
                            <c:choose>
                                <c:when test="${partner.equals('hotel')}">
                                </c:when>
                                <c:otherwise>
                                    <a href="myPets"><i class="fas fa-cat fa-lg" style="margin-right: 10px;"></i>My Pets </a>
                                </c:otherwise>
                            </c:choose>
                        </li>
                        <li>
                            <c:choose>
                                <c:when test="${partner.equals('hotel')}">
                                    <a href="hotelOwner"><i class="fa fa-hotel fa-lg" ></i>Hotel Owner</a>
                                </c:when>
                                <c:otherwise>
                                    <a href="hotelOwner"><i class="fa fa-hotel fa-lg" ></i>Hotel Owner <span class="fa fa-lock"></span></a>
                                    </c:otherwise>
                                </c:choose>
                        </li> 
                        <li>
                            <c:choose>
                                <c:when test="${partner.equals('hotel')}">
                                </c:when>
                                <c:otherwise>
                                    <a href="myPets"><i class="fas fa-cat fa-lg" style="margin-right: 10px;"></i>My Pets </a>
                                </c:otherwise>
                            </c:choose>
                        </li>

                        <li>
                            <c:choose>
                                <c:when test="${partner.equals('hotel')}">
                                    <a href="hotelBookings"><i class="fa fa-credit-card fa-lg" ></i>Bookings </a>
                                </c:when>
                                <c:otherwise>
                                    <a href="bookings"><i class="fa fa-credit-card fa-lg" ></i>Bookings </a>
                                </c:otherwise>
                            </c:choose>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="top_nav">
    <div class="nav_menu">
        <nav>
            <div class="nav toggle">
                <a id="menu_toggle"><i class="fa fa-bars"></i></a>
            </div>
            <ul class="nav navbar-nav navbar-right">
                <li class="">
                    <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                        <img src="static/vendors/images/img.jpg" alt="">${user.name} ${user.surname}
                        <span class=" fa fa-angle-down"></span>
                    </a>
                    <ul class="dropdown-menu dropdown-usermenu pull-right">
                        <li><a href="home"> Home</a></li>
                        <li><a href="javascript:;">Help</a></li>
                        <li><a href="logout"><i class="fa fa-sign-out pull-right"></i> Log Out</a></li>
                    </ul>
                </li>
                <li role="presentation" class="dropdown">
                    <a href="javascript:;" class="dropdown-toggle info-number" data-toggle="dropdown" aria-expanded="false">
                        <i class="fa fa-envelope-o"></i>
                        <span class="badge bg-green">6</span>
                    </a>
                    <ul id="menu1" class="dropdown-menu list-unstyled msg_list" role="menu">
                        <li>
                            <a>
                                <span class="image"><img src="static/vendors/images/img.jpg" alt="Profile Image" /></span>
                                <span>
                                    <span>John Smith</span>
                                    <span class="time">3 mins ago</span>
                                </span>
                                <span class="message">
                                    Film festivals used to be do-or-die moments for movie makers. They were where...
                                </span>
                            </a>
                        </li>
                        <li>
                            <a>
                                <span class="image"><img src="static/vendors/images/img.jpg" alt="Profile Image" /></span>
                                <span>
                                    <span>John Smith</span>
                                    <span class="time">3 mins ago</span>
                                </span>
                                <span class="message">
                                    Film festivals used to be do-or-die moments for movie makers. They were where...
                                </span>
                            </a>
                        </li>
                        <li>
                            <a>
                                <span class="image"><img src="static/vendors/images/img.jpg" alt="Profile Image" /></span>
                                <span>
                                    <span>John Smith</span>
                                    <span class="time">3 mins ago</span>
                                </span>
                                <span class="message">
                                    Film festivals used to be do-or-die moments for movie makers. They were where...
                                </span>
                            </a>
                        </li>
                        <li>
                            <a>
                                <span class="image"><img src="static/vendors/images/img.jpg" alt="Profile Image" /></span>
                                <span>
                                    <span>John Smith</span>
                                    <span class="time">3 mins ago</span>
                                </span>
                                <span class="message">
                                    Film festivals used to be do-or-die moments for movie makers. They were where...
                                </span>
                            </a>
                        </li>
                        <li>
                            <div class="text-center">
                                <a>
                                    <strong>See All Alerts</strong>
                                    <i class="fa fa-angle-right"></i>
                                </a>
                            </div>
                        </li>
                    </ul>
                </li>
            </ul>
        </nav>
    </div>
</div>
