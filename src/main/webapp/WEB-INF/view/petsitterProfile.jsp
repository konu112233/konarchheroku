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
        <link rel="stylesheet" type="text/css" href="static/styles/main_styles.css">
        <link href="static/aaa/css/mdb.min.css" rel="stylesheet">

    </head>

    <style>
        .pictures {
            margin-bottom: 28px;
        }

        .property-img {
            margin-top: 17px;
        }

        .addFav {
            display: inline-block;
            position: absolute;
            top: 8px;
            right: 15px;
        }

        .addFav i {
            color: #8f8fa8;
            display: inline-block;
        }

        .availab {
            margin-bottom: 28px;
        }

        .pets {
            margin-bottom: 28px;
            margin-top: 28px;
        }

        .availab h4, .pets h4 {
            color: #30304e;
            font-size: 18px;
            font-weight: 500;
            margin-bottom: 18px;
        }

        .availab img {
            margin-bottom: 18px;
        }

        .availab p, .pets p {
            color: #6f6f8a;
            font-size: 14px;
            font-weight: 300;
            margin: 0;
        }

        .petImage {
            width: 106px;
            height: 106px;
            border-radius: 5%;
            overflow: hidden;
            margin-left: auto;
            margin-right: auto;
            margin-top: 12px;
        }

        .contact-service .stars p {
            color: #8f8fa8;
            font-size: 16px;
            margin-bottom: -7px;
        }

        .contact-service .stars span {
            color: #30304e;
            font-size: 24px;
            font-weight: 500;
        }

        .contact-service .room-price p {
            color: #8f8fa8;
            font-size: 16px;
            margin-bottom: -7px;
        }

        .contact-service .room-price span {
            color: #30304e;
            font-size: 24px;
            font-weight: 500;
        }

        .contact-service row {
            margin-bottom: 15px;
        }

        #checkin, #checkout {
            border: none;
            border-bottom: 1px solid green;
            text-align: center;
        }

        select {
            width: 100%;
            height: 95%;
            padding: 16px 20px;
            border: 1px solid green;
            border-radius: 4px;
        }

        input[type=date]::-webkit-inner-spin-button,
        input[type=date]::-webkit-outer-spin-button {
            -webkit-appearance: none;
        }

        .input-container input {
            border: none;
            box-sizing: border-box;
            outline: 0;
            padding: .75rem;
            position: relative;
            width: 100%;
        }
        input[type="date"]::-webkit-calendar-picker-indicator {
            background: transparent;
            bottom: 0;
            color: transparent;
            cursor: pointer;
            height: auto;
            left: 0;
            position: absolute;
            right: 0;
            top: 0;
            width: auto;
        }

    </style>
    <script>

        function getDiff() {
            var checkin = document.getElementById("checkin").value;
            var checkinDate = new Date(checkin);
            var checkout = document.getElementById("checkout").value;
            var checkoutDate = new Date(checkout);
            var roomPrice = 45;
            var roomNights = document.getElementById("roomNights");
            var fee = 5;
            var total = document.getElementById("total");

            if (checkin !== null && checkin !== '' && checkout !== null && checkout !== '') {

                var timeDiff = parseInt(checkoutDate.getTime() - checkinDate.getTime());
                var daysDiff = parseInt(timeDiff / (1000 * 3600 * 24));
                var roomNightsPrice = parseInt(daysDiff * roomPrice);
                var totalPrice = parseInt(roomNightsPrice + fee);

                roomNights.innerHTML = daysDiff + " nights : " + "<span>$" + roomNightsPrice + "</span>";
                total.innerHTML = totalPrice;
            }
        }

        function minOut() {
            var checkin = document.getElementById("checkin").value;
            var checkout = document.getElementById("checkout");

            checkout.min = checkin;

        }
    </script>

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
                                    <div class="home_title" style="margin-bottom: 30px;">Pet Sitter</div>
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
                                <h3>John Walter</h3>
                                <a href="#"><i class="fa flaticon-placeholder"></i> De Pijp, Amsterdam</a>
                            </div>
                            <div class="property-price">
                                <p>Minimum Price</p>
                                <span>€20</span>
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
                                <!--<div class="row details-top">
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
                                </div>-->
                                <div class="row pictures">
                                    <div class="col-lg-12">
                                        <div class="property-img owl-carousel">
                                            <div class="single-img">
                                                <img src="static/searchResult/img/rooms/1.jpg" alt="">
                                            </div>
                                            <div class="single-img">
                                                <img src="static/images/animal3.jpg" alt="">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="property-description">
                                            <h4>About John Walter</h4>
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
                                            <h4>Services</h4>
                                            <div class="property-table">
                                                <table>
                                                    <tr>
                                                        <td><img src="static/searchResult/img/check.png" alt=""> Dog Sitting</td>
                                                        <td><img src="static/searchResult/img/check.png" alt=""> Dog 1 Home Visit Per Day</td>
                                                        <td><img src="static/searchResult/img/check.png" alt=""> Dog Daily Walking</td>
                                                    </tr>
                                                    <tr>
                                                        <td style="opacity: 0.5;"><img src="static/searchResult/img/close.png" alt=""> Cat Sitting</td>
                                                        <td><img src="static/searchResult/img/check.png" alt=""> Cat 1 Home Visit Per Day</td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </div>
                                        <div class="location-map">
                                            <h4>Location</h4>
                                            <iframe style="margin-bottom: 28px;" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d107002.020096289!2d-96.80666618302782!3d33.06138629992991!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x864c21da13c59513%3A0x62aa036489cd602b!2sPlano%2C+TX%2C+USA!5e0!3m2!1sen!2sbd!4v1558246953339!5m2!1sen!2sbd" allowfullscreen></iframe>
                                        </div>
                                        <div class="availab">
                                            <h4>Availability</h4>
                                            <div class="row">
                                                <div class="col-lg-3">
                                                    <p>Response Rate : </p><span>98%</span>
                                                </div>
                                                <div class="col-lg-4">
                                                    <p>Average Response Time</p><span>Less than an hour</span>
                                                </div>
                                                <div class="col-lg-4">
                                                    <p>Last Activity : </p><span>Today, 10:37 AM</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="property-reviews">
                                            <h4>Reviews</h4>
                                            <div class="container">
                                                <div class="row show-hide-reviews">
                                                    <div class="col">
                                                        <div class="testimonials_slider_container">
                                                            <div class="owl-carousel owl-theme test_slider_vertical">
                                                                <div  class="test_slider_item text-center">
                                                                    <div class="rating rating_5 d-flex flex-row align-items-start justify-content-center"><i></i><i></i><i></i><i></i><i></i></div>
                                                                    <div class="testimonial_title"><a href="#">Perfect Stay</a></div>
                                                                    <div class="testimonial_text">
                                                                        <p>Etiam nec odio vestibulum est mattis effic iturut magna. Pellentesque sit amet tellus blandit. Etiam nec odio vestibulum est mattis effic.</p>
                                                                    </div>
                                                                    <div class="testimonial_image"><img src="static/images/user_1.jpg" alt=""></div>
                                                                    <div class="testimonial_author"><a href="#">Samantha Smith</a>, Greece</div>
                                                                </div>
                                                                <div  class="test_slider_item text-center">
                                                                    <div class="rating rating_5 d-flex flex-row align-items-start justify-content-center"><i></i><i></i><i></i><i></i><i></i></div>
                                                                    <div class="testimonial_title"><a href="#">Nice place</a></div>
                                                                    <div class="testimonial_text">
                                                                        <p>Etiam nec odio vestibulum est mattis effic iturut magna. Pellentesque sit amet tellus blandit. Etiam nec odio vestibulum est mattis effic.</p>
                                                                    </div>
                                                                    <div class="testimonial_image"><img src="static/images/user_2.jpg" alt=""></div>
                                                                    <div class="testimonial_author"><a href="#">Michael Doe</a>, Italy</div>
                                                                </div>
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
                                                <div class="row">
                                                    <div class="col">
                                                        <p id="more-reviews-button" onclick="$('.show-hide-reviews').toggle();
                                                                $('#more-reviews-button').toggle();
                                                                $('#less-reviews-button').toggle();">Show more reviews</p>

                                                        <div class="show-hide-reviews" id="all-reviews">
                                                            <div  class="text-center">
                                                                <div class="rating rating_5 d-flex flex-row align-items-start justify-content-center"><i></i><i></i><i></i><i></i><i></i></div>
                                                                <div class="testimonial_title"><a href="#">Perfect Stay</a></div>
                                                                <div class="testimonial_text">
                                                                    <p>Etiam nec odio vestibulum est mattis effic iturut magna. Pellentesque sit amet tellus blandit. Etiam nec odio vestibulum est mattis effic.</p>
                                                                </div>
                                                                <div class="testimonial_image"><img src="static/images/user_1.jpg" alt=""></div>
                                                                <div class="testimonial_author"><a href="#">Samantha Smith</a>, Greece</div>
                                                            </div>
                                                            <hr>
                                                            <div  class="text-center">
                                                                <div class="rating rating_5 d-flex flex-row align-items-start justify-content-center"><i></i><i></i><i></i><i></i><i></i></div>
                                                                <div class="testimonial_title"><a href="#">Nice place</a></div>
                                                                <div class="testimonial_text">
                                                                    <p>Etiam nec odio vestibulum est mattis effic iturut magna. Pellentesque sit amet tellus blandit. Etiam nec odio vestibulum est mattis effic.</p>
                                                                </div>
                                                                <div class="testimonial_image"><img src="static/images/user_2.jpg" alt=""></div>
                                                                <div class="testimonial_author"><a href="#">Michael Doe</a>, Italy</div>
                                                            </div>
                                                            <hr>
                                                            <div  class="text-center">
                                                                <div class="rating rating_5 d-flex flex-row align-items-start justify-content-center"><i></i><i></i><i></i><i></i><i></i></div>
                                                                <div class="testimonial_title"><a href="#">We loved it</a></div>
                                                                <div class="testimonial_text">
                                                                    <p>Etiam nec odio vestibulum est mattis effic iturut magna. Pellentesque sit amet tellus blandit. Etiam nec odio vestibulum est mattis effic.</p>
                                                                </div>
                                                                <div class="testimonial_image"><img src="static/images/user_3.jpg" alt=""></div>
                                                                <div class="testimonial_author"><a href="#">Luis Garcia</a>, Spain</div>
                                                            </div>
                                                            <hr>
                                                            <div  class="text-center">
                                                                <div class="rating rating_5 d-flex flex-row align-items-start justify-content-center"><i></i><i></i><i></i><i></i><i></i></div>
                                                                <div class="testimonial_title"><a href="#">Fantastic</a></div>
                                                                <div class="testimonial_text">
                                                                    <p>Etiam nec odio vestibulum est mattis effic iturut magna. Pellentesque sit amet tellus blandit. Etiam nec odio vestibulum est mattis effic.</p>
                                                                </div>
                                                                <div class="testimonial_image"><img src="static/images/user_2.jpg" alt=""></div>
                                                                <div class="testimonial_author"><a href="#">Michael J. Doe</a>, Italy</div>
                                                            </div>
                                                        </div>
                                                        <br>
                                                        <p id="less-reviews-button" onclick="$('.show-hide-reviews').toggle();
                                                                $('#more-reviews-button').toggle();
                                                                $('#less-reviews-button').toggle();">Show less reviews</p>
                                                    </div>
                                                </div>
                                            </div>
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
                                        <a href="#" class="addFav">
                                            <i class="flaticon-heart"></i>
                                        </a>
                                        <p>Listed by</p>
                                        <h5>John Walter</h5>
                                        <table>
                                            <tr>
                                                <td>Office : <span>1-139-954-3228</span></td>
                                            </tr>
                                            <tr>
                                                <td>Mobile : <span>1-517-328-7751</span></td>
                                            </tr>
                                            <tr>
                                                <td>WhatsApp : <span>1-812-117-2663</span></td>
                                            </tr>
                                            <tr>
                                                <td>Email : <span>oliver@homes.com</span></td>
                                            </tr>
                                        </table>
                                        <div class="row">
                                            <div class="col align-self-start room-price">
                                                <p>Per Day</p>
                                                <span>$<span id="roomPrice">45</span></span>
                                            </div>
                                            <div class="col align-self-end stars">
                                                <p>Rate</p>
                                                <span>5/5</span>
                                            </div>
                                        </div>
                                        <div>
                                            <p>Dates</p>
                                            <div class="row">
                                                <span class="col-6">Check in</span>
                                                <input type="date" onchange="getDiff()" id="checkin" name="checkin" class="col-5 align-self-end" placeholder="Check in" required="required">
                                            </div>
                                            <br>
                                            <div class="row">
                                                <span class="col-6">Check out</span>
                                                <input type="date" onchange="getDiff();minOut()" id="checkout" name="checkout" class="col-5 align-self-end" placeholder="Check out" required="required">
                                            </div>
                                            <br>
                                        </div>
                                        <div>
                                            <p>Pet</p>
                                            <div class="row justify-content-md-center">
                                                <form class="col-md-auto">
                                                    <select id="bookPet" name="bookPet">
                                                        <option value="pet1">Pet 1</option>
                                                        <option value="pet2">Pet 2</option>
                                                        <option value="pet3">Pet 3</option>
                                                    </select>
                                                </form>
                                            </div>
                                            <br>
                                        </div>
                                        <div>
                                            <table>
                                                <tr>
                                                    <td id="roomNights">1 night : <span>$<span id="priceNights">45</span></span></td>
                                                </tr>
                                                <tr>
                                                    <td>Service fee : <span>$<span id="fee">5</span></span></td>
                                                </tr>
                                                <tr>
                                                    <td>Total without services : <span>$<span id="total">45</span></span></td>
                                                </tr>
                                            </table>
                                        </div>
                                        <a href="#" class="site-btn list-btn">Book now</a>


                                    </div>

                                </div>

                            </div>
                            <div class="row pb-30">
                                <div class="col-lg-12">
                                    <div class="contact-service">


                                        <div class="pets">
                                            <div >
                                                <h4 ><strong>John Walter's Pets</strong></h4>
                                                <hr>
                                            </div>

                                            <div>
                                                <h5>Rocky</h5>
                                                <img class="petImage" src="static/images/animal7.jpg"><br>
                                                <span><strong>Breed : </strong>Dogo Argentino</span><br>
                                                <span><strong>Size (Kg) :</strong> 40+ kg</span><br>
                                                <span><strong>Gender :</strong> Male</span><br>
                                                <span><strong>Age : </strong>2 years</span><br>
                                                <span><strong>Vaccinated : </strong>yes</span>

                                            </div>
                                            <br>
                                            
                                            <div>
                                                <h5>Rocky</h5>
                                                <img class="petImage" src="static/images/animal7.jpg"><br>
                                                <span><strong>Breed : </strong>Dogo Argentino</span><br>
                                                <span><strong>Size (Kg) :</strong> 40+ kg</span><br>
                                                <span><strong>Gender :</strong> Male</span><br>
                                                <span><strong>Age : </strong>2 years</span><br>
                                                <span><strong>Vaccinated : </strong>yes</span>

                                            </div>
                                            <br>
                                            
                                            <div>
                                                <h5>Rocky</h5>
                                                <img class="petImage" src="static/images/animal7.jpg"><br>
                                                <span><strong>Breed : </strong>Dogo Argentino</span><br>
                                                <span><strong>Size (Kg) :</strong> 40+ kg</span><br>
                                                <span><strong>Gender :</strong> Male</span><br>
                                                <span><strong>Age : </strong>2 years</span><br>
                                                <span><strong>Vaccinated : </strong>yes</span>

                                            </div>
                                            <br>

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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.14.1/moment.min.js"></script>


    </body>
</html>
