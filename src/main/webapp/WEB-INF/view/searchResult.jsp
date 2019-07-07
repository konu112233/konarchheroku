<%-- 
    Document   : result
    Created on : Jul 6, 2019, 6:10:41 PM
    Author     : burakzengin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="description" content="Homes Template">
        <meta name="keywords" content="Homes, unica, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Search Page | Template</title>

        <link href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i" rel="stylesheet">

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

        <script>
            function activatePlaceSearch() {
                var input = document.getElementById("search_term");
                var autocomplete = new google.maps.places.Autocomplete(input);
            }
        </script>
    </head>
    <body>

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
                                    <form action="searchResult" class="booking_form">
                                        <div class="d-flex flex-xl-row flex-column align-items-start justify-content-start">
                                            <div class="booking_input_container d-flex flex-lg-row flex-column align-items-start justify-content-start">
                                                <div><input type="text" id="search_term" class="booking_input booking_input_b" placeholder="Where ?" required="required"></div>
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

            <div class="filter-search search-opt">
                <div class="container ">
                    <div class="row">
                        <div class="col-lg-12">
                            <form class="filter-form">
                                <div class="search-type">
                                    <p>Pet Gender</p>
                                    <select class="filter-property">
                                        <option value="">Male</option>
                                        <option value="">Female</option>
                                    </select>
                                </div>
                                <div class="bedrooms">
                                    <p>Pet Size</p>
                                    <div class="room-filter-pagi">
                                        <div class="bf-item">
                                            <input type="radio" name="room" id="room-1">
                                            <label for="room-1">S</label>
                                        </div>
                                        <div class="bf-item">
                                            <input type="radio" name="room" id="room-2">
                                            <label for="room-2">M</label>
                                        </div>
                                        <div class="bf-item">
                                            <input type="radio" name="room" id="room-3">
                                            <label for="room-3">L</label>
                                        </div>
                                        <div class="bf-item">
                                            <input type="radio" name="room" id="room-4">
                                            <label for="room-4">XL</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="bathrooms">
                                    <p>Pet Age</p>
                                    <div class="room-filter-pagi">
                                        <div class="bf-item">
                                            <input type="radio" name="bathroom" id="bathroom-1">
                                            <label for="bathroom-1">0-1</label>
                                        </div>
                                        <div class="bf-item">
                                            <input type="radio" name="bathroom" id="bathroom-2">
                                            <label for="bathroom-2">1-5</label>
                                        </div>
                                        <div class="bf-item">
                                            <input type="radio" name="bathroom" id="bathroom-3">
                                            <label for="bathroom-3">5-10</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="location">
                                    <p>Garden</p>
                                    <select class="filter-location">
                                        <option value="">Yes</option>
                                        <option value="">No</option>
                                    </select>
                                </div>
                                <div class="price-range">
                                    <p>Price</p>
                                    <div class="range-slider">
                                        <div id="slider-range">
                                            <span tabindex="0" class="ui-slider-handle ui-corner-all ui-state-default slider-left">50k</span>
                                            <span tabindex="0" class="ui-slider-handle ui-corner-all ui-state-default slider-right">300k</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="search-btn">
                                    <button type="submit"><i class="flaticon-search"></i>Search</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>


            <div class="map-section">
                <div class="container-fluid">
                    <div class="row">
                        <div class="map">
                            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d107002.020096289!2d-96.80666618302782!3d33.06138629992991!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x864c21da13c59513%3A0x62aa036489cd602b!2sPlano%2C+TX%2C+USA!5e0!3m2!1sen!2sbd!4v1558246953339!5m2!1sen!2sbd" allowfullscreen></iframe>
                        </div>
                    </div>
                </div>
            </div>


            <section class="hotel-rooms spad-2">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12 p-45">
                            <div class="found-items">
                                <h4>We found <span>6</span> properties</h4>
                                <select class="date-select">
                                    <option value="0">Date New to Old</option>
                                    <option value="1">Old</option>
                                    <option value="2">New</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-4 col-md-4 col-md-6">
                            <div class="room-items">
                                <div class="room-img set-bg" data-setbg="static/searchResult/img/rooms/1.jpg">
                                    <a href="#" class="room-content">
                                        <i class="flaticon-heart"></i>
                                    </a>
                                </div>
                                <div class="room-text">
                                    <div class="room-details">
                                        <div class="room-title">
                                            <h5>Friends Pet Hotel</h5>
                                            <a href="#"><i class="flaticon-placeholder"></i> <span>1012,Amsterdam</span></a>
                                            <a href="#" class="large-width"><i class="flaticon-cursor"></i> <span>Show on
                                                    Map</span></a>
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
                                    <div class="room-explaination">
                                        <span>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of usingent here.</span>
                                    </div>
                                    <br>
                                    <div class="room-price">
                                        <p>Per Day</p>
                                        <span>$30</span>
                                    </div>
                                    <a href="property" class="site-btn btn-line" style="margin-top: 7px;">View Property</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-md-6">
                            <div class="room-items">
                                <div class="room-img set-bg" data-setbg="static/searchResult/img/rooms/2.jpg">
                                    <a href="#" class="room-content">
                                        <i class="flaticon-heart"></i>
                                    </a>
                                </div>
                                <div class="room-text">
                                    <div class="room-details">
                                        <div class="room-title">
                                            <h5>Friends Pet Hotel</h5>
                                            <a href="#"><i class="flaticon-placeholder"></i> <span>1012,Amsterdam</span></a>
                                            <a href="#" class="large-width"><i class="flaticon-cursor"></i> <span>Show on
                                                    Map</span></a>
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
                                    <div class="room-explaination">
                                        <span>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of usingent here.</span>
                                    </div>
                                    <br>
                                    <div class="room-price">
                                        <p>Per Day</p>
                                        <span>$30</span>
                                    </div>
                                    <a href="property" class="site-btn btn-line" style="margin-top: 7px;">View Property</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-md-6">
                            <div class="room-items">
                                <div class="room-img set-bg" data-setbg="static/searchResult/img/rooms/3.jpg">
                                    <a href="#" class="room-content">
                                        <i class="flaticon-heart"></i>
                                    </a>
                                </div>
                                <div class="room-text">
                                    <div class="room-details">
                                        <div class="room-title">
                                            <h5>Friends Pet Hotel</h5>
                                            <a href="#"><i class="flaticon-placeholder"></i> <span>1012,Amsterdam</span></a>
                                            <a href="#" class="large-width"><i class="flaticon-cursor"></i> <span>Show on
                                                    Map</span></a>
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
                                    <div class="room-explaination">
                                        <span>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of usingent here.</span>
                                    </div>
                                    <br>
                                    <div class="room-price">
                                        <p>Per Day</p>
                                        <span>$30</span>
                                    </div>
                                    <a href="property" class="site-btn btn-line" style="margin-top: 7px;">View Property</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-md-6">
                            <div class="room-items">
                                <div class="room-img set-bg" data-setbg="static/searchResult/img/rooms/4.jpg">
                                    <a href="#" class="room-content">
                                        <i class="flaticon-heart"></i>
                                    </a>
                                </div>
                                <div class="room-text">
                                    <div class="room-details">
                                        <div class="room-title">
                                            <h5>Friends Pet Hotel</h5>
                                            <a href="#"><i class="flaticon-placeholder"></i> <span>1012,Amsterdam</span></a>
                                            <a href="#" class="large-width"><i class="flaticon-cursor"></i> <span>Show on
                                                    Map</span></a>
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
                                    <div class="room-explaination">
                                        <span>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of usingent here.</span>
                                    </div>
                                    <br>
                                    <div class="room-price">
                                        <p>Per Day</p>
                                        <span>$30</span>
                                    </div>
                                    <a href="property" class="site-btn btn-line" style="margin-top: 7px;">View Property</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-md-6">
                            <div class="room-items">
                                <div class="room-img set-bg" data-setbg="static/searchResult/img/rooms/5.jpg">
                                    <a href="#" class="room-content">
                                        <i class="flaticon-heart"></i>
                                    </a>
                                </div>
                                <div class="room-text">
                                    <div class="room-details">
                                        <div class="room-title">
                                            <h5>Friends Pet Hotel</h5>
                                            <a href="#"><i class="flaticon-placeholder"></i> <span>1012,Amsterdam</span></a>
                                            <a href="#" class="large-width"><i class="flaticon-cursor"></i> <span>Show on
                                                    Map</span></a>
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
                                    <div class="room-explaination">
                                        <span>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of usingent here.</span>
                                    </div>
                                    <br>
                                    <div class="room-price">
                                        <p>Per Day</p>
                                        <span>$30</span>
                                    </div>
                                    <a href="property" class="site-btn btn-line" style="margin-top: 7px;">View Property</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-md-6">
                            <div class="room-items">
                                <div class="room-img set-bg" data-setbg="static/searchResult/img/rooms/6.jpg">
                                    <a href="#" class="room-content">
                                        <i class="flaticon-heart"></i>
                                    </a>
                                </div>
                                <div class="room-text">
                                    <div class="room-details">
                                        <div class="room-title">
                                            <h5>Friends Pet Hotel</h5>
                                            <a href="#"><i class="flaticon-placeholder"></i> <span>1012,Amsterdam</span></a>
                                            <a href="#" class="large-width"><i class="flaticon-cursor"></i> <span>Show on
                                                    Map</span></a>
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
                                    <div class="room-explaination">
                                        <span>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of usingent here.</span>
                                    </div>
                                    <br>
                                    <div class="room-price">
                                        <p>Per Day</p>
                                        <span>$30</span>
                                    </div>
                                    <a href="property" class="site-btn btn-line" style="margin-top: 7px;">View Property</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>


            <!-- Footer Section Begin -->
        <jsp:include page="footer.jsp"></jsp:include>
        <!-- Footer Section End -->


        <script src="static/searchResult/js/bootstrap.min.js" type="2d2eff642c81e1cd1273f0f1-text/javascript"></script>
        <script src="static/searchResult/js/jquery.nice-select.min.js" type="2d2eff642c81e1cd1273f0f1-text/javascript"></script>
        <script src="static/searchResult/js/owl.carousel.min.js" type="2d2eff642c81e1cd1273f0f1-text/javascript"></script>
        <script src="static/searchResult/js/jquery-ui.min.js" type="2d2eff642c81e1cd1273f0f1-text/javascript"></script>
        <script src="static/searchResult/js/jquery.slicknav.js" type="2d2eff642c81e1cd1273f0f1-text/javascript"></script>
        <script src="static/searchResult/js/main.js" type="2d2eff642c81e1cd1273f0f1-text/javascript"></script>

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

        <script src="https://ajax.cloudflare.com/cdn-cgi/scripts/a2bd7673/cloudflare-static/rocket-loader.min.js" data-cf-settings="2d2eff642c81e1cd1273f0f1-|49" defer=""></script>
        <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCRtVM7tqQzSYlpZbNQMApgii7DU5IhMSc&libraries=places&callback=activatePlaceSearch"></script>

    </body>
</html>
