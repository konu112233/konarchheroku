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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />

        <script>
            function activatePlaceSearch() {
                var input = document.getElementById("search_term");
                var autocomplete = new google.maps.places.Autocomplete(input);
            }
            $(document).ready(function () {
                // alert(${login});
            <c:choose>
                <c:when test="${result.equals('success')}">
                $('#signupEmail').modal('show');
                </c:when>
                <c:when test="${verify.equals('success')}">
                $('#signupVerifymail').modal('show');
                </c:when>
                <c:when test="${verify.equals('failed')}">
                $('#signupVerifymailFailed').modal('show');
                </c:when>
                <c:when test="${resultPassword.equals('success')}">
                $('#resetPasswordSendMailOK').modal('show');
                </c:when>
                <c:when test="${resultPassword.equals('failed')}">
                $('#resetPasswordSendMailFailed').modal('show');
                </c:when>
                <c:when test="${resultPassword.equals('done')}">
                $('#resetPasswordSuccess').modal('show');
                </c:when>
            </c:choose>
            });
            $(function () {
                var today = new Date();
                var dd = String(today.getDate()).padStart(2, '0');
                var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
                var yyyy = today.getFullYear();

                today = mm + '/' + dd + '/' + yyyy;
                $('input[name="daterange"]').daterangepicker({
                    startDate: moment().startOf('day'),
                    endDate: moment().startOf('day').add(1, 'day'),
                    opens: 'center',
                    "minDate": today

                }, function (start, end, label) {
                    console.log("A new date selection was made: " + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD'));
                });
            });
            var timeMax;
            var timeMin;
            var timeZone;
            var petType;
            var loc;
            var time;

            function search() {
                time = document.getElementById("dates").value;
                loc = document.getElementById("search_term").value;
                console.log(loc);
                petType = document.getElementById("petType").value;
//               
                time = time.split("-");
                var search = {
                    "timeMin": time[0].trim(),
                    "timeMax": time[1].trim(),
                    "timeZone": "Europe/Amsterdam",
                    "petType": petType,
                    "location": loc
                };
                console.log(JSON.stringify(search));
                $('#result').val(JSON.stringify(search));
                $("#searchResult").submit();

            }
        </script>
    </head>

    <body>
        <jsp:include page="header.jsp"></jsp:include>

            <!-- Home -->
            <div class="home">
                <div class="owl-carousel owl-theme home_slider">
                    <!-- Slide -->
                    <div class="slide">
                        <div class="background_image" style="background-image:url(static/images/friends.jpg)"></div>
                        <div class="home_container">
                            <div class="container">
                                <div class="row">
                                    <div class="col">
                                        <div class="home_content text-center">
                                            <div class="home_title">Find Fantastic Hotels For Your Pets</div>
                                            <div class="booking_form_container">
                                                <div class="row">
                                                    <div style="margin-top: 10px" class="col-md-4 col-sm-12 col-xs-12  "><input type="text"  name="location" id="search_term" class="booking_input " placeholder="Where ?" required="required"></div>
                                                    <div style="margin-top: 10px" class="col-md-4 col-sm-12 col-xs-12"><input type="text" id="dates" name="daterange" class="booking_input  " placeholder="Check-in - Check-out" /></div>
                                                    <!--                                                            <div><input type="text" name="checkin" class="datepicker booking_input booking_input_a booking_in" placeholder="Check in" required="required"></div>
                                                                                                                <div><input type="text" name="checkout" class="datepicker booking_input booking_input_a booking_out" placeholder="Check out" required="required"></div>-->
                                                    <div style="margin-top: 10px" class="col-md-2 col-sm-12 col-xs-12 ">
                                                        <select class="booking_input booking_input_c form-control" id="petType" name="petType" style="height: 54px;" required="required">
                                                            <option value="Dog">Dog</option>
                                                            <option value="Cat">Cat</option>
                                                        </select>
                                                    </div>
                                                    <div style="margin-top: 10px" class="col-md-2 col-sm-12 col-xs-12">
                                                        <button type="button" onclick="search()" class="booking_button trans_200">Find Now</button>
                                                    </div>
                                                </div>
                                                <form id="searchResult" action="searchResult" method="GET">
                                                    <input hidden id="result" name="result" value="">
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

            <!-- Features -->

            <div class="features">
                <div class="container">
                    <div class="text-center" style="margin-bottom: 45px;"><h2>How Does It Work?</h2></div>
                    <div class="row">
                        <!-- Icon Box -->
                        <div class="col-lg-4 icon_box_col">
                            <div class="icon_box d-flex flex-column align-items-center justify-content-start text-center">
                                <div class="icon_box_icon"><img src="static/images/find.svg" class="svg" alt="https://www.flaticon.com/authors/monkik"></div>
                                <div class="icon_box_title"><h2>Find</h2></div>
                                <div class="icon_box_text">
                                    <p>Browse loving, trusted dog sitters near you.</p>
                                </div>
                            </div>
                        </div>

                        <!-- Icon Box -->
                        <div class="col-lg-4 icon_box_col">
                            <div class="icon_box d-flex flex-column align-items-center justify-content-start text-center">
                                <div class="icon_box_icon"><img src="static/images/calendar.svg" class="svg" alt="https://www.flaticon.com/authors/monkik"></div>
                                <div class="icon_box_title"><h2>Book</h2></div>
                                <div class="icon_box_text">
                                    <p>Check their availability, arrange a meet and greet then book and pay online.</p>
                                </div>
                            </div>
                        </div>

                        <!-- Icon Box -->
                        <div class="col-lg-4 icon_box_col">
                            <div class="icon_box d-flex flex-column align-items-center justify-content-start text-center">
                                <div class="icon_box_icon"><img src="static/images/icon_3.svg" class="svg" alt="https://www.flaticon.com/authors/monkik"></div>
                                <div class="icon_box_title"><h2>Relax</h2></div>
                                <div class="icon_box_text">
                                    <p>Your pet enjoys a stay and relax</p>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

            <!-- Gallery -->

            <div class="gallery">
                <div class="gallery_slider_container">
                    <div class="owl-carousel owl-theme gallery_slider">

                        <!-- Slide -->
                        <div class="gallery_item">
                            <div class="background_image" style="background-image:url(static/images/animal1.jpg)"></div>
                            <a class="colorbox" href="static/images/animal1.jpg"></a>
                        </div>

                        <!-- Slide -->
                        <div class="gallery_item">
                            <div class="background_image" style="background-image:url(static/images/animal2.jpg)"></div>
                            <a class="colorbox" href="static/images/animal2.jpg"></a>
                        </div>

                        <!-- Slide -->
                        <div class="gallery_item">
                            <div class="background_image" style="background-image:url(static/images/animal3.jpg)"></div>
                            <a class="colorbox" href="static/images/animal3.jpg"></a>
                        </div>

                        <!-- Slide -->
                        <div class="gallery_item">
                            <div class="background_image" style="background-image:url(static/images/animal4.jpg)"></div>
                            <a class="colorbox" href="static/images/animal4.jpg"></a>
                        </div>

                    </div>
                </div>
            </div>

            <!-- About -->

            <div class="about">
                <div class="container">
                    <div class="row">

                        <!-- About Content -->
                        <div class="col-lg-6">
                            <div class="about_content">
                                <div class="about_title"><h2>The Bookingpetz</h2></div>
                                <div class="about_text">
                                    <p>Our aim is to give the best experience to pet owners by offering them a user-friendly platform which allows to find the most suitable services based on location, facilities and customer rating for their dogs and cats.</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-2">

                        </div>
                        <!-- About Images -->
                        <div class="col-lg-4">
                            <div class="about_images d-flex flex-row align-items-center justify-content-between flex-wrap">
                                <img src="static/images/storeicon.png" alt="">
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Testimonials -->

            <!--<div class="testimonials">
                <div class="parallax_background parallax-window" data-parallax="scroll" data-image-src="static/images/animal6.jpg" data-speed="0.8"></div>
                <div class="testimonials_overlay"></div>
                <div class="container">
                    <div class="row">
                        <div class="col">
                            <div class="testimonials_slider_container">

            <!-- Testimonials Slider -->
            <!-- <div class="owl-carousel owl-theme test_slider">

            <!-- Slide -->
            <!--<div  class="test_slider_item text-center">
                <div class="rating rating_5 d-flex flex-row align-items-start justify-content-center"><i></i><i></i><i></i><i></i><i></i></div>
                <div class="testimonial_title"><a href="#">Perfect Stay</a></div>
                <div class="testimonial_text">
                    <p>Etiam nec odio vestibulum est mattis effic iturut magna. Pellentesque sit amet tellus blandit. Etiam nec odio vestibulum est mattis effic.</p>
                </div>
                <div class="testimonial_image"><img src="static/images/user_1.jpg" alt=""></div>
                <div class="testimonial_author"><a href="#">Samantha Smith</a>, Greece</div>
            </div>

            <!-- Slide -->
            <!--<div  class="test_slider_item text-center">
                <div class="rating rating_5 d-flex flex-row align-items-start justify-content-center"><i></i><i></i><i></i><i></i><i></i></div>
                <div class="testimonial_title"><a href="#">Nice place</a></div>
                <div class="testimonial_text">
                    <p>Etiam nec odio vestibulum est mattis effic iturut magna. Pellentesque sit amet tellus blandit. Etiam nec odio vestibulum est mattis effic.</p>
                </div>
                <div class="testimonial_image"><img src="static/images/user_2.jpg" alt=""></div>
                <div class="testimonial_author"><a href="#">Michael Doe</a>, Italy</div>
            </div>

            <!-- Slide -->
            <!--<div  class="test_slider_item text-center">
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

            <!-- Booking -->

            <!-- <div class="booking">
                 <div class="container">
                     <div class="row">
                         <div class="col">
                             <div class="booking_title text-center"><h2>Book Pet Hotel</h2></div>
                             <div class="booking_text text-center">
                                 <p>Choose your ultimate Pet Hotel</p>
                             </div>
 
            <!-- Booking Slider -->
            <!-- <div class="booking_slider_container">
                 <div class="owl-carousel owl-theme booking_slider">

            <!-- Slide -->
            <!--<div class="booking_item">
                <div class="background_image" style="background-image:url(static/images/hotel1.jpg)"></div>
                <div class="booking_overlay trans_200"></div>
                <div class="booking_price">$120/Night</div>
                <div class="booking_link"><a href="#">Book Now</a></div>
            </div>

            <!-- Slide -->
            <!--   <div class="booking_item">
                   <div class="background_image" style="background-image:url(static/images/hotel2.jpg)"></div>
                   <div class="booking_overlay trans_200"></div>
                   <div class="booking_price">$120/Night</div>
                   <div class="booking_link"><a href="#">Book Now</a></div>
               </div>

            <!-- Slide -->
            <!--<div class="booking_item">
                <div class="background_image" style="background-image:url(static/images/hotel3.png)"></div>
                <div class="booking_overlay trans_200"></div>
                <div class="booking_price">$120/Night</div>
                <div class="booking_link"><a href="#">Book Now</a></div>
            </div>

        </div>
    </div>
</div>
</div>
</div>
</div>

            <!-- Blog -->

            <div class="blog">

                <!-- Blog Slider -->
                <!--<div class="blog_slider_container">
                    <div class="owl-carousel owl-theme blog_slider">

                <!-- Slide -->
                <!--<div class="blog_slide">
                    <div class="background_image" style="background-image:url(static/images/animal7.jpg)"></div>
                    <div class="blog_content">
                        <div class="blog_date"><a href="#">May 16, 2019</a></div>
                        <div class="blog_title"><a href="#">The ultimate guide of pet-friendly places in Amsterdam</a></div>
                    </div>
                </div>

                <!-- Slide -->
                <!--<div class="blog_slide">
                    <div class="background_image" style="background-image:url(static/images/animal8.jpg)"></div>
                    <div class="blog_content">
                        <div class="blog_date"><a href="#">May 17, 2019</a></div>
                        <div class="blog_title"><a href="#">Dog's emotional life</a></div>
                    </div>
                </div>

                <!-- Slide -->
                <!--<div class="blog_slide">
                    <div class="background_image" style="background-image:url(static/images/animal9.jpg)"></div>
                    <div class="blog_content">
                        <div class="blog_date"><a href="#">May 17, 2019</a></div>
                        <div class="blog_title"><a href="#">Mental health benefits of owning a pet</a></div>
                    </div>
                </div>

                <!-- Slide -->
                <!--<div class="blog_slide">
                    <div class="background_image" style="background-image:url(static/images/animal10.jpg)"></div>
                    <div class="blog_content">
                        <div class="blog_date"><a href="#">May 17, 2019</a></div>
                        <div class="blog_title"><a href="#">Best pet tech trends in 2019</a></div>
                    </div>
                </div>

            </div>
        </div>
    </div>

                <!-- Footer -->
            <jsp:include page="footer.jsp"></jsp:include>


            <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCRtVM7tqQzSYlpZbNQMApgii7DU5IhMSc&libraries=places&callback=activatePlaceSearch"></script>
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