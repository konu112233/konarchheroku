<%-- 
    Document   : myHotel
    Created on : Jul 28, 2019, 12:05:03 PM
    Author     : OMER
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

    <script>


        window.onload = () => {
            const images = JSON.parse(localStorage.getItem('images'));
            const hotel_info = JSON.parse(localStorage.getItem('hotel_info'));
            document.querySelector('#propertyName').textContent = hotel_info.propertyName;
            document.querySelector('#contactName').textContent = hotel_info.contactName;
            document.querySelector('#managerEmail').textContent = hotel_info.managerEmail;
            document.querySelector('#bookingEmail').textContent = hotel_info.bookingEmail;
            document.querySelector('#website').textContent = hotel_info.website;

            document.querySelector('#phone').textContent = hotel_info.phone;
            document.querySelector('#wPhone').textContent = hotel_info.phone;

            document.querySelector('#description').textContent = hotel_info.description;
            document.querySelector('#directions').textContent = hotel_info.directions;

        }
    </script>


    <body>
        <!-- Page Preloder -->
        <div id="preloder">
            <div class="loader"></div>
        </div>

        <!-- Single Property Section Begin -->
        <div class="single-property">
            <div class="container">
                <div class="row spad-p">
                    <div class="col-lg-12">
                        <div class="property-title">
                            <h3  id="propertyName">Country Style House with beautiful garden and terrace</h3>
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
                        <div class="property-img owl-carousel" id="imageSlider">
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
                                            <!--<div class="baths">
                                                <p>Bath</p>
                                                <img src="static/searchResult/img/bath.svg" alt="">
                                                <span>2</span>
                                            </div>
                                            <div class="garage">
                                                <p>Garden</p>
                                                <img src="static/searchResult/img/hencee.svg" alt="">
                                                <span>1</span>
                                            </div>-->
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="property-description">
                                        <h3>Description</h3>
                                        <p id="description"></p>
                                    </div>
                                    <div class="property-features">
                                        <div class="col-md-12 col-sm-6 col-xs-12">
                                            <div class="x_panel">
                                                <div class="x_title">
                                                    <h3>Services & Prices</h3>

                                                    <div class="clearfix"></div>
                                                </div>
                                                <div class="x_content">

                                                    <table class="table table-responsive table-striped">
                                                        <thead>
                                                            <tr>

                                                                <th><i class="fas fa-dog fa-2x"></i></th>
                                                                <th>Price</th>
                                                                <th><i class="fas fa-cat fa-2x"></i></th>
                                                                <th>Price</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <tr>

                                                                <td class="font-weight-bold"><img src="static/searchResult/img/check.png" style="width:15px;" alt=""> <span class="ml-2">Dog Boarding</span></td>
                                                                <td><i class="fas fa-euro-sign"</i> <span>45</span></td>
                                                                <td class="font-weight-bold"><img src="static/searchResult/img/check.png" style="width:15px;" alt=""> <span class="ml-2">Cat Boarding</span></td>
                                                                <td><i class="fas fa-euro-sign"</i> <span>45</span></td>


                                                            </tr>
                                                            <tr>

                                                                <td class="font-weight-bold"><img src="static/searchResult/img/check.png" style="width:15px;" alt=""> <span class="ml-2">Dog Daycare</span></td>
                                                                <td><i class="fas fa-euro-sign"</i> <span>45</span></td>
                                                                <td class="font-weight-bold"><img src="static/searchResult/img/check.png" style="width:15px;" alt=""> <span class="ml-2">Cat Daycare</span></td>
                                                                <td><i class="fas fa-euro-sign"</i> <span>45</span></td>

                                                            </tr>
                                                            <tr>

                                                                <td class="font-weight-bold"><img src="static/searchResult/img/check.png" style="width:15px;" alt=""> <span class="ml-2">Dog Washing</span></td>
                                                                <td><i class="fas fa-euro-sign"</i> <span>45</span></td>
                                                                <td class="font-weight-bold"><img src="static/searchResult/img/check.png" style="width:15px;" alt=""> <span class="ml-2">Cat Washing</span></td>
                                                                <td><i class="fas fa-euro-sign"</i> <span>45</span></td>

                                                            </tr>

                                                            <tr>

                                                                <td></i> Dog Nail Clipping</td>
                                                                <td></td>
                                                                <td class="font-weight-bold"><img src="static/searchResult/img/check.png" style="width:15px;" alt=""> <span class="ml-2">Cat Nail Clipping</span></td>
                                                                <td><i class="fas fa-euro-sign"</i> <span>45</span></td>

                                                            </tr>
                                                            <tr>

                                                                <td class="font-weight-bold"><img src="static/searchResult/img/check.png" style="width:15px;" alt=""> <span class="ml-2">Dog Grooming & Trimming</span></td>
                                                                <td><i class="fas fa-euro-sign"</i> <span>45</span></td>
                                                                <td>Cat Grooming & Trimming</td>
                                                                <td><i class=""</i> <span></span></td>

                                                            </tr>

                                                            <tr>

                                                                <td class="font-weight-bold"><img src="static/searchResult/img/check.png" style="width:15px;" alt=""> <span class="ml-2">Dog Medication</span></td>
                                                                <td><i class="fas fa-euro-sign"</i> <span>45</span></td>
                                                                <td class="font-weight-bold"><img src="static/searchResult/img/check.png" style="width:15px;" alt=""> <span class="ml-2">Cat Medication</span></td>
                                                                <td><i class="fas fa-euro-sign"</i> <span>45</span></td>

                                                            </tr>
                                                        </tbody>
                                                    </table>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="location-map">
                                        <h4>Location</h4>
                                        <iframe style="margin-bottom: 28px;" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d107002.020096289!2d-96.80666618302782!3d33.06138629992991!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x864c21da13c59513%3A0x62aa036489cd602b!2sPlano%2C+TX%2C+USA!5e0!3m2!1sen!2sbd!4v1558246953339!5m2!1sen!2sbd" allowfullscreen></iframe>
                                    </div>
                                    <div class="property-description">
                                        <h4>Directions</h4>
                                        <p id="directions"></p>
                                    </div>
                                    <br>
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
                                    <p>Listed by</p>
                                    <h5 id="contactName">Oliver G Harris</h5>
                                    <table>

                                        <tr>
                                            <td>Mobile : <span id="phone">1-517-328-7751</span></td>
                                        </tr>
                                        <tr>
                                            <td>WhatsApp : <span id="wPhone">1-812-117-2663</span></td>
                                        </tr>
                                        <tr>
                                            <td>Email : <span id="bookingEmail">oliver@homes.com</span></td>
                                        </tr>
                                        <tr>
                                            <td>Manager Email : <span id="managerEmail">oliver@homes.com</span></td>
                                        </tr>
                                        <tr>
                                            <td>Website : <span id="website">www.pethotel.com</span></td>
                                        </tr>
                                        <tr>
                                            <td>

                                            </td>
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

                                    <!--signupForBookingForm-->
                                    <a href="" class="site-btn list-btn" data-toggle="modal" data-target="#signupForBookingForm">Book Now!</a>


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
                                                <!--<div class="baths">
                                                    <p>Bath</p>
                                                    <img src="static/searchResult/img/bath.svg" alt="">
                                                    <span>2</span>
                                                </div>
                                                <div class="garage">
                                                    <p>Garden</p>
                                                    <img src="static/searchResult/img/hencee.svg" alt="">
                                                    <span>1</span>
                                                </div>-->
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
