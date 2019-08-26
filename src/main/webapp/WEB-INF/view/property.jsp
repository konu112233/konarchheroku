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
        <!--  mdb css  -->
        <link rel="stylesheet" href="static/aaa/css/mdb.min2.css">
    </head>
    <style>

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

        window.onload = function () {
            var addr;
            addr = "Zandpad 3A,1054GA Amsterdam";

            document.getElementById("location").src = "https://www.google.com/maps?q=" + addr + " &output=embed";
        };

        var serviceTotal = 90;


        function selectService(serviceId) {
            var tr = document.getElementById(serviceId);
            var tds = tr.getElementsByTagName("td");
            var servicePrice = tds[1].innerText;

            if (document.getElementById(serviceId + "Btn2").style.display === "none") {
                servicePrice = servicePrice.replace("€", "");
                serviceTotal += parseFloat(servicePrice);

                tds[0].setAttribute("class", "font-weight-bold");
                tds[1].setAttribute("class", "font-weight-bold");
                document.getElementById(serviceId + "Btn2").style.display = "block";
                document.getElementById(serviceId + "Btn").style.display = "none";

            } else {

                servicePrice = servicePrice.replace("€", "");
                serviceTotal -= parseFloat(servicePrice);


                tds[0].setAttribute("class", "");
                tds[1].setAttribute("class", "");
                document.getElementById(serviceId + "Btn2").style.display = "none";
                document.getElementById(serviceId + "Btn").style.display = "block";
            }
            document.getElementById("serviceTotal").innerHTML = "<span>€" + parseFloat(serviceTotal).toFixed(2) + "</span>";


            //  document.getElementById("serviceTotal").innerHTML = "<span>€" + serviceTotal + "</span>";

        }

        window.onload = selectService();

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



        function next() {

            $('#petInfpForm').show();


        }

    </script>
    <body>
        <!-- Page Preloder -->
        <div id="preloder">
            <div class="loader"></div>
        </div>

        <jsp:include page="header.jsp"></jsp:include>
        <jsp:include page="signupModalForBooking.jsp"></jsp:include>
        <jsp:include page="petInfoModal.jsp"></jsp:include>
        <jsp:include page="verifyMail.jsp"></jsp:include>
        <jsp:include page="verifiedmailModal.jsp"></jsp:include>


            <div class="home" >
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
                                            <div class="col-md-12 col-sm-6 col-xs-12">
                                                <div class="x_panel">
                                                    <div class="x_title">
                                                        <h3>Services & Prices</h3>

                                                        <div class="clearfix"></div>
                                                    </div>
                                                    <div class="x_content">

                                                        <table class="table table-responsive-lg table-striped">
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
                                                                    <td><i class="fas fa-euro-sign"</i> <span>
                                                                            45</span></td>
                                                                    <td class="font-weight-bold"><img src="static/searchResult/img/check.png" style="width:15px;" alt=""> <span class="ml-2">Cat Daycare</span></td>
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
                                            <iframe id="location" style="margin-bottom: 28px;" src="https://www.google.com/maps?q=Bernard kochstraat 21B &output=embed" allowfullscreen></iframe>
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
                                                <input type="date" onchange="getDiff();
                                                        minOut()" id="checkout" name="checkout" class="col-5 align-self-end" placeholder="Check out" required="required">
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

                                        <div class="x_content">

                                            <!-- modals -->
                                            <!-- Large modal -->

                                            <div class="modal fade" id="servicesModal" data-keyboard="false" data-backdrop="static" tabindex="-1" role="dialog" aria-hidden="true" style="display: none;">
                                                <div class="modal-dialog ">
                                                    <div class="modal-content">


                                                        <div class="modal-header">
                                                            <h3 class="modal-title w-100 dark-grey-text font-weight-bold my-3" id="myModalLabel" style="margin-left:10px;"><strong>Booking Summary</strong></h3>

                                                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span>
                                                            </button>

                                                        </div>
                                                        <div class="modal-body">
                                                            <div class="row">
                                                                <div class="col-md-12">
                                                                    <div class="x_panel">

                                                                        <div class="x_content">

                                                                            <section class="content invoice">
                                                                                <!-- title row -->
                                                                                <div class="row" style="margin-left: 2px" >
                                                                                    <div class="col-md-4" >
                                                                                        <div class="row" ><h9><small>Check-in Date</small></h9></div>
                                                                                        <div class="row"><h7><strong>Aug 7, 2019</strong></h7></div>
                                                                                    </div>
                                                                                    <div class="col-md-4" >
                                                                                        <div class="" >
                                                                                            <div class="row"> <h9><small>Check-out Date</small></h9></div>
                                                                                            <div class="row"> <h7><strong>Aug 9, 2019</strong></h7></div>
                                                                                        </div>

                                                                                    </div>
                                                                                    <div class="col-md-2" >
                                                                                        <div class="" >
                                                                                            <div class="row"> <h9><small>Day</small></h9></div>
                                                                                            <div class="row" style="padding-left:4px"> <h7><strong>2</strong></h7></div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="col-md-2" >
                                                                                        <div class="" >
                                                                                            <div class="row"> <h9><small>Breed</small></h9></div>
                                                                                            <div class="row"> <h7><strong>Dog</strong></h7></div>
                                                                                        </div>
                                                                                    </div>


                                                                                </div>
                                                                                <br>
                                                                                <div class="row">
                                                                                    <table class="table table-striped jambo_table bulk_action">
                                                                                        <thead>
                                                                                            <tr class="headings">

                                                                                                <th class="column-title" style="display: table-cell;">Service</th>
                                                                                                <th class="column-title" style="display: table-cell;">Fee</th>
                                                                                                <th class="column-title" style="display: table-cell;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
                                                                                                <th class="bulk-actions" colspan="3" style="display: none;">
                                                                                                    <a class="antoo" style="color:#fff; font-weight:500;">Bulk Actions ( <span class="action-cnt">1 Records Selected</span> ) <i class="fa fa-chevron-down"></i></a>
                                                                                                </th>
                                                                                            </tr>
                                                                                        </thead>

                                                                                        <tbody id="tBody">
                                                                                            <tr class="even pointer">

                                                                                                <td class="font-weight-bold"><strong>Boarding</strong></td>
                                                                                                <td  class="a-right a-right font-weight-bold ">€90</td>
                                                                                                <td class="font-weight-bold" >(45 x 2 nights)</td>
                                                                                            </tr>
                                                                                            <tr id="serviceWashing" class="even pointer">

                                                                                                <td  >Washing</td>
                                                                                                <td class="a-right a-right">€10.45</td>
                                                                                                <td >
                                                                                                    <div id="serviceWashingBtn" >
                                                                                                        <a  onclick="selectService(this.parentNode.parentNode.parentNode.id)"  class="blue-gradient  btn-sm">
                                                                                                            <i class="fa fa-plus text-white"></i>
                                                                                                        </a>

                                                                                                    </div>
                                                                                                    <div id="serviceWashingBtn2" style="display:none;">
                                                                                                        <a  onclick="selectService(this.parentNode.parentNode.parentNode.id)" class="btn-danger btn-sm" style="color:#fff;"><i class="fas fa-minus"></i></a>
                                                                                                    </div>
                                                                                                </td>

                                                                                            </tr>

                                                                                            <tr id="serviceMedication" class="even pointer">

                                                                                                <td  >Medication</td>
                                                                                                <td class="a-right a-right">€10.45</td>
                                                                                                <td >
                                                                                                    <div id="serviceMedicationBtn" >
                                                                                                        <a  onclick="selectService(this.parentNode.parentNode.parentNode.id)"  class="blue-gradient  btn-sm">
                                                                                                            <i class="fa fa-plus text-white"></i>
                                                                                                        </a>
                                                                                                    </div>
                                                                                                    <div id="serviceMedicationBtn2" style="display:none;">
                                                                                                        <a  onclick="selectService(this.parentNode.parentNode.parentNode.id)" class="btn-danger btn-sm" style="color:#fff;"><i class="fas fa-minus"></i></a>
                                                                                                    </div>
                                                                                                </td>

                                                                                            </tr>
                                                                                            <tr id="serviceNail" class="even pointer">

                                                                                                <td  >Nail Clipping</td>
                                                                                                <td class="a-right a-right">€10.45</td>
                                                                                                <td >
                                                                                                    <div id="serviceNailBtn" >
                                                                                                        <a  onclick="selectService(this.parentNode.parentNode.parentNode.id)"  class="blue-gradient  btn-sm">
                                                                                                            <i class="fa fa-plus text-white"></i>
                                                                                                        </a>
                                                                                                    </div>
                                                                                                    <div id="serviceNailBtn2" style="display:none;">
                                                                                                        <a  onclick="selectService(this.parentNode.parentNode.parentNode.id)" class="btn-danger btn-sm" style="color:#fff;"><i class="fas fa-minus"></i></a>
                                                                                                    </div>
                                                                                                </td>

                                                                                            </tr>
                                                                                            <tr id="serviceGroomming" class="even pointer">

                                                                                                <td  >Grooming & Trimming</td>
                                                                                                <td class="a-right a-right">€10.45</td>
                                                                                                <td >
                                                                                                    <div id="serviceGroommingBtn" >
                                                                                                        <a  onclick="selectService(this.parentNode.parentNode.parentNode.id)"  class="blue-gradient  btn-sm">
                                                                                                            <i class="fa fa-plus text-white"></i>
                                                                                                        </a>
                                                                                                    </div>
                                                                                                    <div id="serviceGroommingBtn2" style="display:none;">
                                                                                                        <a  onclick="selectService(this.parentNode.parentNode.parentNode.id)" class="btn-danger btn-sm" style="color:#fff;"><i class="fas fa-minus"></i></a>
                                                                                                    </div>
                                                                                                </td>

                                                                                            </tr>


                                                                                            <tr class="even pointer">

                                                                                                <td class="font-weight-bold">Total</td>
                                                                                                <td  id="serviceTotal" class="a-right a-right font-weight-bold">€90</td>
                                                                                                <td class=""></td>

                                                                                            </tr>


                                                                                        </tbody>
                                                                                    </table>
                                                                                    <div class="row">

                                                                                    </div>
                                                                                </div>



                                                                                <div class="row">

                                                                                </div>
                                                                                <!-- /.row -->


                                                                            </section>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="modal-footer">

                                                            <button type="button" class="btn  blue-gradient">Pay</button>

                                                        </div>

                                                    </div>
                                                </div>
                                            </div>


                                        </div>
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

        <!-- mdb script -->
        <script type="text/javascript" src="static/aaa/js/mdb.min2.js"></script>

    </body>
</html>
