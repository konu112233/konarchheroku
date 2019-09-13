<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
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

        #checkin, #checkout,  #dates

        {
            border: none;
            border-bottom: 1px solid green;
            text-align: center;
            font-size: 18px;
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

        var isSignIn = 0;
        var type = '${search.petType}';
        var dateMin;
        var dateMax;
        var petList = [];
        var chosenPet;
        var addedServices = [];
        $(document).ready(function () {
            var counter = 0;
        <c:forEach var="h" items="${petList}">
            console.log("petss" + '${h.name}');
            document.getElementById("selectPet").innerHTML = document.getElementById("selectPet").innerHTML + '<option value="' + counter + '" >' + '${h.name}' + '</option>';
            var petObject = {
                "petId": '${h.id}',
                "userId": '${h.userId}',
                "petName": '${h.name}',
                "petBreed": '${h.breed}',
                "petSize": '${h.petSize}',
                "petGender": '${h.gender}',
                "petAge": '${h.age}',
                "petVaccination": '${h.vaccination}',
            };
            petList.push(petObject);
            counter++;
        </c:forEach>

            chosenPet = petList[0];
            console.log("chosenPet" + JSON.stringify(chosenPet));
            //document.getElementById("petSelect").innerHTML = document.getElementById("petSelect").innerHTML + '<option value="1">ohhho</option>';
            console.log("isOnline" + '${online}' + 'petList' + '${petList}');
            isSignIn = '${online}';
            //get data from previous page
            var dateMin = localStorage.getItem("dateMin");
            document.getElementById("checkin").value = dateMin;
            var dateMax = localStorage.getItem("dateMax");
            document.getElementById("checkout").value = dateMax;
            document.getElementById("dates").value = dateMin + dateMax;
            // alert(document.getElementById("checkin").innerText);
            console.log("page2" + localStorage.getItem("price"));
            document.getElementById("price").innerText = localStorage.getItem("price");
            document.getElementById("roomPrice").innerText = localStorage.getItem("price");
            document.getElementById("priceNights").innerText = localStorage.getItem("price");
            var trimmedPrice = localStorage.getItem("price").substring(1);
            document.getElementById("total").innerText = parseInt(trimmedPrice);
            var petType = localStorage.getItem("petType");
            console.log("petType" + petType);
            getDiff();
            // alert(localStorage.getItem("price"));

            var dateMax = localStorage.getItem("dateMax");
            console.log("qwert" + type);
            if (isSignIn == 1) {
                $("#bookNow").attr("data-target", "#servicesModal");
            }


            var serviceList = [];
            var priceList = [];
        <c:forEach var="c" items="${hotel.serviceList}">
            console.log("name222:" + '${c.name}');
            serviceList.push('${c.name}');
            console.log('${c.basePrice}');
            priceList.push('${c.basePrice}');
        </c:forEach>

            if (serviceList.includes(petType + " " + "Day Care")) {
                const index = serviceList.indexOf(petType + " " + "Day Care");
                jQuery("#serviceDaycare").find("td:eq(1)").text("€" + priceList[index]);
            } else {
                $("#serviceDaycare").hide();
            }
            if (serviceList.includes(petType + " " + "Washing")) {
                const index = serviceList.indexOf(petType + " " + "Washing");
                jQuery("#serviceWashing").find("td:eq(1)").text("€" + priceList[index]);
            } else {
                $("#serviceWashing").hide();
            }
            console.log("hyy" + petType + " " + "Medication");
            if (serviceList.includes(petType + " " + "Medication")) {
                const index = serviceList.indexOf(petType + " " + "Medication");
                jQuery("#serviceMedication").find("td:eq(1)").text("€" + priceList[index]);
            } else {
                $("#serviceMedication").hide();
            }
            if (serviceList.includes(petType + " " + "Nail Clipping")) {
                const index = serviceList.indexOf(petType + " " + "Nail Clipping");
                jQuery("#serviceNail").find("td:eq(1)").text("€" + priceList[index]);
            } else {
                $("#serviceNail").hide();
            }
            if (serviceList.includes(petType + " " + "Groomming and Trimming")) {
                const index = serviceList.indexOf(petType + " " + "Groomming and Trimming");
                jQuery("#serviceGroomming").find("td:eq(1)").text("€" + priceList[index]);
            } else {
                $("#serviceGroomming").hide();
            }


            console.log("omer");
            console.log("ss" + '${c.name}');
            var tds = document.querySelectorAll('#serviceTable td');
            for (var i = 0; i < 25; i++) {
                console.log("innersfirst::" + tds[i].innerHTML);
                if (serviceList.includes(tds[i].innerHTML)) {
                    const index = serviceList.indexOf(tds[i].innerText);
                    tds[i].innerHTML = '<img src="static/searchResult/img/check.png" style="width:15px;" alt=""> <span class="ml-2">' + tds[i].innerText + '</span>';
                    tds[i].className = "font-weight-bold";
                    tds[i + 1].innerHTML = '<i class="fas fa-euro-sign"</i> <span>' + priceList[index] + '</span>';
                    console.log("innerssecond::" + tds[i].innerText);
                    // $(serviceId).trigger("click");
                    // $(priceId).val(priceList[index]);
                }

                i++;
            }


            //document.getElementById("serviceRow1").innerHTML = "formatted_checkout";


//            for (var i = 1; i < 13; i++) {
//
//                var serviceId = "#cact" + i;
//                var nameId = "#service" + i;
//                var priceId = "#tboxact" + i;
//                var name = $(nameId).text().trim();
//                if (serviceList.includes(name)) {
//                    const index = serviceList.indexOf(name);
//                    $(serviceId).trigger("click");
//                    $(priceId).val(priceList[index]);
//                }
//            }
        })



        window.onload = function () {

            var today = new Date();
            var dd = String(today.getDate()).padStart(2, '0');
            var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
            var yyyy = today.getFullYear();
            today = mm + '/' + dd + '/' + yyyy;
            $('input[name="daterange"]').daterangepicker({

                "startDate": localStorage.getItem("dateMin"),
                "endDate": localStorage.getItem("dateMax"),
                opens: 'center',
                "minDate": today
            }, function (start, end, label) {
                console.log("A new date selection was made: " + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD'));
                document.getElementById("checkin").value = start.format('MM/DD/YYYY');
                getDiff();
                document.getElementById("checkout").value = end.format('MM/DD/YYYY');
                getDiff();
                minOut();
            });
            var x = jQuery("#serviceDaycare").find("td:eq(1)").text();
            //jQuery("#serviceDaycare").find("td:eq(1)").text("€" + "50");


            var addr;
            addr = '${hotel.city}, ${hotel.street}, ${hotel.aptNo}, ${hotel.country}';
                    document.getElementById("location").src = "https://www.google.com/maps?q=" + addr + " &output=embed";
                };
                var serviceTotal = 90;
                function selectService(serviceId) {
                    var tr = document.getElementById(serviceId);
                    var tds = tr.getElementsByTagName("td");
                    var serviceName = tds[0].innerText;
                    var servicePrice = tds[1].innerText;
                    var serviceNamePrice = serviceName + ":" + servicePrice;
                    console.log(serviceNamePrice);
                    if (document.getElementById(serviceId + "Btn2").style.display === "none") {
                        servicePrice = servicePrice.replace("€", "");
                        serviceTotal += parseFloat(servicePrice);
                        tds[0].setAttribute("class", "font-weight-bold");
                        tds[1].setAttribute("class", "font-weight-bold");
                        document.getElementById(serviceId + "Btn2").style.display = "block";
                        document.getElementById(serviceId + "Btn").style.display = "none";
                        addedServices.push(serviceNamePrice);
                    } else {
                        const index = addedServices.indexOf(serviceNamePrice);
                        addedServices[index] = "";
                        servicePrice = servicePrice.replace("€", "");
                        serviceTotal -= parseFloat(servicePrice);
                        tds[0].setAttribute("class", "");
                        tds[1].setAttribute("class", "");
                        document.getElementById(serviceId + "Btn2").style.display = "none";
                        document.getElementById(serviceId + "Btn").style.display = "block";
                    }
                    document.getElementById("serviceTotal").innerHTML = "<span>€" + parseFloat(serviceTotal).toFixed(2) + "</span>";
                    //  document.getElementById("serviceTotal").innerHTML = "<span>€" + serviceTotal + "</span>";

                    console.log("addedServies" + addedServices.toLocaleString());
                }

                window.onload = selectService();
                function getDiff() {
                    var checkin = document.getElementById("checkin").value;
                    console.log("checkin" + checkin);
                    var checkinDate = new Date(checkin);
                    var checkout = document.getElementById("checkout").value;
                    console.log("checkin" + checkout);
                    var checkoutDate = new Date(checkout);
                    var roomPrice = localStorage.getItem("price");
                    roomPrice = roomPrice.substring(1);
                    var roomNights = document.getElementById("roomNights");
                    var fee = 0;
                    var total = document.getElementById("total");
                    var boardingService = document.getElementById("boardingService");
                    var boardingPrice = document.getElementById("boardingPrice");
                    if (checkin !== null && checkin !== '' && checkout !== null && checkout !== '') {

                        var timeDiff = parseInt(checkoutDate.getTime() - checkinDate.getTime());
                        var daysDiff = parseInt(timeDiff / (1000 * 3600 * 24));
                        var roomNightsPrice = parseInt(daysDiff * roomPrice);
                        var totalPrice = parseInt(roomNightsPrice);
                        roomNights.innerHTML = daysDiff + " nights : " + "<span>€" + roomNightsPrice + "</span>";
                        total.innerHTML = totalPrice;
                        serviceTotal = totalPrice;
                        document.getElementById("serviceTotal").innerHTML = "£" + serviceTotal;
                        document.getElementById("daysSummary").innerHTML = daysDiff;
                        document.getElementById("breed").innerHTML = "Dog";
                        const months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
                        let formatted_checkin = months[checkinDate.getMonth()] + " " + checkinDate.getDate() + ", " + " " + checkinDate.getFullYear();
                        let formatted_checkout = months[checkoutDate.getMonth()] + " " + checkoutDate.getDate() + ", " + " " + checkoutDate.getFullYear();
                        document.getElementById("checkinSummary").innerHTML = formatted_checkin;
                        document.getElementById("checkoutSummary").innerHTML = formatted_checkout;
                        //   $("#checkinSummary").text("heyy");

                        boardingService.innerHTML = "(" + roomPrice + " x " + daysDiff + " nights)";
                        boardingPrice.innerHTML = "£" + roomNightsPrice;
                        console.log("getDiff works");
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
                function selectedPet() {
                    $("#selectPet :selected").text(); // The text content of the selected option
                    $("#selectPet :selected").val();
                    var whichPet = $("#selectPet :selected").val(); // The value of the selected option

                    chosenPet = petList[whichPet];
                    console.log("chosenPETTT" + chosenPet.petName);
                }


                function book() {
                    var hotelId = localStorage.getItem("hotelId");
                    localStorage.getItem("hotelId");
                    console.log("booking" + document.getElementById("checkin").value + " " + document.getElementById("checkout").value + " " + document.getElementById("serviceTotal").innerText + "id" + hotelId + " " + '${hotel.propertyName}');
                    var stringServices = "";
                    for (var i = 0; i < addedServices.length; i++) {

                        stringServices += "," + addedServices[i];
                    }

                    var reservation = {
                        "checkIn": document.getElementById("checkin").value,
                        "checkOut": document.getElementById("checkout").value,
                        "service": stringServices,
                        "totalPrice": document.getElementById("serviceTotal").innerText,
                        "hotelId": localStorage.getItem("hotelId"),
                        "hotelName": '${hotel.propertyName}',
                        "petOwnerId": chosenPet.userId,
                        "petOwnerName": '${userInfo.name}',
                        "petOwnerPhone": '${userInfo.phone}',
                        "petOwnerEmail": '${userInfo.email}',
                        "petId": chosenPet.petId,
                        "petName": chosenPet.petName,
                        "petBreed": chosenPet.petBreed,
                        "petSize": chosenPet.petSize,
                        "petGender": chosenPet.petGender,
                        "petAge": chosenPet.petAge,
                        "vaccination": chosenPet.petVaccination,
                        "status": "current"
                    };
                    console.log("book" + JSON.stringify(reservation));
                    $('#result').val(JSON.stringify(reservation));
                    $("#pay").submit();
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
                                <h3>${hotel.propertyName}</h3>
                            <a href="#"><i class="fa flaticon-placeholder"></i>${hotel.city}, ${hotel.street}, ${hotel.aptNo}, ${hotel.country}</a>
                        </div>
                        <div class="property-price">
                            <p>Per Day</p>
                            <span id="price"></span>
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
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="property-description">
                                        <h4>Description</h4>
                                        <p>${hotel.description}</p>
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
                                                        <tbody id="serviceTable">
                                                            <tr id="serviceRow1">
                                                                <td>Dog Boarding</td>
                                                                <td></td>
                                                                <td>Cat Boarding</td>
                                                                <td></td>
                                                            </tr>
                                                            <tr id="serviceRow2">
                                                                <td>Dog Day Care</td>
                                                                <td></td>
                                                                <td>Cat Day Care</td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td>Dog Washing</td>
                                                                <td></td>
                                                                <td>Cat Washing</td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td>Dog Nail Clipping</td>
                                                                <td></td>
                                                                <td>Cat Nail Clipping</td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td>Dog Groomming and Trimming</td>
                                                                <td></td>
                                                                <td>Cat Groomming and Trimming</td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td>Dog Medication</td>
                                                                <td></td>
                                                                <td>Cat Medication</td>
                                                                <td></td>
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
                                    <h5>${hotel.contactName}</h5>
                                    <table>
                                        <tr>
                                            <td>Office : <span>${hotel.phone}</span></td>
                                        </tr>
                                        <tr>
                                            <td>Mobile : <span>1-517-328-7751</span></td>
                                        </tr>
                                        <tr>
                                            <td>Email : <span>${hotel.bookingEmail}</span></td>
                                        </tr>

                                    </table>
                                    <div class="row">
                                        <div class="col align-self-start room-price">
                                            <p>Per Day</p>
                                            <span id="roomPrice"></span>
                                        </div>
                                        <div class="col align-self-end stars">
                                            <p>Rate</p>
                                            <span>${hotel.rate}/5</span>
                                        </div>
                                    </div>
                                    <div>
                                        <p>Dates</p>
                                        <br>
                                        <input type="text" id="dates" name="daterange" class="col-10 align-self-end " placeholder="Check-in - Check-out" />
                                        <br>
                                        <div class="row" hidden> 
                                            <span class="col-6">Check in</span>
                                            <input type="text" onchange="getDiff()" id="checkin" name="checkin" class="rangepicker col-5 align-self-end" placeholder="Check in" required="required">      
                                        </div>
                                        <br>
                                        <div class="row" hidden >
                                            <span class="col-6">Check out</span>
                                            <input type="text" onchange="getDiff(); minOut()" id="checkout" name="checkout" class="col-5 align-self-end" placeholder="Check out" required="required">
                                        </div>
                                        <br>
                                    </div>
                                    <div>
                                        <p>Pet</p>
                                        <select onchange="selectedPet()" id="selectPet" class="browser-default custom-select">


                                        </select>
                                        <br>
                                    </div>
                                    <div>
                                        <table>
                                            <tr>
                                                <td id="roomNights">1 night : <span id="priceNights">45</span></td>
                                            </tr>

                                            <tr>
                                                <td>Total without services :<span>€ <span id="total"></span></span></td>
                                            </tr>
                                        </table>
                                    </div>

                                    <!--signupForBookingForm     #signupForBookingForm-->
                                    <a href="" id="bookNow" class="site-btn list-btn" data-toggle="modal"  data-target="#signupForBookingForm">Book Now!</a>
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
                                                                                <div class="col-md-4 col-sm-6 col-xs-6" >
                                                                                    <div class="row" ><h9><small>Check-in Date</small></h9></div>
                                                                                    <div class="row" ><h7><strong><strong id="checkinSummary"  ></strong ></strong></h7></div>

                                                                                </div>
                                                                                <div class="col-md-4 col-sm-6 col-xs-6" >
                                                                                    <div class="" >
                                                                                        <div class="row"> <h9><small>Check-out Date</small></h9></div>
                                                                                        <div class="row"> <h7><strong><strong id="checkoutSummary"></strong></strong></h7></div>
                                                                                    </div>

                                                                                </div>
                                                                                <div class="col-md-2 col-sm-6 col-xs-6" >
                                                                                    <div class="" >
                                                                                        <div class="row"> <h9><small>Day</small></h9></div>
                                                                                        <div class="row" style="padding-left:4px"> <h7><strong><strong id="daysSummary">2</strong></strong></h7></div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="col-md-2 col-sm-6 col-xs-6" >
                                                                                    <div class="" >
                                                                                        <div class="row"> <h9><small>Breed</small></h9></div>
                                                                                        <div class="row"> <h7><strong><strong id="breed">Dog</strong></strong></h7></div>
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
                                                                                            <td  class="a-right a-right font-weight-bold " id="boardingPrice">€90</td>
                                                                                            <td class="font-weight-bold" id="boardingService">(45 x 2 nights)</td>
                                                                                        </tr>
                                                                                        <tr id="serviceDaycare" class="even pointer">
                                                                                            <td  >Daycare</td>
                                                                                            <td class="a-right a-right">€10.45</td>
                                                                                            <td >
                                                                                                <div id="serviceDaycareBtn" >
                                                                                                    <a  onclick="selectService(this.parentNode.parentNode.parentNode.id)"  class="blue-gradient  btn-sm">
                                                                                                        <i class="fa fa-plus text-white"></i>
                                                                                                    </a>
                                                                                                </div>
                                                                                                <div id="serviceDaycareBtn2" style="display:none;">
                                                                                                    <a  onclick="selectService(this.parentNode.parentNode.parentNode.id)" class="btn-danger btn-sm" style="color:#fff;"><i class="fas fa-minus"></i></a>
                                                                                                </div>
                                                                                            </td>
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
                                                                                            <td  >Groomming and Trimming</td>
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
                                                                            </div>
                                                                            <!-- /.row -->


                                                                        </section>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="modal-footer">

                                                        <button type="button" onclick="book();" class="btn  blue-gradient">Pay</button>

                                                    </div>
                                                    <form id="pay" action="pay" method="POST">
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
        <script src="static/plugins/jquery-datepicker/jquery-ui.js"></script>


        <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>


    </body>
</html>
