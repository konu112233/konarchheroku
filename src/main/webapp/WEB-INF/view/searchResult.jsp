<%-- 
    Document   : result
    Created on : Jul 6, 2019, 6:10:41 PM
    Author     : burakzengin
--%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="d" %>
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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>

        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />



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
            $(document).ready(function () {
                //alert(${login});
            });
            var priceToBeSent;
            function GetFormattedDate(date) {

                var d = new Date(date),
                        month = '' + (d.getMonth() + 1),
                        day = '' + d.getDate(),
                        year = d.getFullYear();

                if (month.length < 2)
                    month = '0' + month;
                if (day.length < 2)
                    day = '0' + day;

                return [month, day, year].join('/');


            }
            $(function () {

                var today = new Date();
                var dd = String(today.getDate()).padStart(2, '0');
                var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
                var yyyy = today.getFullYear();

                today = mm + '/' + dd + '/' + yyyy;
                $('input[name="daterange"]').daterangepicker({
                    opens: 'center',
                    "minDate": today
                }, function (start, end, label) {
                    console.log("A new date selection was made: " + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD'));
                });

                document.getElementById("search_term").value = "${search.location}";

                var dateMin = "${search.timeMin}";
                dateMin = dateMin.split("T");
                var formattedDate = GetFormattedDate(dateMin[0]);
                console.log("xxx" + formattedDate);
                localStorage.setItem("dateMin", formattedDate);

                var dateMax = "${search.timeMax}";
                dateMax = dateMax.split("T");
                var formattedDate2 = GetFormattedDate(dateMax[0]);
                console.log("xxx" + formattedDate2);

                localStorage.setItem("dateMax", formattedDate2);


                document.getElementById("dates").value = formattedDate + " " + "-" + " " + formattedDate2;


                //console.log("str" + dateMinFormatted);


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

            var markers = [];
            var basePrice;
            var type = '${search.petType}';

            localStorage.setItem("petType", '${search.petType}');
            console.log("typpeeeeee" + '${search.petType}');


            <c:forEach var="c" items="${hotels}">

                <d:forEach var="s" items="${c.serviceList}">

            var serviceName = '${s.name}';
            if (serviceName == type + " " + "Boarding") {
                console.log('test1' + '${s.basePrice}');
                basePrice = '${s.basePrice}';

            }

                </d:forEach>

            var hotelInfo = {
                "hotelId": '${c.hotelId}',
                "title": '${c.propertyName}',
                "address": '${c.city}, ${c.street}, ${c.aptNo}, ${c.zipcode}',
                        "lat": '${c.lat}',
                        "lng": '${c.lng}',
                        "rate": '${c.rate}',
                        "basePrice": basePrice

                    }
                    ;

                    markers.push(hotelInfo);

                    hotel = new Object();
                    hotel.title = '${c.propertyName}';
                    hotel.description = '${c.description}';
                    hotel.contact_person = '${c.contactName}';
                    hotel.address = '${c.city}, ${c.street}, ${c.aptNo}, ${c.zipcode}';
                        hotel.rate = '${c.rate}';

                        console.log("test61" + '${c.rate}' + '${c.lat}' + '${c.lng}' + "price" + '${c.serviceList[0].basePrice}');
            </c:forEach>

                        window.onload = function () {
                            LoadMap();

                        }
                        function LoadMap() {
                            var mapOptions = {
                                center: new google.maps.LatLng(markers[0].lat, markers[0].lng),
                                zoom: 12,
                                mapTypeId: google.maps.MapTypeId.ROADMAP
                            };
                            var map = new google.maps.Map(document.getElementById("map"), mapOptions);

                            //Create and open InfoWindow.
                            var infoWindow = new google.maps.InfoWindow();

                            for (var i = 0; i < markers.length; i++) {
                                var data = markers[i];
                                var myLatlng = new google.maps.LatLng(data.lat, data.lng);
                                var marker = new google.maps.Marker({
                                    hotelId: data.hotelId,
                                    position: myLatlng,
                                    map: map,
                                    title: data.title,
                                    rate: data.rate,
                                    basePrice: data.basePrice
                                });
                                // marker.setIcon("static/images/paw_green.svg");


                                //Attach click event to the marker.
                                (function (marker, data) {
                                    google.maps.event.addListener(marker, "click", function (e) {
                                        //Wrap the content inside an HTML DIV in order to set height and width of InfoWindow.
                                        //Wrap the content inside an HTML DIV in order to set height and width of InfoWindow.
                                        infoWindow.setContent(" <div > <img class='img-thumbnail' src='https://q-cf.bstatic.com/images/hotel/max1280x900/155/15538911.jpg' style='height:95px;width:auto; float:left;'> <p class='font-weight-bold d-inline ml-2' style='color:#459756; font-size:15px;'> " + data.title + " <button style='border:none;border-radius: 6px; margin-left: 3px;background-color: #4CAF50; padding: 5px 5px 5px 5px;font-family: arial; font-size: 12px; cursor: pointer; color: white;'> <strong>" + data.rate + "</strong></button> </p><hr class='m-2 p-0'> <div style='display: flex; align-items: right; justify-content: center;'> <div > <span class='fas fa-euro-sign' style='color:#459756;font-size:18px;margin-top:14px;'>" + data.basePrice + "</span></div> <a  href='property?object=" + data.hotelId + "' class='button' onclick='sendPrice(" + data.hotelId + ")'  style='margin-left:25px;border:none;border-radius: 6px; margin-top:12px;background-color: #4CAF50; padding: 5px 5px 5px 5px;font-family: arial; font-size: 12px; cursor: pointer; color: white;'> View Details </a> </div> <div > <span style='color:#459756; font-size:14px;' class='fas fa-map-marker-alt mt-2'>" + data.address + "</span> </div> </div> ");
                                        infoWindow.open(map, marker);
                                        priceToBeSent = document.getElementById(data.hotelId).innerText;
                                        localStorage.setItem("price", priceToBeSent);
                                        localStorage.setItem("hotelId", hotelId);
                                        console.log("hayr" + priceToBeSent);

                                    });
                                })(marker, data);
                            }
                        }
                        function activatePlaceSearch() {
                            var input = document.getElementById("search_term");
                            var autocomplete = new google.maps.places.Autocomplete(input);
                        }
                        function showOnMap() {
                            console.log("clicked");




                            google.maps.event.trigger(markers[1], 'click');
                        }
                        function sendPrice(hotelId) {
                            //  alert(document.getElementById(hotelId).innerText);
                            console.log("iddd" + hotelId + "sss");
                            priceToBeSent = document.getElementById(hotelId).innerText;
                            localStorage.setItem("price", priceToBeSent);
                            localStorage.setItem("hotelId", hotelId);



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
                                    <div class="row">
                                        <div style="margin-top: 10px" class="col-md-4 col-sm-12 col-xs-12  "><input type="text"  name="location" id="search_term" class="booking_input " placeholder="Where ?" required="required"></div>
                                        <div style="margin-top: 10px" class="col-md-4 col-sm-12 col-xs-12"><input type="text" id="dates" name="daterange" class="booking_input  " placeholder="Check-in - Check-out" /></div>
                                        <!--                                                            <div><input type="text" name="checkin" class="datepicker booking_input booking_input_a booking_in" placeholder="Check in" required="required"></div>
                                                                                                    <div><input type="text" name="checkout" class="datepicker booking_input booking_input_a booking_out" placeholder="Check out" required="required"></div>-->
                                        <div style="margin-top: 10px" class="col-md-2 col-sm-12 col-xs-12 ">
                                            <select class="booking_input booking_input_c form-control" id="petType" name="petType" style="height: 54px;" required="required">
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
                                            <a onclick="showOnMap()"  class="large-width">
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
                                                    <span id="${c.hotelId}" >€${h.basePrice}</span>
                                                </c:if>
                                            </c:forEach>
                                        </c:if>
                                        <c:if test="${search.petType eq 'Cat'}">   
                                            <c:forEach var="h" items="${c.serviceList}">
                                                <c:if test="${h.name eq 'Cat Boarding'}">   
                                                    <span id="${c.hotelId}">€${h.basePrice}</span>
                                                </c:if>
                                            </c:forEach>
                                        </c:if>
                                    </div>
                                    <a href="property?object=${c.hotelId}" onclick="sendPrice('${c.hotelId}')" class="site-btn btn-line" style="margin-top: 7px;">View Property</a>
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


        <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>

    </body>
</html>
