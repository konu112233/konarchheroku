<%-- 
    Document   : hime
    Created on : Jul 4, 2019, 12:11:49 PM
    Author     : burakzengin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Bookingpetz.com</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="Bookingpetz Company">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="stylesheet" type="text/css" href="static/styles/bootstrap-4.1.2/bootstrap.min.css">
        <link href="static/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" href="static/plugins/OwlCarousel2-2.3.4/owl.carousel.css">
        <link rel="stylesheet" type="text/css" href="static/plugins/OwlCarousel2-2.3.4/owl.theme.default.css">
        <link rel="stylesheet" type="text/css" href="static/plugins/OwlCarousel2-2.3.4/animate.css">
        <link href="static/plugins/jquery-datepicker/jquery-ui.css" rel="stylesheet" type="text/css">
        <link href="static/plugins/colorbox/colorbox.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" href="static/styles/main_styles.css">
        <link rel="stylesheet" type="text/css" href="static/styles/responsive.css">
        <link href="static/aaa/css/mdb.min.css" rel="stylesheet">
        <script src="//ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />

        <script>



            function submitReview() {

                var rev = document.getElementById("write_review").value;
                alert("review submitted");


            }
        </script>
        <script type="text/javascript">
    $(document).ready(function () {
        $("#tbTitle").on("input", function () {
            LimtCharacters(this, 255, 'lblTitleCount');
        });
    });               
</script>


    </head>

    <body>
        <jsp:include page="header.jsp"></jsp:include>

            <!-- Home -->
            <div class="home">
                <div class="owl-carousel owl-theme home_slider">
                    <!-- Slide -->
                    <div class="slide">
                        <div class="background_image" style="background-image:url(static/images/aboutusphoto2.jpg)"></div>
                        <div class="home_container">
                            <div class="container">
                                <div class="row">
                                    <div class="col">
                                        <div class="home_content text-center">
                                            <div class="home_title">Write Review</div>
                                            <div class="booking_form_container">
                                                <div class="row">
                                                    <div>
                                                        <canvas>Insert your hotel image here</canvas>
                                                    </div>
                                                        <div style="margin-top: 20px" class="col-md-12 col-sm-100 col-xs-100  ">
                                                            <div>Rate your experience</div>
                                                        <div id="RadioButtons1" required="required">
                                                            
                                                            <input type="radio" name="rd1" id="rd1" required="required">
                                                            <label for="rd1"> 1</label>
                                                            <input type="radio" name="rd2" id="rd2">
                                                            <label for="rd2"> 2</label>
                                                            <input type="radio" name="rd3" id="rd3">
                                                            <label for="rd3"> 3</label>
                                                            <input type="radio" name="rd4" id="rd4">
                                                            <label for="rd4"> 4</label>
                                                            <input type="radio" name="rd5" id="rd5">
                                                            <label for="rd5"> 5</label>
                                                        </div>
                                                    </div>
                                                    <div style="margin-top: 20px" class="col-md-12 col-sm-100 col-xs-100  "><input type="text"  name="review" id="write_review" class="booking_input " placeholder="Please write how was your pets's experience here" >
                                                        <!--                                                            <div><input type="text" name="checkin" class="datepicker booking_input booking_input_a booking_in" placeholder="Check in" required="required"></div>
                                                                                                                    <div><input type="text" name="checkout" class="datepicker booking_input booking_input_a booking_out" placeholder="Check out" required="required"></div>-->
                                                        <div style="margin-top: 10px" class="col-md-2 col-sm-12 col-xs-12 ">


                                                        </div>
                                                    
                                                        <div  align = “center” class="col-md-12 col-sm-12 col-xs-12">
                                                            <button type="button" onclick="submitReview()" class="booking_button trans_200">Submit Review</button>
                                                        </div>
                                                    </div>
                                                    
                                                    <div style="text-align:center;">
                                                    <form id="submitReview" action="submitReview" method="GET">
                                                        <input hidden id="review" name="review" value="">
                                                    </form>
                                                    </div>
                                                </div>
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



            <script src="static/js/jquery-3.3.1.min.js"></script>
            <script src="https://kit.fontawesome.com/3135afb4f3.js"></script>
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

            <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
            <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>

    </body>
</html>