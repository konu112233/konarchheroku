<%-- 
    Document   : blog
    Created on : Jul 5, 2019, 1:13:55 PM
    Author     : burakzengin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Blog</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="The River template project">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="stylesheet" type="text/css" href="static/styles/bootstrap-4.1.2/bootstrap.min.css">
        <link href="static/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" href="static/plugins/OwlCarousel2-2.3.4/owl.carousel.css">
        <link rel="stylesheet" type="text/css" href="static/plugins/OwlCarousel2-2.3.4/owl.theme.default.css">
        <link rel="stylesheet" type="text/css" href="static/plugins/OwlCarousel2-2.3.4/animate.css">
        <link href="static/plugins/jquery-datepicker/jquery-ui.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" href="static/styles/blog.css">
        <link rel="stylesheet" type="text/css" href="static/styles/blog_responsive.css">
    </head>
    <body>

        <div class="super_container">

            <jsp:include page="header.jsp"></jsp:include>

                <!-- Home -->

                <div class="home">
                    <div class="background_image" style="background-image:url(static/images/blogheader.jpg)"></div>
                    <div class="home_container">
                        <div class="container">
                            <div class="row">
                                <div class="col">
                                    <div class="home_content text-center">
                                        <div class="home_title">Blog</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Blog -->

                <div class="blog">
                    <div class="container">
                        <div class="row">

                            <!-- Blog Posts -->
                            <div class="col-lg-9">
                                <div class="blog_posts">

                                    <!-- Blog Post -->
                                    <div class="blog_post">
                                        <div class="blog_post_image">
                                            <img src="static/images/blogartical1.jpg" alt="">
                                            <div class="blog_post_date"><a href="#">Oct 20, 2018</a></div>
                                        </div>
                                        <div class="blog_post_content">
                                            <div class="blog_post_title"><a href="#">The ultimate guide of pet-friendly places in Amsterdam</a></div>
                                            <div class="blog_post_info">
                                                <ul class="d-flex flex-row align-items-start justify-content-start flex-wrap">
                                                    <li class="d-flex flex-row align-items-center justify-content-start">
                                                        <img src="static/images/icon_4.png" alt="">
                                                        <a href="#">News</a>
                                                    </li>
                                                    <li class="d-flex flex-row align-items-center justify-content-start">
                                                        <img src="static/images/icon_5.png" alt="">
                                                        <a href="#">21 Likes</a>
                                                    </li>
                                                    <li class="d-flex flex-row align-items-center justify-content-start">
                                                        <img src="static/images/icon_6.png" alt="">
                                                        <a href="#">602 views</a>
                                                    </li>
                                                    <li class="d-flex flex-row align-items-center justify-content-start">
                                                        <img src="static/images/icon_7.png" alt="">
                                                        <a href="#">1 min</a>
                                                    </li>
                                                    <li class="d-flex flex-row align-items-center justify-content-start">
                                                        <img src="static/images/icon_8.png" alt="">
                                                        <a href="#">3 comments</a>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="blog_post_text">
                                                <p>Vivamus auctor mi eget odio feugiat, quis aliquet velit ornare. Integer egestas sit amet neque sed elementum. Fusce ut turpis felis. Etiam pretium pharetra augue, ac porttitor dolor consequat eget. Cras tempor suscipit enim vehicula ultrices. Mauris sed orci blandit.</p>
                                            </div>
                                            <div class="button blog_post_button"><a href="#">Read More</a></div>
                                        </div>
                                    </div>

                                    <!-- Blog Post -->
                                    <div class="blog_post">
                                        <div class="blog_post_image">
                                            <img src="static/images/blogartical2.jpg" alt="">
                                            <div class="blog_post_date"><a href="#">Oct 20, 2018</a></div>
                                        </div>
                                        <div class="blog_post_content">
                                            <div class="blog_post_title"><a href="#">Dog's emotional life</a></div>
                                            <div class="blog_post_info">
                                                <ul class="d-flex flex-row align-items-start justify-content-start flex-wrap">
                                                    <li class="d-flex flex-row align-items-center justify-content-start">
                                                        <img src="static/images/icon_4.png" alt="">
                                                        <a href="#">News</a>
                                                    </li>
                                                    <li class="d-flex flex-row align-items-center justify-content-start">
                                                        <img src="static/images/icon_5.png" alt="">
                                                        <a href="#">21 Likes</a>
                                                    </li>
                                                    <li class="d-flex flex-row align-items-center justify-content-start">
                                                        <img src="static/images/icon_6.png" alt="">
                                                        <a href="#">602 views</a>
                                                    </li>
                                                    <li class="d-flex flex-row align-items-center justify-content-start">
                                                        <img src="static/images/icon_7.png" alt="">
                                                        <a href="#">1 min</a>
                                                    </li>
                                                    <li class="d-flex flex-row align-items-center justify-content-start">
                                                        <img src="static/images/icon_8.png" alt="">
                                                        <a href="#">3 comments</a>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="blog_post_text">
                                                <p>Vivamus auctor mi eget odio feugiat, quis aliquet velit ornare. Integer egestas sit amet neque sed elementum. Fusce ut turpis felis. Etiam pretium pharetra augue, ac porttitor dolor consequat eget. Cras tempor suscipit enim vehicula ultrices. Mauris sed orci blandit.</p>
                                            </div>
                                            <div class="button blog_post_button"><a href="#">Read More</a></div>
                                        </div>
                                    </div>

                                    <!-- Blog Post -->
                                    <div class="blog_post">
                                        <div class="blog_post_image">
                                            <img src="static/images/blogartical3.jpg" alt="">
                                            <div class="blog_post_date"><a href="#">Oct 20, 2018</a></div>
                                        </div>
                                        <div class="blog_post_content">
                                            <div class="blog_post_title"><a href="#">Perfect beach wedding</a></div>
                                            <div class="blog_post_info">
                                                <ul class="d-flex flex-row align-items-start justify-content-start flex-wrap">
                                                    <li class="d-flex flex-row align-items-center justify-content-start">
                                                        <img src="static/images/icon_4.png" alt="">
                                                        <a href="#">News</a>
                                                    </li>
                                                    <li class="d-flex flex-row align-items-center justify-content-start">
                                                        <img src="static/images/icon_5.png" alt="">
                                                        <a href="#">21 Likes</a>
                                                    </li>
                                                    <li class="d-flex flex-row align-items-center justify-content-start">
                                                        <img src="static/images/icon_6.png" alt="">
                                                        <a href="#">602 views</a>
                                                    </li>
                                                    <li class="d-flex flex-row align-items-center justify-content-start">
                                                        <img src="static/images/icon_7.png" alt="">
                                                        <a href="#">1 min</a>
                                                    </li>
                                                    <li class="d-flex flex-row align-items-center justify-content-start">
                                                        <img src="static/images/icon_8.png" alt="">
                                                        <a href="#">3 comments</a>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="blog_post_text">
                                                <p>Vivamus auctor mi eget odio feugiat, quis aliquet velit ornare. Integer egestas sit amet neque sed elementum. Fusce ut turpis felis. Etiam pretium pharetra augue, ac porttitor dolor consequat eget. Cras tempor suscipit enim vehicula ultrices. Mauris sed orci blandit.</p>
                                            </div>
                                            <div class="button blog_post_button"><a href="#">Read More</a></div>
                                        </div>
                                    </div>

                                    <!-- Page Nav -->
