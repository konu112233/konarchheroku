<%-- 
    Document   : contact
    Created on : Jul 5, 2019, 1:27:41 PM
    Author     : burakzengin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Contact</title>
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
        <link rel="stylesheet" type="text/css" href="static/styles/contact.css">
        <link rel="stylesheet" type="text/css" href="static/styles/contact_responsive.css">
    </head>
    <body>

        <div class="super_container">

            <!-- Header -->
            <jsp:include page="header.jsp"></jsp:include>
                <!-- Home -->

                <div class="home">
                    <div class="background_image" style="background-image:url(static/images/contactheader.jpg)"></div>
                    <div class="home_container">
                        <div class="container">
                            <div class="row">
                                <div class="col">
                                    <div class="home_content text-center">
                                        <div class="home_title">Contact</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Contact -->

                <div class="contact">
                    <div class="container">
                        <div class="row">

                            <!-- Contact Content -->
                            <div class="col-lg-6">
                                <div class="contact_content">
                                    <div class="contact_title"><h2>Get in touch</h2></div>
                                    <div class="contact_list">
                                        <ul>
                                            <li>Zandpad 3A, 1054GA Amsterdam, Netherlands</li>
                                            <li>+546 990221 123</li>
                                            <li>info@bookingpetz.com</li>
                                        </ul>
                                    </div>
                                    <div class="contact_form_container">
                                        <form action="#" class="contact_form" id="contact_form">
                                            <div class="row">
                                                <div class="col-md-6 input_container">
                                                    <input type="text" class="contact_input" placeholder="Your name" required="required">
                                                </div>
                                                <div class="col-md-6 input_container">
                                                    <input type="email" class="contact_input" placeholder="Your email address" required="required">
                                                </div>
                                            </div>
                                            <div class="input_container"><input type="text" class="contact_input" placeholder="Subject"></div>
                                            <div class="input_container"><textarea class="contact_input contact_textarea" placeholder="Message" required="required"></textarea></div>
                                            <button class="contact_button">Send</button>
                                        </form>
                                    </div>
                                </div>
                            </div>

                            <!-- Google Map -->
                            <div class="col-xl-5 col-lg-6 offset-xl-1">
                                <div class="contact_map">

                                    <!-- Google Map -->
                                    <div class="map">
                                        <div id="google_map" class="google_map">
                                            <div class="map_container">
                                                <div id="map"></div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>

                        </div>
                    </div>
                </div>

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
        <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&key=AIzaSyCRtVM7tqQzSYlpZbNQMApgii7DU5IhMSc"></script>
        <script src="static/js/contact.js"></script>
    </body>
</html>
