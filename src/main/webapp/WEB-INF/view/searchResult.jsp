<%-- 
    Document   : result
    Created on : Jul 6, 2019, 6:10:41 PM
    Author     : burakzengin
--%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
        <title>Bookingpetz.com</title>

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
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>


        <style>
            #map{
                height:700px;
                width:100%;
            }
            .size {
                text-align: center;
            }
        </style>
        <script>

            map = new Array();
            <c:forEach var="c" items="${hotels}">
            hotel = new Object();
            hotel.title = '${c.propertyName}';
            hotel.description = '${c.description}';
            hotel.contact_person = '${c.contactName}';
            hotel.address = '${c.city}, ${c.street}, ${c.aptNo}, ${c.zipcode}';
                hotel.rate = '${c.rate}';
                map.push(hotel);
            </c:forEach>
                var markers = [
                    {
                        "title": '${c}',
                        "lat": '52.379189',
                        "lng": '4.899431',
                        "description": 'Aksa Beach is a popular beach and a vacation spot in Aksa village at Malad, Mumbai.',
                        "contact_person": 'Andrew johnson',
                        "address": "   CG Roosweg 19 2871MB",
                        "rate": "4,5"
                    },
                    {
                        "title": 'Wellness Pet Hotel',
                        "lat": '52.200189',
                        "lng": '5.100431',
                        "description": 'Juhu Beach is one of favourite tourist attractions situated in Mumbai.',
                        "contact_person": 'Smith johnson',
                        "cat": "http://localhost/bookingpetzBKP/live/resultPages/cat.png",
                        "dog": "http://localhost/bookingpetzBKP/live/resultPages/dog.png",
                        "address": "   CG Roosweg 19 2871MB",
                        "rate": "4,7"
                    },
                    {
                        "title": 'Forever Forever Pet Hotel',
                        "lat": '52.421189',
                        "lng": '5.500431',
                        "description": 'Girgaum Beach commonly known as just Chaupati is one of the most famous public beaches in Mumbai.',
                        "contact_person": 'Rocky johnson',
                        "cat": "http://localhost/bookingpetzBKP/live/resultPages/cat.png",
                        "dog": "http://localhost/bookingpetzBKP/live/resultPages/dog.png",
                        "address": "   CG Roosweg 19 2871 MB",
                        "rate": "5,0"
                    },
                    {
                        "title": 'Kind Pet Hotel',
                        "lat": '52.321189',
                        "lng": '5.500431',
                        "description": 'Jijamata Udyan is situated near Byculla station is famous as Mumbai (Bombay) Zoo.',
                        "contact_person": 'saniya johnson',
                        "cat": "http://localhost/bookingpetzBKP/live/resultPages/cat.png",
                        "dog": "http://localhost/bookingpetzBKP/live/resultPages/dog.png",
                        "address": "   CG Roosweg 19 2871 MB",
                        "rate": "4,3"
                    },
                    {
                        "title": 'Vondel Pet Hotel',
                        "lat": '52.81189',
                        "lng": '52.31062020000004',
                        "description": 'Sanjay Gandhi National Park is a large protected area in the northern part of Mumbai city.',
                        "contact_person": 'Olga johnson',
                        "cat": "http://localhost/bookingpetzBKP/live/resultPages/cat.png",
                        "dog": "http://localhost/bookingpetzBKP/live/resultPages/dog.png",
                        "address": "   CG Roosweg 19 2871 MB",
                        "rate": "4,8"
                    }
                ];
                window.onload = function () {
                    LoadMap();
                }
                function LoadMap() {
                    var mapOptions = {
                        center: new google.maps.LatLng(markers[0].lat, markers[0].lng),
                        zoom: 8,
                        mapTypeId: google.maps.MapTypeId.ROADMAP
                    };
                    var map = new google.maps.Map(document.getElementById("map"), mapOptions);

                    //Create and open InfoWindow.
                    var infoWindow = new google.maps.InfoWindow();

                    for (var i = 0; i < markers.length; i++) {
                        var data = markers[i];
                        var myLatlng = new google.maps.LatLng(data.lat, data.lng);
                        var marker = new google.maps.Marker({
                            position: myLatlng,
                            map: map,
                            title: data.title,
                            rate: data.rate
                        });
                        // marker.setIcon("static/images/paw_green.svg");


                        //Attach click event to the marker.
                        (function (marker, data) {
                            google.maps.event.addListener(marker, "click", function (e) {
                                //Wrap the content inside an HTML DIV in order to set height and width of InfoWindow.
                                infoWindow.setContent("<div style='width:320px;min-height:100px;'> <img src='https://q-cf.bstatic.com/images/hotel/max1280x900/155/15538911.jpg' style='height:95px;width:auto; float:left;'> <span style='padding:15px;color:#459756;font-size:15px;'><strong>" + data.title + "</strong> <span> <button style='border:none;border-radius: 6px; margin-left: 3px;background-color: #4CAF50; padding: 5px 5px 5px 5px;font-family: arial; font-size: 12px; cursor: pointer; color: white;'> <strong>" + data.rate + "</strong> </button> </span> </span> <p> <span style='padding:15px;font-size:10px;'> <i class='fa fa-home' style='padding-right: 3px;'></i>" + data.address + " </span> <br> <div class='row'> <div class='col-md-6'> </div> <div class='col-md-2'> <span style='color:#459756;font-size:18px;'> 555&euro;</span> </div> </div> </p> </div>");
                                infoWindow.open(map, marker);
                            });
                        })(marker, data);
                    }
                }
                function activatePlaceSearch() {
                    var input = document.getElementById("search_term");
                    var autocomplete = new google.maps.places.Autocomplete(input);
                }

