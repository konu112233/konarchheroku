<%-- 
    Document   : property
    Created on : Jul 7, 2019, 6:59:43 PM
    Author     : burakzengin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="description" content="Homes Template">
        <meta name="keywords" content="Homes, unica, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Bookingpetz.com</title>

        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i"
              rel="stylesheet">

        <!-- Css Styles -->
        <link rel="stylesheet" href="static/searchResult/css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="static/searchResult/css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="static/searchResult/css/nice-select.css" type="text/css">
        <link rel="stylesheet" href="static/searchResult/css/owl.carousel.min.css" type="text/css">
        <link rel="stylesheet" href="static/searchResult/css/flaticon.css" type="text/css">
        <link rel="stylesheet" href="static/searchResult/css/slicknav.min.css" type="text/css">
        <link rel="stylesheet" href="static/searchResult/css/jquery-ui.min.css" type="text/css">
        <link rel="stylesheet" href="static/searchResult/css/style.css" type="text/css">

        <link rel="stylesheet" type="text/css" href="static/styles/bootstrap-4.1.2/bootstrap.min.css">
        <link href="static/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" href="static/plugins/OwlCarousel2-2.3.4/owl.carousel.css">
        <link rel="stylesheet" type="text/css" href="static/plugins/OwlCarousel2-2.3.4/owl.theme.default.css">
        <link rel="stylesheet" type="text/css" href="static/plugins/OwlCarousel2-2.3.4/animate.css">
        <link href="static/plugins/jquery-datepicker/jquery-ui.css" rel="stylesheet" type="text/css">
        <link href="static/plugins/colorbox/colorbox.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" href="static/searchResult/css/aboutcustom.css">
        <link rel="stylesheet" type="text/css" href="static/styles/responsive.css">
        <link href="static/aaa/css/mdb.min.css" rel="stylesheet">
    </head>

    <body>
        <!-- Page Preloder -->
        <div id="preloder">
            <div class="loader"></div>
        </div>

        <jsp:include page="header.jsp"></jsp:include>

            <div class="home" style="z-index: 10;">
                <div class="background_image" style="background-image:url(static/images/searchheaderphoto.jpg)"></div>
                <div class="home_container">
                    <div class="container">
                        <div class="row">
                            <div class="col">
                                <div class="home_content text-center">
                                    <div class="home_title" style="margin-bottom: 30px;">Search Result</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Single Property Section Begin -->
            <div class="single-property">
                <div class="container">
                    <div class="row spad-p">
                        <div class="col-lg-12">
                            <div class="property-title">
                                <h3>Country Style House with beautiful garden and terrace</h3>
                                <a href="#"><i class="fa flaticon-placeholder"></i> London, 76 Guild Street, EC3P 3WF</a>
                            </div>
                            <div class="property-price">
                                <p>Per Day</p>
                                <span>$45</span>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="property-img owl-carousel">
                                <div class="single-img">
                                    <img src="static/searchResult/img/single-property/1.jpg" alt="">
                                </div>
                                <div class="single-img">
                                    <img src="static/searchResult/img/single-property/2.jpg" alt="">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Single Property End -->
            <!-- Single Property Deatails Section Begin -->
            <section class="property-details">
                <div class="container">
                    <div class="row sp-40 spt-40">
                        <div class="col-lg-8">
                            <div class="p-ins">
                                <div class="row details-top">
                                    <div class="col-lg-12">
                                        <div class="t-details">
                                            <div class="register-id">
                                                <p>Registered ID: <span>0D05426FF1</span></p>
                                            </div>
                                            <div class="popular-room-features single-property">
                                                <div class="size">
                                                    <p>Rate</p>
                                                    <img src="static/searchResult/img/star.svg" alt="">
                                                    <i class="flaticon-bath"></i>
                                                    <span>5/5</span>
                                                </div>
                                                <div class="beds">
                                                    <p>Capacity</p>
                                                    <img src="static/searchResult/img/paw.svg" alt="">
                                                    <span>18/12</span>
                                                </div>
                                                <div class="baths">
                                                    <p>Bath</p>
                                                    <img src="static/searchResult/img/bath.svg" alt="">
                                                    <span>2</span>
                                                </div>
                                                <div class="garage">
                                                    <p>Garden</p>
                                                    <img src="static/searchResult/img/hencee.svg" alt="">
                                                    <span>1</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="property-description">
                                            <h4>Description</h4>
                                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent in justo
                                                elementum,fermentum justo ac, rutrum erat. Aenean ut malesuada diam. Proin
                                                bibendum
                                                sapien sodales, convallis dolor facilisis, ultricies nisl. Sed malesuada nibh
                                                sed
                                                velit ultricies, id varius lacus feugiat. Aenean vestibulum, nisl eget accumsan
                                                aliquam, magna diam convallis risus, in tristique metus sem eu tortor. Cras leo
                                                libero, fermentum quis aliquam et, tincidunt at dolor. </p>
                                        </div>
                                        <div class="property-features">
                                            <h4>Property Features</h4>
                                            <div class="property-table">
                                                <table>
                                                    <tr>
                                                        <td><img src="static/searchResult/img/check.png" alt=""> Home theater</td>
                                                        <td><img src="static/searchResult/img/check.png" alt=""> Carpeting</td>
                                                        <td><img src="static/searchResult/img/check.png" alt=""> Attic fans</td>
                                                    </tr>
                                                    <tr>
                                                        <td><img src="static/searchResult/img/check.png" alt=""> Media room</td>
                                                        <td><img src="static/searchResult/img/check.png" alt=""> Concrete</td>
                                                        <td><img src="static/searchResult/img/check.png" alt=""> Ceiling fans</td>
                                                    </tr>
                                                    <tr>
                                                        <td><img src="static/searchResult/img/check.png" alt=""> Family room</td>
                                                        <td><img src="static/searchResult/img/check.png" alt=""> Bamboo</td>
                                                        <td><img src="static/searchResult/img/check.png" alt=""> Thermostats</td>
                                                    </tr>
                                                    <tr>
                                                        <td><img src="static/searchResult/img/check.png" alt=""> Gym/workout room</td>
                                                        <td><img src="static/searchResult/img/check.png" alt=""> Stone</td>
                                                        <td><img src="static/searchResult/img/check.png" alt=""> Single flush toilets</td>
                                                    </tr>
                                                    <tr>
                                                        <td><img src="static/searchResult/img/check.png" alt=""> Library</td>
                                                        <td><img src="static/searchResult/img/check.png" alt=""> Tile</td>
                                                        <td><img src="static/searchResult/img/check.png" alt=""> Window shutters</td>
                                                    </tr>
                                                    <tr>
                                                        <td><img src="static/searchResult/img/check.png" alt=""> Butler's pantry</td>
                                                        <td><img src="static/searchResult/img/check.png" alt=""> Laminate</td>
                                                        <td><img src="static/searchResult/img/check.png" alt=""> Solar heat</td>
                                                    </tr>
                                                    <tr>
                                                        <td><img src="static/searchResult/img/check.png" alt=""> Sunroom</td>
                                                        <td><img src="static/searchResult/img/check.png" alt=""> Cork</td>
                                                        <td><img src="static/searchResult/img/check.png" alt=""> Solar plumbing</td>
                                                    </tr>
                                                    <tr>
                                                        <td><img src="static/searchResult/img/check.png" alt=""> Downstairs's bedroom</td>
                                                        <td><img src="static/searchResult/img/check.png" alt=""> Vinyl / linoleum</td>
                                                        <td><img src="static/searchResult/img/check.png" alt=""> Solar Screens</td>
                                                    </tr>
                                                    <tr>
                                                        <td><img src="static/searchResult/img/check.png" alt=""> Basement</td>
                                                        <td><img src="static/searchResult/img/check.png" alt=""> Manufactured wood</td>
                                                        <td><img src="static/searchResult/img/check.png" alt=""> Storm windows</td>
                                                    </tr>
                                                    <tr>
                                                        <td><img src="static/searchResult/img/check.png" alt=""> Guest quarters</td>
                                                        <td><img src="static/searchResult/img/check.png" alt=""> Marble</td>
                                                        <td><img src="static/searchResult/img/check.png" alt=""> Tankless water heater</td>
                                                    </tr>
                                                    <tr>
                                                        <td><img src="static/searchResult/img/check.png" alt=""> Wine storage</td>
                                                        <td><img src="static/searchResult/img/check.png" alt=""> Wood</td>
                                                        <td><img src="static/searchResult/img/check.png" alt=""> Skylights or sky tubes</td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </div>
                                        <div class="location-map">
                                            <h4>Location</h4>
                                            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d107002.020096289!2d-96.80666618302782!3d33.06138629992991!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x864c21da13c59513%3A0x62aa036489cd602b!2sPlano%2C+TX%2C+USA!5e0!3m2!1sen!2sbd!4v1558246953339!5m2!1sen!2sbd" allowfullscreen></iframe>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="row pb-30">
                                <div class="col-lg-12">
                                    <div class="contact-service">
                                        <img src="static/searchResult/img/single-property/small.png" alt="">
                                        <p>Listed by</p>
                                        <h5>Oliver G Harris</h5>
                                        <table>
                                            <tr>
                                                <td>Office : <span>1-139-954-3228</span></td>
                                            </tr>
                                            <tr>
                                                <td>Mobile : <span>1-517-328-7751</span></td>
                                            </tr>
                                            <tr>
                                                <td>Fax : <span>1-458-284-9871</span></td>
                                            </tr>
                                            <tr>
                                                <td>WhatsApp : <span>1-812-117-2663</span></td>
                                            </tr>
                                            <tr>
                                                <td>Email : <span>oliver@homes.com</span></td>
                                            </tr>
                                        </table>
                                        <a href="#" class="site-btn list-btn">View More Listings</a>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="room-items">
                                        <div class="room-img set-bg" data-setbg="static/searchResult/img/rooms/4.jpg">
                                            <a href="#" class="room-content">
                                                <i class="flaticon-heart"></i>
                                            </a>
                                        </div>
                                        <div class="room-text">
                                            <div class="room-details">
                                                <div class="room-title">
                                                    <h5>Country Style House with beautiful garden and terrace</h5>
                                                    <a href="#"><i class="flaticon-placeholder"></i> <span>Location</span></a>
                                                    <a href="#" class="large-width"><i class="flaticon-cursor"></i> <span>Show
                                                            on Map</span></a>
                                                </div>
                                            </div>
                                            <div class="room-features">
                                                <div class="room-info">
                                                    <div class="size">
                                                        <p>Rate</p>
                                                        <img src="static/searchResult/img/star.svg" alt="">
                                                        <i class="flaticon-bath"></i>
                                                        <span>5/5</span>
                                                    </div>
                                                    <div class="beds">
                                                        <p>Capacity</p>
                                                        <img src="static/searchResult/img/paw.svg" alt="">
                                                        <span>18/12</span>
                                                    </div>
                                                    <div class="baths">
                                                        <p>Bath</p>
                                                        <img src="static/searchResult/img/bath.svg" alt="">
                                                        <span>2</span>
                                                    </div>
                                                    <div class="garage">
                                                        <p>Garden</p>
                                                        <img src="static/searchResult/img/hencee.svg" alt="">
                                                        <span>1</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="room-price">
                                                <p>Per Day</p>
                                                <span>$45</span>
                                            </div>
                                            <a href="#" class="site-btn btn-line">View Property</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- Single Property Deatails Section End -->
            <!-- Footer Section Begin -->
        <jsp:include page="footer.jsp"></jsp:include>
        <!-- Footer Section End -->

        <!-- Js Plugins -->
        <script src="static/searchResult/js/jquery-3.3.1.min.js"></script>
        <script src="static/searchResult/js/bootstrap.min.js"></script>
        <script src="static/searchResult/js/jquery.nice-select.min.js"></script>
        <script src="static/searchResult/js/owl.carousel.min.js"></script>
        <script src="static/searchResult/js/jquery-ui.min.js"></script>
        <script src="static/searchResult/js/jquery.slicknav.js"></script>
        <script src="static/searchResult/js/main.js"></script>

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
        <script src="static/plugins/colorbox/jquery.colorbox-min.js"></script>
        <script src="static/js/custom.js"></script>
        <script src="https://kit.fontawesome.com/3135afb4f3.js"></script>

    </body>
</html>
