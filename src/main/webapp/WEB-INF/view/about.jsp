<!DOCTYPE html>
<html lang="en">
    <head>
        <title>About us</title>
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
        <link rel="stylesheet" type="text/css" href="static/styles/about.css">
        <link rel="stylesheet" type="text/css" href="static/styles/about_responsive.css">

    </head>
    <body>

        <div class="super_container">
            <jsp:include page="header.jsp"></jsp:include>
                <!-- Home -->
                <div class="home">
                    <div class="background_image" style="background-image:url(static/images/aboutheader.jpg)"></div>
                    <div class="home_container">
                        <div class="container">
                            <div class="row">
                                <div class="col">
                                    <div class="home_content text-center">
                                        <div class="home_title">About Us</div>
                                        <div class="booking_form_container">
                                            <form action="#" class="booking_form">
                                                <div class="d-flex flex-xl-row flex-column align-items-start justify-content-start">
                                                    <div class="booking_input_container d-flex flex-lg-row flex-column align-items-start justify-content-start">
                                                        <div><input type="text" class="booking_input booking_input_b" placeholder="Where ?" required="required"></div>
                                                        <div><input type="text" class="datepicker booking_input booking_input_a booking_in" placeholder="Check in" required="required"></div>
                                                        <div><input type="text" class="datepicker booking_input booking_input_a booking_out" placeholder="Check out" required="required"></div>
                                                        <div>
                                                            <select class="booking_input booking_input_c form-control" style="height: 54px;" required="required">
                                                                <option>Dog</option>
                                                                <option>Cat</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div><button class="booking_button trans_200">Find Now</button></div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- About -->

                <div class="about">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="about_title"><h2>The Bookingpetz / 10 years of excellence</h2></div>
                            </div>
                        </div>
                        <div class="row about_row">

                            <!-- About Content -->
                            <div class="col-lg-6">
                                <div class="about_content">
                                    <div class="about_text">
                                        <p>Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Suspendisse nec faucibus velit. Quisque eleifend orci ipsum, a bibendum lacus suscipit sit. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Suspendisse nec faucibus velit. Quisque eleifend orci ipsum, a bibendum lacus suscipit sit. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Suspendisse nec faucibus velit.</p>
                                    </div>
                                    <div class="about_sig"><img src="static/images/sig.png" alt=""></div>
                                </div>
                            </div>

                            <div class="col-lg-2"></div>
                            <!-- About Images -->
                            <div class="col-lg-4">
                                <div class="about_images d-flex flex-row align-items-start justify-content-between flex-wrap">
                                    <img src="static/images/storeicon.png" alt="">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Split Section Right -->

                <div class="split_section_right container_custom">
                    <div class="container">
                        <div class="row row-xl-eq-height">

                            <div class="col-xl-6 order-xl-1 order-2">
                                <div class="split_section_image">
                                    <div class="background_image" style="background-image:url(static/images/milestones.jpg)"></div>
                                </div>
                            </div>

                            <div class="col-xl-6 order-xl-2 order-1">
                                <div class="split_section_right_content">
                                    <div class="split_section_title"><h1>Luxury Resort</h1></div>
                                    <div class="split_section_text">
                                        <p>Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Suspendisse nec faucibus velit. Quisque eleifend orci ipsum, a bibendum lacus suscipit sit. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Suspendisse nec faucibus velit. Quisque eleifend orci ipsum, a bibendum lacus suscipit sit. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Suspendisse nec faucibus velit. Quisque eleifend orci.</p>
                                    </div>

                                    <!-- Milestones -->
                                    <div class="milestones_container d-flex flex-row align-items-start justify-content-start flex-wrap">

                                        <!-- Milestone -->
                                        <div class="milestone d-flex flex-row align-items-start justify-content-start">
                                            <div class="milestone_content">
                                                <div class="milestone_counter" data-end-value="45">0</div>
                                                <div class="milestone_title">Rooms available</div>
                                            </div>
                                        </div>

                                        <!-- Milestone -->
                                        <div class="milestone d-flex flex-row align-items-start justify-content-start">
                                            <div class="milestone_content">
                                                <div class="milestone_counter" data-end-value="21" data-sign-after="K">0</div>
                                                <div class="milestone_title">Tourists this year</div>
                                            </div>
                                        </div>

                                        <!-- Milestone -->
                                        <div class="milestone d-flex flex-row align-items-start justify-content-start">
                                            <div class="milestone_content">
                                                <div class="milestone_counter" data-end-value="2">0</div>
                                                <div class="milestone_title">Swimming pools</div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>

                <!-- Split Section Left -->

                <div class="split_section_left container_custom">
                    <div class="container">
                        <div class="row">
                            <div class="col-xl-6">
                                <div class="split_section_left_content">
                                    <div class="split_section_title"><h1>Wedding venue</h1></div>
                                    <div class="split_section_text">
                                        <p>Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Suspendisse nec faucibus velit. Quisque eleifend orci ipsum, a bibendum lacus suscipit sit. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Suspendisse nec faucibus velit. Quisque eleifend orci ipsum, a bibendum lacus suscipit sit. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Suspendisse nec faucibus velit. Quisque eleifend orci.</p>
                                    </div>

                                    <!-- Loaders -->
                                    <div class="loaders_container d-flex flex-row align-items-start justify-content-start flex-wrap">

                                        <!-- Loader -->
                                        <div class="loader_container text-center">
                                            <div class="loader text-center" data-perc="0.9">
                                                <div class="loader_content">
                                                    <div class="loader_title">Good Services</div>
                                                </div>
                                            </div>
                                        </div>

                                        <!-- Loader -->
                                        <div class="loader_container text-center">
                                            <div class="loader text-center" data-perc="0.8">
                                                <div class="loader_content">
                                                    <div class="loader_title">Tourists</div>
                                                </div>
                                            </div>
                                        </div>

                                        <!-- Loader -->
                                        <div class="loader_container text-center">
                                            <div class="loader text-center" data-perc="1.0">
                                                <div class="loader_content">
                                                    <div class="loader_title">Satisfaction</div>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>

                            <!-- Loaders Image -->
                            <div class="col-xl-6">
                                <div class="split_section_image split_section_left_image">
                                    <div class="background_image" style="background-image:url(static/images/loaders.jpg)"></div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>

                <!-- Testimonials -->

                <div class="testimonials">
                    <div class="parallax_background parallax-window" data-parallax="scroll" data-image-src="static/images/animal10.jpg" data-speed="0.8"></div>
                    <div class="testimonials_overlay"></div>
                    <div class="container">
                        <div class="row">
                            <div class="col">
                                <div class="testimonials_slider_container">

                                    <!-- Testimonials Slider -->
                                    <div class="owl-carousel owl-theme test_slider">

                                        <!-- Slide -->
                                        <div  class="test_slider_item text-center">
                                            <div class="rating rating_5 d-flex flex-row align-items-start justify-content-center"><i></i><i></i><i></i><i></i><i></i></div>
                                            <div class="testimonial_title"><a href="#">Perfect Stay</a></div>
                                            <div class="testimonial_text">
                                                <p>Etiam nec odio vestibulum est mattis effic iturut magna. Pellentesque sit amet tellus blandit. Etiam nec odio vestibulum est mattis effic.</p>
                                            </div>
                                            <div class="testimonial_image"><img src="static/images/user_1.jpg" alt=""></div>
                                            <div class="testimonial_author"><a href="#">Samantha Smith</a>, Greece</div>
                                        </div>

                                        <!-- Slide -->
                                        <div  class="test_slider_item text-center">
                                            <div class="rating rating_5 d-flex flex-row align-items-start justify-content-center"><i></i><i></i><i></i><i></i><i></i></div>
                                            <div class="testimonial_title"><a href="#">Nice place</a></div>
                                            <div class="testimonial_text">
                                                <p>Etiam nec odio vestibulum est mattis effic iturut magna. Pellentesque sit amet tellus blandit. Etiam nec odio vestibulum est mattis effic.</p>
                                            </div>
                                            <div class="testimonial_image"><img src="static/images/user_2.jpg" alt=""></div>
                                            <div class="testimonial_author"><a href="#">Michael Doe</a>, Italy</div>
                                        </div>

                                        <!-- Slide -->
                                        <div  class="test_slider_item text-center">
                                            <div class="rating rating_5 d-flex flex-row align-items-start justify-content-center"><i></i><i></i><i></i><i></i><i></i></div>
                                            <div class="testimonial_title"><a href="#">We loved it</a></div>
                                            <div class="testimonial_text">
                                                <p>Etiam nec odio vestibulum est mattis effic iturut magna. Pellentesque sit amet tellus blandit. Etiam nec odio vestibulum est mattis effic.</p>
                                            </div>
                                            <div class="testimonial_image"><img src="static/images/user_3.jpg" alt=""></div>
                                            <div class="testimonial_author"><a href="#">Luis Garcia</a>, Spain</div>
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
        <script src="static/js/about.js"></script>
    </body>
</html>