<!--                                    <div class="page_nav">
                                        <ul class="d-flex flex-row align-items-start justify-content-start">
                                            <li class="active"><a href="#">01.</a></li>
                                            <li><a href="#">02.</a></li>
                                            <li><a href="#">03.</a></li>
                                        </ul>
                                    </div>-->

                                </div>
                            </div>

                            <!-- Sidebar -->
                            <div class="col-lg-3">
                                <div class="sidebar">

                                    <!-- Search -->
                                    <div class="sidebar_search">
                                        <form action="#" class="sidebar_search_form" id="sidebar_saerch_form">
                                            <input type="text" class="sidebar_search_input" placeholder="Keyword" required="required">
                                            <button class="sidebar_search_button">Search</button>
                                        </form>
                                    </div>

                                    <!-- Recent Posts -->
                                    <div class="recent_posts">
                                        <div class="sidebar_title"><h4>Recent Posts</h4></div>
                                        <div class="sidebar_list">
                                            <ul>
                                                <li><a href="#">Featured Product</a></li>
                                                <li><a href="#">Standard Post</a></li>
                                                <li><a href="#">Gallery Post</a></li>
                                                <li><a href="#">Video Post</a></li>
                                                <li><a href="#">Audio Post</a></li>
                                            </ul>
                                        </div>
                                    </div>

                                    <!-- Categories -->
                                    <div class="categories">
                                        <div class="sidebar_title"><h4>Categories</h4></div>
                                        <div class="sidebar_list">
                                            <ul>
                                                <li><a href="#">News</a></li>
                                                <li><a href="#">Hotel</a></li>
                                                <li><a href="#">Vacation</a></li>
                                            </ul>
                                        </div>
                                    </div>

                                    <!-- Tags -->
                                    <div class="tags">
                                        <div class="sidebar_title"><h4>Tags</h4></div>
                                        <div class="tags_container">
                                            <ul class="d-flex flex-row align-items-start justify-content-start flex-wrap">
                                                <li><a href="#">news</a></li>
                                                <li><a href="#">hotel</a></li>
                                                <li><a href="#">vacation</a></li>
                                                <li><a href="#">reservation</a></li>
                                                <li><a href="#">booking</a></li>
                                                <li><a href="#">video</a></li>
                                                <li><a href="#">clients</a></li>
                                                <li><a href="#">reviews</a></li>
                                                <li><a href="#">destinations</a></li>
                                                <li><a href="#">swimming pool</a></li>
                                            </ul>
                                        </div>
                                    </div>

                                    <!-- Special Offer -->
                                    <div class="special_offer">
                                        <div class="background_image" style="background-image:url(static/images/hotel1.jpg)"></div>
                                        <div class="special_offer_container text-center">
                                            <div class="special_offer_title">Special Offer</div>
                                            <div class="special_offer_subtitle">Pet Room</div>
                                            <div class="button special_offer_button"><a href="#">Book now</a></div>
                                        </div>
                                    </div>

                                </div>
                            </div>

                        </div>
                    </div>
                </div>

                <!-- Footer -->


                <!-- Footer -->
            <jsp:include page="footer.jsp"></jsp:include>

        </div>

        <script src="static/js/jquery-3.3.1.min.js"></script>
        <script src="static/styles/bootstrap-4.1.2/popper.js"></script>
        <script src="static/styles/bootstrap-4.1.2/bootstrap.min.js"></script>
        <script src="static/plugins/greensock/TweenMax.min.js"></script>
        <script src="static/plugins/greensock/TimelineMax.min.js"></script>
        <script src="static/plugins/scrollmagic/ScrollMagic.min.js"></script>
        <script src="static/plugins/greensock/animation.gsap.min.js"></script>
        <script src="static/plugins/greensock/ScrollToPlugin.min.js"></script>
        <script src="static/plugins/OwlCarousel2-2.3.4/owl.carousel.js"></script>
        <script src="static/plugins/easing/easing.js"></script>
        <script src="static/plugins/progressbar/progressbar.min.js"></script>
        <script src="static/plugins/parallax-js-master/parallax.min.js"></script>
        <script src="static/plugins/jquery-datepicker/jquery-ui.js"></script>
        <script src="static/js/blog.js"></script>
    </body>
</html>