//            $(document).ready(function () {
//                $('#petType').val(${search.petType});
//            });
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
                                    <form action="searchResult" method="GET" class="booking_form">
                                        <div class="d-flex flex-xl-row flex-column align-items-start justify-content-start">
                                            <div class="booking_input_container d-flex flex-lg-row flex-column align-items-start justify-content-start">
                                                <div><input type="text" name="location" id="search_term" class="booking_input booking_input_b" placeholder="Where ?" required="required"></div>
                                                <div><input type="text" name="checkin" class="datepicker booking_input booking_input_a booking_in" placeholder="Check in" required="required"></div>
                                                <div><input type="text" name="checkout" class="datepicker booking_input booking_input_a booking_out" placeholder="Check out" required="required"></div>
                                                <div>
                                                    <select class="booking_input booking_input_c form-control" name="petType" style="height: 54px;" required="required">
                                                    <c:choose>
                                                        <c:when test="${search.petType == 'Dog'}">
                                                            <option selected value="Dog">Dog</option> 
                                                            <option value="Cat">Cat</option>
                                                        </c:when>    
                                                        <c:otherwise>
                                                            <option value="Dog">Dog</option> 
                                                            <option selected value="Cat">Cat</option>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </select>
                                            </div>
                                        </div>
                                        <div><button type="submit" class="booking_button trans_200">Find Now</button></div>
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
                                <button type="submit"><i class="flaticon-settings-2"></i>Apply</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <div class="map-section">
            <div class="container-fluid">
                <div class="row">
                    <div id="map" class="map">

                    </div>
                </div>
            </div>
        </div>

        <section class="hotel-rooms spad-2">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 p-45">
                        <div class="found-items">
                            <h4>We found <span>${fn:length(hotels)}</span> properties</h4>
                            <select class="date-select">
                                <option value="0">Date New to Old</option>
                                <option value="1">Old</option>
                                <option value="2">New</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <c:forEach var="c" items="${hotels}">
                        <div class="col-lg-4 col-md-4 col-md-6">
                            <div class="room-items">
                                <div id="rate1" class="room-img set-bg" data-setbg="static/searchResult/img/rooms/2.jpg">
                                    <a href="#" class="room-content">
                                        <button  style='margin-bottom: 5px;border:none;border-radius: 6px; margin-left: 3px;background-color: #4CAF50; padding: 5px 5px 5px 5px;font-family: arial; font-size: 20px; cursor: pointer; color: white;'>
                                            <strong>${c.rate}/5</strong>
                                        </button>
                                    </a>
                                </div>
                                <div class="room-text">
                                    <div class="room-details">
                                        <div class="room-title">
                                            <h5>${c.propertyName}</h5>
                                            <a href="#">
                                                <i class="flaticon-placeholder"></i>
                                                <span>${c.city}, ${c.street}, ${c.aptNo}, ${c.zipcode}</span>
                                            </a>
                                            <a href="#" class="large-width">
                                                <i class="flaticon-cursor"></i>
                                                <span>Show on Map</span>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="room-features">
                                        <div class="room-info" style="text-align:center">
                                            <c:forEach var="h" items="${c.serviceList}">
                                                <div class="beds pl-1 pr-1">
                                                    <p>${h.name}</br><img src="static/searchResult/img/check.png" alt=""></p>    
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </div>
                                    <div class="room-explaination">
                                        <span>${c.description}</span>
                                    </div>
                                    <br>
                                    <div class="room-price">
                                        <p>Per Day</p>
                                        <c:if test="${search.petType eq 'Dog'}">   
                                            <c:forEach var="h" items="${c.serviceList}">
                                                <c:if test="${h.name eq 'Dog Boarding'}">   
                                                    <span>$${h.basePrice}</span>
                                                </c:if>
                                            </c:forEach>
                                        </c:if>
                                        <c:if test="${search.petType eq 'Cat'}">   
                                            <c:forEach var="h" items="${c.serviceList}">
                                                <c:if test="${h.name eq 'Cat Boarding'}">   
                                                    <span>$${h.basePrice}</span>
                                                </c:if>
                                            </c:forEach>
                                        </c:if>
                                    </div>
                                    <a href="property?object=${c.hotelId}" class="site-btn btn-line" style="margin-top: 7px;">View Property</a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>

                </div>
            </div>
        </section>

        <!-- Footer Section Begin -->
        <jsp:include page="footer.jsp"></jsp:include>
        <!-- Footer Section End -->
        <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCRtVM7tqQzSYlpZbNQMApgii7DU5IhMSc&callback=initMap"></script>
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
        <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCRtVM7tqQzSYlpZbNQMApgii7DU5IhMSc&libraries=places&callback=activatePlaceSearch"></script>


        <script src="https://ajax.cloudflare.com/cdn-cgi/scripts/a2bd7673/cloudflare-static/rocket-loader.min.js" data-cf-settings="2d2eff642c81e1cd1273f0f1-|49" defer=""></script>
        <!--<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCRtVM7tqQzSYlpZbNQMApgii7DU5IhMSc&libraries=places&callback=activatePlaceSearch"></script>-->

    </body>
</html>
