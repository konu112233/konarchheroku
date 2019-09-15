<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Bookingpetz.com</title>

        <link href="static/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="static/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
        <link href="static/vendors/build/css/custom.min.css" rel="stylesheet">
        <link href="static/vendors/iCheck/skins/flat/green.css" rel="stylesheet">
        <link href="static/vendors/nprogress/nprogress.css" rel="stylesheet">

        <script src="http://ajax.googleapis.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>


        <style>
            .modal .row {
                margin-left: 15px;
                margin-right: 15px;
            }


        </style>
        <script type="text/javascript">

            function demo(a)
            {
                confirm("Are you sure");
                $("#" + a).text("Canceled");

                /*if(confirm = "yes"){
                 nesne.innerHTML = "Canceled";
                 }
                 else{
                 button.value = "Cancel";
                 }*/
            }
            function cancel(id) {

                document.getElementById("status" + id).innerHTML = "Canceled";
                document.getElementById("btnDelete" + id).disabled = true;
            }
            $(document).ready(function () {

            <c:forEach var="h" items="${reservationList}">
                console.log('${h.checkIn}');

            </c:forEach>

                var bookings = [
                    {
                        petName: "Arthur",
                        checkin: "May 23, 2014 11:47:56 PM",
                        checkout: "June 5, 2014 08:17:56 PM",
                        petOwner: "John Blank L",
                        status: "Paid",
                        totalPrice: "$8.45"
                    },
                    {
                        petName: "Candy",
                        checkin: "May 23, 2014 11:30:12 PM",
                        checkout: "May 26, 2014 08:17:56 PM",
                        petOwner: "John Blank L",
                        status: "Paid",
                        totalPrice: "$41.20"
                    },
                    {
                        petName: "Jumbo",
                        checkin: "May 24, 2014 10:55:33 PM",
                        checkout: "June 5, 2014 08:17:56 PM",
                        petOwner: "Mike Smith",
                        status: "Current",
                        totalPrice: "$432.26"
                    }
                ];
                var bookingsEmpty = ["test"];
                if (bookingsEmpty.length === 0) {
                    var bookingsTable = document.getElementById("bookingsTable");
                    var noBookings = document.getElementById("noBookings");
                    bookingsTable.style.display = "none";
                    noBookings.style.removeProperty("display");
                }

//                var bodyTable = document.getElementById("bodyTable");
//                var pointer = "odd pointer";
//                for (i = 0; i < bookings.length; i++) {
//                    if (i % 2 === 0) {
//                        pointer = "even pointer";
//                    }
//                    var div = '<tr class="' + pointer + '"> <td class="a - center "> </td> <td id="petName' + i + '">' + bookings[i].petName + '</td> <td id="checkin' + i + '">' + bookings[i].checkin +
//                            '</td> <td id="checkout' + i + '">' + bookings[i].checkout + '</td> <td id="petOwner' + i + '">' +
//                            bookings[i].petOwner + '</td> <td id="status' + i + '">' + bookings[i].status + '</td> <td id="totalPrice' + i + '" class="a-right a-right">' +
//                            bookings[i].totalPrice + '</td> <td class="last"> <button href="" type="button" id="booking1Button" class="btn btn-xs btn-success" data-toggle="modal" data-target="#booking1">\n\
//                            <i  class="fa fa-external-link"> </i> View </button> </td> </tr>';
//                    bodyTable.innerHTML = bodyTable.innerHTML + div;
//                }
            });



            function viewReservation(reservationId, checkIn, checkOut, service, totalPrice, petOwnerName, petOwnerPhone, petOwnerEmail, petName, petBreed, petSize, petGender, petAge, petVaccination, hotelName) {

                console.log(petAge);
                document.getElementById("serviceTable").innerHTML = "";
                var services = [];
                document.getElementById("bookingTitle").innerHTML = "Reservation details of" + " " + petName;

                document.getElementById("reservationId").innerHTML = reservationId;
                document.getElementById("hotelName").innerHTML = hotelName;


                document.getElementById("checkIn").innerHTML = checkIn;
                document.getElementById("checkOut").innerHTML = checkOut;

                var strService = service;
                console.log(strService);

                services = strService.split(',');

                for (var i = 0; i < services.length; i++) {
                    var splittedServices = services[i].split(':');
                    var serviceName = splittedServices[0];
                    var servicePrice = splittedServices[1];
                    document.getElementById("serviceTable").innerHTML = document.getElementById("serviceTable").innerHTML + '<tr><span>' + serviceName + ": €" + servicePrice + '</span></tr>';

                }
                document.getElementById("serviceTable").innerHTML = document.getElementById("serviceTable").innerHTML + '<hr><tr><h2><span><strong>Total : €' + totalPrice + '</strong></span></h2></tr><br>';

                console.log("serviceListtsa" + services.toString());


                document.getElementById("petOwnerName").innerHTML = petOwnerName;
                document.getElementById("petOwnerPhone").innerHTML = petOwnerPhone;
                document.getElementById("petOwnerEmail").innerHTML = petOwnerEmail;

                document.getElementById("petName").innerHTML = petName;
                document.getElementById("petBreed").innerHTML = petBreed;
                document.getElementById("petSize").innerHTML = petSize;
                document.getElementById("petGender").innerHTML = petGender;
                document.getElementById("petAge").innerHTML = petAge;
                document.getElementById("petVaccination").innerHTML = petVaccination;
                console.log("it works");
            }
        </script>
    </head>
    <body class="nav-md">
        <div class="container body">
            <div class="main_container">
                <jsp:include page="dashboardHeader.jsp"></jsp:include>

                    <div class="right_col" role="main">

                        <div class="col-md-12 col-sm-12 col-xs-12">

                            <div class="x_title">
                                <h2>Bookings History </h2>
                                <div class="clearfix"></div>
                            </div>
                            <div class="x_content">
                                <div class="modal fade" id="booking1" tabindex="-1" role="dialog">
                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                                <h2 class="modal-title" id="bookingTitle">Reservation details</h2>                                          
                                            </div>
                                            <div class="modal-body">
                                                <div class="container-fluid">
                                                    <div class="row">
                                                        <h3>Booking</h3>
                                                        <span><small id="bookingId">Id: <span id="reservationId"></span></small></span>
                                                        <hr>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <div class="row">
                                                                <h2>Check-in</h2>
                                                                <h3><span id="checkIn">May 23, 2014 11:47:56 PM</span></h3>
                                                            </div>
                                                            <div class="row">
                                                                <h2>Check-out</h2>
                                                                <h3><span id="checkOut">June 5, 2014 08:17:56 PM</span></h3>
                                                            </div>
                                                        </div>

                                                        <div class="col-md-6">
                                                            <h2>Price</h2>
                                                            <table id="serviceTable">

                                                            </table>

                                                        </div>
                                                    </div>

                                                    <hr>
                                                    <div style="margin-right:90px;" class="row">
                                                        <div class="wizard_horizontal">
                                                            <ul class="wizard_steps anchor">
                                                                <li>
                                                                    <a class="done" isdone="1" rel="1">
                                                                        <span class="step_no">1</span>
                                                                        <span class="step_descr">
                                                                            Booked<br>
                                                                            <!--<small>Reservation confirmed</small>-->
                                                                        </span>
                                                                    </a>
                                                                </li>
                                                                <li>
                                                                    <a class="done" isdone="1" rel="2">
                                                                        <span class="step_no">2</span>
                                                                        <span class="step_descr">
                                                                            Paid<br>
                                                                            <!--<small>Payment successful</small>-->
                                                                        </span>
                                                                    </a>
                                                                </li>

                                                                <li>
                                                                    <a class="selected" isdone="1" rel="4">
                                                                        <span class="step_no">3</span>
                                                                        <span class="step_descr">
                                                                            Current<br>
                                                                            <!--<small>Your pet is in good hands</small>-->
                                                                        </span>
                                                                    </a>
                                                                </li>
                                                                <li>
                                                                    <a class="disabled" isdone="1" rel="5">
                                                                        <span class="step_no">4</span>
                                                                        <span class="step_descr">
                                                                            Review<br>
                                                                            <!--<small>Please tell us what you feel</small>-->
                                                                        </span>
                                                                    </a>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                    <hr>
                                                    <div class="row">
                                                        <h3 id="hotelName">Hotel</h3>
                                                        <span><small>Id: 202836</small></span>
                                                        <hr>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col text-center">
                                                            <a href="property">See hotel details</a>
                                                        </div>
                                                    </div>



                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>        
                                <div class="table-responsive" id="bookingsTable">
                                    <table class="table table-striped jambo_table bulk_action">
                                        <thead>
                                            <tr class="headings">
                                                <th>
                                                    <!--  <input type="checkbox" id="check-all" class="flat"> -->
                                                </th>
                                                <th class="column-title">Hotel Name</th>
                                                <th class="column-title">Check-in Date </th>
                                                <th class="column-title">Check-out Date </th>
                                                <th class="column-title">Pet Name </th>
                                                <th class="column-title">Status </th>
                                                <th class="column-title">Amount </th>
                                                <th class="column-title no-link last"><span class="nobr">Action</span></th>
                                                <th class="bulk-actions" colspan="7">
                                                    <a class="antoo" style="color:#fff; font-weight:500;">Bulk Actions ( <span class="action-cnt"> </span> ) <i class="fa fa-chevron-down"></i></a>
                                                </th>
                                            </tr>
                                        </thead>
                                        <tbody id="bodyTable" >
                                        <c:forEach var="r" items="${reservationList}">
                                            <tr class="even pointer">
                                                <td class="a-center ">

                                                </td>
                                                <td class=" ">${r.hotelName}</td>
                                                <td class=" ">${r.checkIn}</td>
                                                <td class=" ">${r.checkOut}</td>
                                                <td class=" ">${r.petName}</td>
                                                <td class=" ">${r.status}</td>
                                                <td class="a-right a-right ">€${r.totalPrice} </td>
                                                <td class=" last">
                                                    <button href="" type="button"  onclick="viewReservation('idDefault', '${r.checkIn}', '${r.checkOut}', '${r.service}', '${r.totalPrice}', '${r.petOwnerName}', '${r.petOwnerPhone}', '${r.petOwnerEmail}', '${r.petName}', '${r.petBreed}', '${r.petSize}', '${r.petGender}', '${r.petAge}', '${r.petVaccination}', '${r.hotelName}');" class="btn btn-xs btn-success" data-toggle="modal" data-target="#booking1">
                                                        <i  class="fa fa-external-link"> </i> View 
                                                    </button>
                                                </td>
                                            </tr>
                                        </c:forEach>


                                    </tbody>
                                </table>
                            </div>
                            <div id="noBookings" style="display:none;">
                                <p class="text-center">You have no bookings yet.</p>
                            </div>
                        </div>

                    </div>

                </div>

                <jsp:include page="dashboardFooter.jsp"></jsp:include>
            </div>
        </div>

        <script src="static/vendors/iCheck/icheck.min.js" type="text/javascript"></script>
        <script src="static/build/js/custom.min.js" type="text/javascript"></script>
        <script src="static/vendors/jquery/dist/jquery.min.js" type="text/javascript"></script>
        <script src="static/vendors/bootstrap/dist/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="static/vendors/build/js/custom.min.js" type="text/javascript"></script>
        <script src="https://ajax.cloudflare.com/cdn-cgi/scripts/a2bd7673/cloudflare-static/rocket-loader.min.js" data-cf-settings="53fb5546d8872ed72f1ff495-|49" defer=""></script>
        <script src="https://kit.fontawesome.com/3135afb4f3.js"></script>
    </body>

</html>