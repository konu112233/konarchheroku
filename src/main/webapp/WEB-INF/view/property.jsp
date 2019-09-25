<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="d" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
        #petGender .btn.btn-default,
        #petGender .btn.btn-primary {
            background-color: #8AD144!important;
            border-color: #8AD144!important;
        }

        #petSize .btn.btn-default {
            background-color: #8AD144!important;
            border-color: #8AD144!important;
        }

    </style>
    <script>
        $(document).ready(function () {


            // alert(${login});
            if ('${login}' == "false") {
                $('#wrongPasswordModal').modal('show');
            }
            console.log("who" + '${userInfo.partner}');
            if ('${partner}' == 'hotel') {
                $("#bookNow").hide();
                $("#noForHotel2").hide();

            }
        });
        var flag = 0;
        var newPetGender = "Male", newPetSize = "5-10 kg", isNewPetVaccinated = "No";
        var hotelIdLocal = localStorage.getItem("hotelId");
        console.log("id===========" + hotelIdLocal);

        var isSignIn = 0;
        var type = '${search.petType}';
        var dateMin;
        var dateMax;
        var petList = [];
        var chosenPet;
        var addedServices = [];
        $(document).ready(function () {
            $('#genderDefault').trigger('click');
            $('#sizeDefault').trigger('click');
        <d:choose>
            <d:when test="${result.equals('success')}">
            $('#signupEmail').modal('show');
            </d:when>
            <d:when test="${verify.equals('success')}">
            $('#signupVerifymail').modal('show');
            </d:when>
            <d:when test="${verify.equals('failed')}">
            $('#signupVerifymailFailed').modal('show');
            </d:when>
            <d:when test="${resultPassword.equals('success')}">
            $('#resetPasswordSendMailOK').modal('show');
            </d:when>
            <d:when test="${resultPassword.equals('failed')}">
            $('#resetPasswordSendMailFailed').modal('show');
            </d:when>
            <d:when test="${resultPassword.equals('done')}">
            $('#resetPasswordSuccess').modal('show');
            </d:when>
        </d:choose>
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
                if (${fn:length(petList)} > 0) {
                    $("#bookNow").attr("data-target", "#servicesModal");
                    chosenPet = petList[0];
                    console.log("chosenPet" + JSON.stringify(chosenPet));
                    $("#addPetButton").css("display", "none");
                    $("#selectPetButton").css("display", "block");
                } else {
                    $("#bookNow").attr("data-target", "#petInfoForm");


                    console.log("chosenPet" + JSON.stringify(chosenPet));

                }
            } else {
                $("#bookNow").attr("data-target", "#signinForm");
                $('#petInfoModalButton').text("NEXT");
                $("#petInfoModalButton").attr("data-target", "#");
                $("#addPetButtonTarget").attr("data-target", "#signinForm");
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
                    var serviceNamePrice = serviceName + ":" + servicePrice.replace("€", "");
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
                    $('#petInfoForm').show();
                }
                function selectedPet() {
                    $("#selectPet :selected").text(); // The text content of the selected option
                    $("#selectPet :selected").val();
                    var whichPet = $("#selectPet :selected").val(); // The value of the selected option

                    chosenPet = petList[whichPet];
                    console.log("chosenPETTT" + chosenPet.petName);
                }
                function dateFormat(date) {
                    var mydate = new Date(date);
                    var month = ["Jan", "Feb", "March", "Apr", "May", "June",
                        "July", "Aug", "Sep", "Oct", "Novr", "Dec"][mydate.getMonth()];
                    var str = mydate.getDate() + ' ' + month + ', ' + mydate.getFullYear();
                    return str;
                }

                function book() {

                    var hotelIdLocal = localStorage.getItem("hotelId");
                    var totalPrice = document.getElementById("serviceTotal").innerText;
                    totalPrice = totalPrice.replace("€", "");
                    localStorage.getItem("hotelId");
                    console.log("booking" + document.getElementById("checkin").value + " " + document.getElementById("checkout").value + " " + document.getElementById("serviceTotal").innerText + "id" + hotelIdLocal + " " + '${hotel.propertyName}');
                    var stringServices = "";
                    var boardingPrice = document.getElementById("boardingPrice").innerHTML;
                    boardingPrice = boardingPrice.substring(1);
                    console.log("xx" + boardingPrice);

                    addedServices.push("Boarding:" + boardingPrice + " " + document.getElementById("boardingService").innerHTML);
                    for (var i = 0; i < addedServices.length; i++) {

                        stringServices += "," + addedServices[i];
                    }

                    stringServices = stringServices.substring(1);

                    var reservation = {
                        "checkIn": dateFormat(document.getElementById("checkin").value),
                        "checkOut": dateFormat(document.getElementById("checkout").value),
                        "service": stringServices,
                        "totalPrice": totalPrice,
                        "hotelId": hotelIdLocal,
                        "hotelName": '${hotel.propertyName}',
                        "petOwnerId": chosenPet.userId,
                        "petOwnerName": '${userInfo.name} ${userInfo.surname}  ',
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

                function addPet() {
                    var name = document.getElementById("newPetName").value;
                    var type = document.getElementById("newPetType").value;
                    var breed = document.getElementById("newPetBreed").value;
                    var age = document.getElementById("newPetAge").value;

                    var pet = {
                        "userId": "-",
                        "name": name,
                        "petType": type,
                        "breed": breed,
                        "gender": newPetGender,
                        "age": parseInt(age),
                        "petSize": newPetSize,
                        "vaccination": isNewPetVaccinated,
                        "microchipNo": "-",
                        "allergies": "-",
                        "underMedication": "-",
                        "eatingRoutine": "-",
                        "sleepingPlace": "-",
                        "neuteredStreilized": "-",
                        "friendly": "-",
                        "getAlongChildren": "-",
                    };
                    console.log("Test" + JSON.stringify(pet));
                    console.log("Pet added");
                    $('#addPetQuick').val(JSON.stringify(pet));
                    $('#hotelIdInput').val(hotelIdLocal);

                    //   $("#addPet").submit();

                }
                function showBreed() {
                    var type = document.getElementById("newPetType").value;
                    console.log("changd" + type);
                    if (type == 'Dog') {
                        document.getElementById("newPetBreed").innerHTML = '<option value="Affenpinscher">Affenpinscher</option> <option value="Afghan Hound">Afghan Hound</option> <option value="Airedale Terrier">Airedale Terrier</option> <option value="Akita">Akita</option> <option value="Alaskan Klee Kai">Alaskan Klee Kai</option> <option value="Alaskan Malamute">Alaskan Malamute</option> <option value="American Bulldog">American Bulldog</option> <option value="American English Coonhound">American English Coonhound</option> <option value="American Eskimo Dog">American Eskimo Dog</option> <option value="American Foxhound">American Foxhound</option> <option value="American Pit Bull Terrier">American Pit Bull Terrier</option> <option value="American Staffordshire Terrier">American Staffordshire Terrier</option> <option value="American Water Spaniel">American Water Spaniel</option> <option value="Anatolian Shepherd Dog">Anatolian Shepherd Dog</option> <option value="Appenzeller Sennenhunde">Appenzeller Sennenhunde</option> <option value="Australian Cattle Dog">Australian Cattle Dog</option> <option value="Australian Kelpie">Australian Kelpie</option> <option value="Australian Shepherd">Australian Shepherd</option> <option value="Australian Terrier">Australian Terrier</option> <option value="Azawakh">Azawakh</option> <option value="Barbet">Barbet</option> <option value="Basenji">Basenji</option> <option value="Basset Hound">Basset Hound</option> <option value="Beagle">Beagle</option> <option value="Bearded Collie">Bearded Collie</option> <option value="Bedlington Terrier">Bedlington Terrier</option> <option value="Belgian Malinois">Belgian Malinois</option> <option value="Belgian Sheepdog">Belgian Sheepdog</option> <option value="Belgian Tervuren">Belgian Tervuren</option> <option value="Berger Picard">Berger Picard</option> <option value="Bernedoodle">Bernedoodle</option> <option value="Bernese Mountain Dog">Bernese Mountain Dog</option> <option value="Bichon Frise">Bichon Frise</option> <option value="Black and Tan Coonhound">Black and Tan Coonhound</option> <option value="Black Mouth Cur">Black Mouth Cur</option> <option value="Black Russian Terrier">Black Russian Terrier</option> <option value="Bloodhound">Bloodhound</option> <option value="Blue Lacy">Blue Lacy</option> <option value="Bluetick Coonhound">Bluetick Coonhound</option> <option value="Boerboel">Boerboel</option> <option value="Bolognese">Bolognese</option> <option value="Border Collie">Border Collie</option> <option value="Border Terrier">Border Terrier</option> <option value="Borzoi">Borzoi</option> <option value="Boston Terrier">Boston Terrier</option> <option value="Bouvier des Flandres">Bouvier des Flandres</option> <option value="Boxer">Boxer</option> <option value="Boykin Spaniel">Boykin Spaniel</option> <option value="Bracco Italiano">Bracco Italiano</option> <option value="Briard">Briard</option> <option value="Brittany">Brittany</option> <option value="Brussels Griffon">Brussels Griffon</option> <option value="Bull Terrier">Bull Terrier</option> <option value="Bulldog">Bulldog</option> <option value="Bullmastiff">Bullmastiff</option> <option value="Cairn Terrier">Cairn Terrier</option> <option value="Canaan Dog">Canaan Dog</option> <option value="Cane Corso">Cane Corso</option> <option value="Cardigan Welsh Corgi">Cardigan Welsh Corgi</option> <option value="Catahoula Leopard Dog">Catahoula Leopard Dog</option> <option value="Caucasian Shepherd Dog">Caucasian Shepherd Dog</option> <option value="Cavalier King Charles Spaniel">Cavalier King Charles Spaniel</option> <option value="Cesky Terrier">Cesky Terrier</option> <option value="Chesapeake Bay Retriever">Chesapeake Bay Retriever</option> <option value="Chihuahua">Chihuahua</option> <option value="Chinese Crested">Chinese Crested</option> <option value="Chinese Shar-Pei">Chinese Shar-Pei</option> <option value="Chinook">Chinook</option> <option value="Chow Chow">Chow Chow</option> <option value="Clumber Spaniel">Clumber Spaniel</option> <option value="Cockapoo">Cockapoo</option> <option value="Cocker Spaniel">Cocker Spaniel</option> <option value="Collie">Collie</option> <option value="Coton de Tulear">Coton de Tulear</option> <option value="Curly-Coated Retriever">Curly-Coated Retriever</option> <option value="Dachshund">Dachshund</option> <option value="Dalmatian">Dalmatian</option> <option value="Dandie Dinmont Terrier">Dandie Dinmont Terrier</option> <option value="Doberman Pinscher">Doberman Pinscher</option> <option value="Dogo Argentino">Dogo Argentino</option> <option value="Dogue de Bordeaux">Dogue de Bordeaux</option> <option value="Dutch Shepherd">Dutch Shepherd</option> <option value="English Cocker Spaniel">English Cocker Spaniel</option> <option value="English Foxhound">English Foxhound</option> <option value="English Setter">English Setter</option> <option value="English Springer Spaniel">English Springer Spaniel</option> <option value="English Toy Spaniel">English Toy Spaniel</option> <option value="Entlebucher Mountain Dog">Entlebucher Mountain Dog</option> <option value="Field Spaniel">Field Spaniel</option> <option value="Finnish Lapphund">Finnish Lapphund</option> <option value="Finnish Spitz">Finnish Spitz</option> <option value="Flat-Coated Retriever">Flat-Coated Retriever</option> <option value="Fox Terrier">Fox Terrier</option> <option value="French Bulldog">French Bulldog</option> <option value="German Pinscher">German Pinscher</option> <option value="German Shepherd Dog">German Shepherd Dog</option> <option value="German Shorthaired Pointer">German Shorthaired Pointer</option> <option value="German Wirehaired Pointer">German Wirehaired Pointer</option> <option value="Giant Schnauzer">Giant Schnauzer</option> <option value="Glen of Imaal Terrier">Glen of Imaal Terrier</option> <option value="Goldador">Goldador</option> <option value="Golden Retriever">Golden Retriever</option> <option value="Goldendoodle">Goldendoodle</option> <option value="Gordon Setter">Gordon Setter</option> <option value="Great Dane">Great Dane</option> <option value="Great Pyrenees">Great Pyrenees</option> <option value="Greater Swiss Mountain Dog">Greater Swiss Mountain Dog</option> <option value="Greyhound">Greyhound</option> <option value="Harrier">Harrier</option> <option value="Havanese">Havanese</option> <option value="Ibizan Hound">Ibizan Hound</option> <option value="Icelandic Sheepdog">Icelandic Sheepdog</option> <option value="Irish Red and White Setter">Irish Red and White Setter</option> <option value="Irish Setter">Irish Setter</option> <option value="Irish Terrier">Irish Terrier</option> <option value="Irish Water Spaniel">Irish Water Spaniel</option> <option value="Irish Wolfhound">Irish Wolfhound</option> <option value="Italian Greyhound">Italian Greyhound</option> <option value="Jack Russell Terrier">Jack Russell Terrier</option> <option value="Japanese Chin">Japanese Chin</option> <option value="Japanese Spitz">Japanese Spitz</option> <option value="Karelian Bear Dog">Karelian Bear Dog</option> <option value="Keeshond">Keeshond</option> <option value="Kerry Blue Terrier">Kerry Blue Terrier</option> <option value="Komondor">Komondor</option> <option value="Kooikerhondje">Kooikerhondje</option> <option value="Korean Jindo Dog">Korean Jindo Dog</option> <option value="Kuvasz">Kuvasz</option> <option value="Labradoodle">Labradoodle</option> <option value="Labrador Retriever">Labrador Retriever</option> <option value="Lagotto Romagnolo">Lagotto Romagnolo</option> <option value="Lakeland Terrier">Lakeland Terrier</option> <option value="Lancashire Heeler">Lancashire Heeler</option> <option value="Leonberger">Leonberger</option> <option value="Lhasa Apso">Lhasa Apso</option> <option value="Lowchen">Lowchen</option> <option value="Maltese">Maltese</option> <option value="Maltese Shih Tzu">Maltese Shih Tzu</option> <option value="Maltipoo">Maltipoo</option> <option value="Manchester Terrier">Manchester Terrier</option> <option value="Mastiff">Mastiff</option> <option value="Miniature Pinscher">Miniature Pinscher</option> <option value="Miniature Schnauzer">Miniature Schnauzer</option> <option value="Mudi">Mudi</option> <option value="Mutt">Mutt</option> <option value="Neapolitan Mastiff">Neapolitan Mastiff</option> <option value="Newfoundland">Newfoundland</option> <option value="Norfolk Terrier">Norfolk Terrier</option> <option value="Norwegian Buhund">Norwegian Buhund</option> <option value="Norwegian Elkhound">Norwegian Elkhound</option> <option value="Norwegian Lundehund">Norwegian Lundehund</option> <option value="Norwich Terrier">Norwich Terrier</option> <option value="Nova Scotia Duck Tolling Retriever">Nova Scotia Duck Tolling Retriever</option> <option value="Old English Sheepdog">Old English Sheepdog</option> <option value="Otterhound">Otterhound</option> <option value="Papillon">Papillon</option> <option value="Peekapoo">Peekapoo</option> <option value="Pekingese">Pekingese</option> <option value="Pembroke Welsh Corgi">Pembroke Welsh Corgi</option> <option value="Petit Basset Griffon Vendeen">Petit Basset Griffon Vendeen</option> <option value="Pharaoh Hound">Pharaoh Hound</option> <option value="Plott">Plott</option> <option value="Pocket Beagle">Pocket Beagle</option> <option value="Pointer">Pointer</option> <option value="Polish Lowland Sheepdog">Polish Lowland Sheepdog</option> <option value="Pomeranian">Pomeranian</option> <option value="Pomsky">Pomsky</option> <option value="Poodle">Poodle</option> <option value="Portuguese Water Dog">Portuguese Water Dog</option> <option value="Pug">Pug</option> <option value="Puggle">Puggle</option> <option value="Puli">Puli</option> <option value="Pyrenean Shepherd">Pyrenean Shepherd</option> <option value="Rat Terrier">Rat Terrier</option> <option value="Redbone Coonhound">Redbone Coonhound</option> <option value="Rhodesian Ridgeback">Rhodesian Ridgeback</option> <option value="Rottweiler">Rottweiler</option> <option value="Saint Bernard">Saint Bernard</option> <option value="Saluki">Saluki</option> <option value="Samoyed">Samoyed</option> <option value="Schipperke">Schipperke</option> <option value="Schnoodle">Schnoodle</option> <option value="Scottish Deerhound">Scottish Deerhound</option> <option value="Scottish Terrier">Scottish Terrier</option> <option value="Sealyham Terrier">Sealyham Terrier</option> <option value="Shetland Sheepdog">Shetland Sheepdog</option> <option value="Shiba Inu">Shiba Inu</option> <option value="Shih Tzu">Shih Tzu</option> <option value="Siberian Husky">Siberian Husky</option> <option value="Silken Windhound">Silken Windhound</option> <option value="Silky Terrier">Silky Terrier</option> <option value="Skye Terrier">Skye Terrier</option> <option value="Sloughi">Sloughi</option> <option value="Small Munsterlander Pointer">Small Munsterlander Pointer</option> <option value="Soft Coated Wheaten Terrier">Soft Coated Wheaten Terrier</option> <option value="Stabyhoun">Stabyhoun</option> <option value="Staffordshire Bull Terrier">Staffordshire Bull Terrier</option> <option value="Standard Schnauzer">Standard Schnauzer</option> <option value="Sussex Spaniel">Sussex Spaniel</option> <option value="Swedish Vallhund">Swedish Vallhund</option> <option value="Tibetan Mastiff">Tibetan Mastiff</option> <option value="Tibetan Spaniel">Tibetan Spaniel</option> <option value="Tibetan Terrier">Tibetan Terrier</option> <option value="Toy Fox Terrier">Toy Fox Terrier</option> <option value="Treeing Tennessee Brindle">Treeing Tennessee Brindle</option> <option value="Treeing Walker Coonhound">Treeing Walker Coonhound</option> <option value="Vizsla">Vizsla</option> <option value="Weimaraner">Weimaraner</option> <option value="Welsh Springer Spaniel">Welsh Springer Spaniel</option> <option value="Welsh Terrier">Welsh Terrier</option> <option value="West Highland White Terrier">West Highland White Terrier</option> <option value="Whippet">Whippet</option> <option value="Wirehaired Pointing Griffon">Wirehaired Pointing Griffon</option> <option value="Xoloitzcuintli">Xoloitzcuintli</option> <option value="Yorkipoo">Yorkipoo</option> <option value="Yorkshire Terrier">Yorkshire Terrier</option>';
                    } else if (type == 'Cat') {
                        document.getElementById("newPetBreed").innerHTML = '<option value="Abyssinian">Abyssinian</option> <option value="American Bobtail">American Bobtail</option> <option value="American Curl">American Curl</option> <option value="American Shorthair">American Shorthair</option> <option value="American Wirehair">American Wirehair</option> <option value="Balinese">Balinese</option> <option value="Bengal Cats">Bengal Cats</option> <option value="Birman">Birman</option> <option value="Bombay">Bombay</option> <option value="British Shorthair">British Shorthair</option> <option value="Burmese">Burmese</option> <option value="Burmilla">Burmilla</option> <option value="Chartreux">Chartreux</option> <option value="Chinese Li Hua">Chinese Li Hua</option> <option value="Colorpoint Shorthair">Colorpoint Shorthair</option> <option value="Cornish Rex">Cornish Rex</option> <option value="Cymric">Cymric</option> <option value="Devon Rex">Devon Rex</option> <option value="Egyptian Mau">Egyptian Mau</option> <option value="European Burmese">European Burmese</option> <option value="Exotic">Exotic</option> <option value="Havana Brown">Havana Brown</option> <option value="Himalayan">Himalayan</option> <option value="Japanese Bobtail">Japanese Bobtail</option> <option value="Javanese">Javanese</option> <option value="Korat">Korat</option> <option value="LaPerm">LaPerm</option> <option value="Maine Coon">Maine Coon</option> <option value="Manx">Manx</option> <option value="Nebelung">Nebelung</option> <option value="Norwegian Forest">Norwegian Forest</option> <option value="Ocicat">Ocicat</option> <option value="Oriental">Oriental</option> <option value="Persian">Persian</option> <option value="Pixie-Bob">Pixie-Bob</option> <option value="Ragamuffin">Ragamuffin</option> <option value="Ragdoll Cats">Ragdoll Cats</option> <option value="Russian Blue">Russian Blue</option> <option value="Savannah">Savannah</option> <option value="Scottish Fold">Scottish Fold</option> <option value="Selkirk Rex">Selkirk Rex</option> <option value="Siamese Cat">Siamese Cat</option> <option value="Siberian">Siberian</option> <option value="Singapura">Singapura</option> <option value="Snowshoe">Snowshoe</option> <option value="Somali">Somali</option> <option value="Sphynx">Sphynx</option> <option value="Tonkinese">Tonkinese</option> <option value="Turkish Angora">Turkish Angora</option> <option value="Turkish Van">Turkish Van</option>';
                    }
                }
                function whichGender(g) {
                    newPetGender = g;
                    console.log(newPetGender);
                }
                function whichSize(s) {
                    newPetSize = s;
                    console.log(newPetSize);
                }
                function isVaccinated() {
                    console.log("first" + isNewPetVaccinated)
                    if (flag == 0) {
                        isNewPetVaccinated = "Yes";
                        flag = 1;
                    } else {
                        isNewPetVaccinated = "No";
                        flag = 0;
                    }
                    console.log("Second" + isNewPetVaccinated)
                }


    </script>
    <body>
        <!-- Page Preloder -->
        <div id="preloder">
            <div class="loader"></div>
        </div>

        <jsp:include page="header.jsp"></jsp:include>


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
                                    <div id="noForHotel1">
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
                                            <input type="text" onchange="getDiff();
                                                    minOut()" id="checkout" name="checkout" class="col-5 align-self-end" placeholder="Check out" required="required">
                                        </div>
                                        <br>
                                    </div>
                                    <div id="noForHotel2">
                                        <p>Pet</p>
                                        <div id="addPetButton" style="display: block">
                                            <br>
                                            <span style="margin-right:10px">Add a pet</span>
                                            <a   id="addPetButtonTarget" data-dismiss="modal" data-toggle="modal" data-target="#petInfoForm" class="blue-gradient  btn-sm">
                                                <i class="fa fa-plus text-white"></i>
                                            </a> 
                                        </div>
                                        <div id="selectPetButton" style="display: none">
                                            <select onchange="selectedPet()" id="selectPet" class="browser-default custom-select">

                                            </select>
                                        </div>                      
                                        <br>
                                    </div>
                                    <div id="noForHotel3">
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
                                    <a href="" id="bookNow" class="site-btn list-btn" data-toggle="modal"  data-target="#petInfoForm">Book Now!</a>
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
                                    <div class="modal fade" data-keyboard="false" data-backdrop="static" id="petInfoForm"  tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                        <div class="modal-dialog" role="document">
                                            <!--Content-->
                                            <div class="modal-content form-elegant">
                                                <!--Header-->
                                                <div class="modal-header text-center">
                                                    <h3 class="modal-title w-100 dark-grey-text font-weight-bold my-3" id="myModalLabel" style="margin-left: 30px;"><strong>Add a pet</strong></h3>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <!--Body-->
                                                <div class="modal-body mx-4">
                                                    <!--Body-->

                                                    <br>
                                                    <form id="addPet" action="addPetQuick" method="POST">

                                                        <div><button style="display:none" onclick="addPet()" id="send" type="submit" class="booking_button trans_200">Book Now</button></div>
                                                        <div class="md-form">
                                                            <input id="newPetName"  required="required" placeholder="Pet Name" type="text" name="name" class="form-control validate">
                                                            <label data-error="wrong" data-success="right"></label>
                                                        </div>

                                                        <select id="newPetType" onchange="showBreed()" id="catDogType" class="browser-default custom-select" > 
                                                            <option value="Dog">Dog</option> 
                                                            <option value="Cat">Cat</option>
                                                        </select>
                                                        <br>
                                                        <select id="newPetBreed" class="browser-default custom-select">

                                                            <option value="Affenpinscher">Affenpinscher</option>
                                                            <option value="Afghan Hound">Afghan Hound</option>
                                                            <option value="Airedale Terrier">Airedale Terrier</option>
                                                            <option value="Akita">Akita</option>
                                                            <option value="Alaskan Klee Kai">Alaskan Klee Kai</option>
                                                            <option value="Alaskan Malamute">Alaskan Malamute</option>
                                                            <option value="American Bulldog">American Bulldog</option>
                                                            <option value="American English Coonhound">American English Coonhound</option>
                                                            <option value="American Eskimo Dog">American Eskimo Dog</option>
                                                            <option value="American Foxhound">American Foxhound</option>
                                                            <option value="American Pit Bull Terrier">American Pit Bull Terrier</option>
                                                            <option value="American Staffordshire Terrier">American Staffordshire Terrier</option>
                                                            <option value="American Water Spaniel">American Water Spaniel</option>
                                                            <option value="Anatolian Shepherd Dog">Anatolian Shepherd Dog</option>
                                                            <option value="Appenzeller Sennenhunde">Appenzeller Sennenhunde</option>
                                                            <option value="Australian Cattle Dog">Australian Cattle Dog</option>
                                                            <option value="Australian Kelpie">Australian Kelpie</option>
                                                            <option value="Australian Shepherd">Australian Shepherd</option>
                                                            <option value="Australian Terrier">Australian Terrier</option>
                                                            <option value="Azawakh">Azawakh</option>
                                                            <option value="Barbet">Barbet</option>
                                                            <option value="Basenji">Basenji</option>
                                                            <option value="Basset Hound">Basset Hound</option>
                                                            <option value="Beagle">Beagle</option>
                                                            <option value="Bearded Collie">Bearded Collie</option>
                                                            <option value="Bedlington Terrier">Bedlington Terrier</option>
                                                            <option value="Belgian Malinois">Belgian Malinois</option>
                                                            <option value="Belgian Sheepdog">Belgian Sheepdog</option>
                                                            <option value="Belgian Tervuren">Belgian Tervuren</option>
                                                            <option value="Berger Picard">Berger Picard</option>
                                                            <option value="Bernedoodle">Bernedoodle</option>
                                                            <option value="Bernese Mountain Dog">Bernese Mountain Dog</option>
                                                            <option value="Bichon Frise">Bichon Frise</option>
                                                            <option value="Black and Tan Coonhound">Black and Tan Coonhound</option>
                                                            <option value="Black Mouth Cur">Black Mouth Cur</option>
                                                            <option value="Black Russian Terrier">Black Russian Terrier</option>
                                                            <option value="Bloodhound">Bloodhound</option>
                                                            <option value="Blue Lacy">Blue Lacy</option>
                                                            <option value="Bluetick Coonhound">Bluetick Coonhound</option>
                                                            <option value="Boerboel">Boerboel</option>
                                                            <option value="Bolognese">Bolognese</option>
                                                            <option value="Border Collie">Border Collie</option>
                                                            <option value="Border Terrier">Border Terrier</option>
                                                            <option value="Borzoi">Borzoi</option>
                                                            <option value="Boston Terrier">Boston Terrier</option>
                                                            <option value="Bouvier des Flandres">Bouvier des Flandres</option>
                                                            <option value="Boxer">Boxer</option>
                                                            <option value="Boykin Spaniel">Boykin Spaniel</option>
                                                            <option value="Bracco Italiano">Bracco Italiano</option>
                                                            <option value="Briard">Briard</option>
                                                            <option value="Brittany">Brittany</option>
                                                            <option value="Brussels Griffon">Brussels Griffon</option>
                                                            <option value="Bull Terrier">Bull Terrier</option>
                                                            <option value="Bulldog">Bulldog</option>
                                                            <option value="Bullmastiff">Bullmastiff</option>
                                                            <option value="Cairn Terrier">Cairn Terrier</option>
                                                            <option value="Canaan Dog">Canaan Dog</option>
                                                            <option value="Cane Corso">Cane Corso</option>
                                                            <option value="Cardigan Welsh Corgi">Cardigan Welsh Corgi</option>
                                                            <option value="Catahoula Leopard Dog">Catahoula Leopard Dog</option>
                                                            <option value="Caucasian Shepherd Dog">Caucasian Shepherd Dog</option>
                                                            <option value="Cavalier King Charles Spaniel">Cavalier King Charles Spaniel</option>
                                                            <option value="Cesky Terrier">Cesky Terrier</option>
                                                            <option value="Chesapeake Bay Retriever">Chesapeake Bay Retriever</option>
                                                            <option value="Chihuahua">Chihuahua</option>
                                                            <option value="Chinese Crested">Chinese Crested</option>
                                                            <option value="Chinese Shar-Pei">Chinese Shar-Pei</option>
                                                            <option value="Chinook">Chinook</option>
                                                            <option value="Chow Chow">Chow Chow</option>
                                                            <option value="Clumber Spaniel">Clumber Spaniel</option>
                                                            <option value="Cockapoo">Cockapoo</option>
                                                            <option value="Cocker Spaniel">Cocker Spaniel</option>
                                                            <option value="Collie">Collie</option>
                                                            <option value="Coton de Tulear">Coton de Tulear</option>
                                                            <option value="Curly-Coated Retriever">Curly-Coated Retriever</option>
                                                            <option value="Dachshund">Dachshund</option>
                                                            <option value="Dalmatian">Dalmatian</option>
                                                            <option value="Dandie Dinmont Terrier">Dandie Dinmont Terrier</option>
                                                            <option value="Doberman Pinscher">Doberman Pinscher</option>
                                                            <option value="Dogo Argentino">Dogo Argentino</option>
                                                            <option value="Dogue de Bordeaux">Dogue de Bordeaux</option>
                                                            <option value="Dutch Shepherd">Dutch Shepherd</option>
                                                            <option value="English Cocker Spaniel">English Cocker Spaniel</option>
                                                            <option value="English Foxhound">English Foxhound</option>
                                                            <option value="English Setter">English Setter</option>
                                                            <option value="English Springer Spaniel">English Springer Spaniel</option>
                                                            <option value="English Toy Spaniel">English Toy Spaniel</option>
                                                            <option value="Entlebucher Mountain Dog">Entlebucher Mountain Dog</option>
                                                            <option value="Field Spaniel">Field Spaniel</option>
                                                            <option value="Finnish Lapphund">Finnish Lapphund</option>
                                                            <option value="Finnish Spitz">Finnish Spitz</option>
                                                            <option value="Flat-Coated Retriever">Flat-Coated Retriever</option>
                                                            <option value="Fox Terrier">Fox Terrier</option>
                                                            <option value="French Bulldog">French Bulldog</option>
                                                            <option value="German Pinscher">German Pinscher</option>
                                                            <option value="German Shepherd Dog">German Shepherd Dog</option>
                                                            <option value="German Shorthaired Pointer">German Shorthaired Pointer</option>
                                                            <option value="German Wirehaired Pointer">German Wirehaired Pointer</option>
                                                            <option value="Giant Schnauzer">Giant Schnauzer</option>
                                                            <option value="Glen of Imaal Terrier">Glen of Imaal Terrier</option>
                                                            <option value="Goldador">Goldador</option>
                                                            <option value="Golden Retriever">Golden Retriever</option>
                                                            <option value="Goldendoodle">Goldendoodle</option>
                                                            <option value="Gordon Setter">Gordon Setter</option>
                                                            <option value="Great Dane">Great Dane</option>
                                                            <option value="Great Pyrenees">Great Pyrenees</option>
                                                            <option value="Greater Swiss Mountain Dog">Greater Swiss Mountain Dog</option>
                                                            <option value="Greyhound">Greyhound</option>
                                                            <option value="Harrier">Harrier</option>
                                                            <option value="Havanese">Havanese</option>
                                                            <option value="Ibizan Hound">Ibizan Hound</option>
                                                            <option value="Icelandic Sheepdog">Icelandic Sheepdog</option>
                                                            <option value="Irish Red and White Setter">Irish Red and White Setter</option>
                                                            <option value="Irish Setter">Irish Setter</option>
                                                            <option value="Irish Terrier">Irish Terrier</option>
                                                            <option value="Irish Water Spaniel">Irish Water Spaniel</option>
                                                            <option value="Irish Wolfhound">Irish Wolfhound</option>
                                                            <option value="Italian Greyhound">Italian Greyhound</option>
                                                            <option value="Jack Russell Terrier">Jack Russell Terrier</option>
                                                            <option value="Japanese Chin">Japanese Chin</option>
                                                            <option value="Japanese Spitz">Japanese Spitz</option>
                                                            <option value="Karelian Bear Dog">Karelian Bear Dog</option>
                                                            <option value="Keeshond">Keeshond</option>
                                                            <option value="Kerry Blue Terrier">Kerry Blue Terrier</option>
                                                            <option value="Komondor">Komondor</option>
                                                            <option value="Kooikerhondje">Kooikerhondje</option>
                                                            <option value="Korean Jindo Dog">Korean Jindo Dog</option>
                                                            <option value="Kuvasz">Kuvasz</option>
                                                            <option value="Labradoodle">Labradoodle</option>
                                                            <option value="Labrador Retriever">Labrador Retriever</option>
                                                            <option value="Lagotto Romagnolo">Lagotto Romagnolo</option>
                                                            <option value="Lakeland Terrier">Lakeland Terrier</option>
                                                            <option value="Lancashire Heeler">Lancashire Heeler</option>
                                                            <option value="Leonberger">Leonberger</option>
                                                            <option value="Lhasa Apso">Lhasa Apso</option>
                                                            <option value="Lowchen">Lowchen</option>
                                                            <option value="Maltese">Maltese</option>
                                                            <option value="Maltese Shih Tzu">Maltese Shih Tzu</option>
                                                            <option value="Maltipoo">Maltipoo</option>
                                                            <option value="Manchester Terrier">Manchester Terrier</option>
                                                            <option value="Mastiff">Mastiff</option>
                                                            <option value="Miniature Pinscher">Miniature Pinscher</option>
                                                            <option value="Miniature Schnauzer">Miniature Schnauzer</option>
                                                            <option value="Mudi">Mudi</option>
                                                            <option value="Mutt">Mutt</option>
                                                            <option value="Neapolitan Mastiff">Neapolitan Mastiff</option>
                                                            <option value="Newfoundland">Newfoundland</option>
                                                            <option value="Norfolk Terrier">Norfolk Terrier</option>
                                                            <option value="Norwegian Buhund">Norwegian Buhund</option>
                                                            <option value="Norwegian Elkhound">Norwegian Elkhound</option>
                                                            <option value="Norwegian Lundehund">Norwegian Lundehund</option>
                                                            <option value="Norwich Terrier">Norwich Terrier</option>
                                                            <option value="Nova Scotia Duck Tolling Retriever">Nova Scotia Duck Tolling Retriever</option>
                                                            <option value="Old English Sheepdog">Old English Sheepdog</option>
                                                            <option value="Otterhound">Otterhound</option>
                                                            <option value="Papillon">Papillon</option>
                                                            <option value="Peekapoo">Peekapoo</option>
                                                            <option value="Pekingese">Pekingese</option>
                                                            <option value="Pembroke Welsh Corgi">Pembroke Welsh Corgi</option>
                                                            <option value="Petit Basset Griffon Vendeen">Petit Basset Griffon Vendeen</option>
                                                            <option value="Pharaoh Hound">Pharaoh Hound</option>
                                                            <option value="Plott">Plott</option>
                                                            <option value="Pocket Beagle">Pocket Beagle</option>
                                                            <option value="Pointer">Pointer</option>
                                                            <option value="Polish Lowland Sheepdog">Polish Lowland Sheepdog</option>
                                                            <option value="Pomeranian">Pomeranian</option>
                                                            <option value="Pomsky">Pomsky</option>
                                                            <option value="Poodle">Poodle</option>
                                                            <option value="Portuguese Water Dog">Portuguese Water Dog</option>
                                                            <option value="Pug">Pug</option>
                                                            <option value="Puggle">Puggle</option>
                                                            <option value="Puli">Puli</option>
                                                            <option value="Pyrenean Shepherd">Pyrenean Shepherd</option>
                                                            <option value="Rat Terrier">Rat Terrier</option>
                                                            <option value="Redbone Coonhound">Redbone Coonhound</option>
                                                            <option value="Rhodesian Ridgeback">Rhodesian Ridgeback</option>
                                                            <option value="Rottweiler">Rottweiler</option>
                                                            <option value="Saint Bernard">Saint Bernard</option>
                                                            <option value="Saluki">Saluki</option>
                                                            <option value="Samoyed">Samoyed</option>
                                                            <option value="Schipperke">Schipperke</option>
                                                            <option value="Schnoodle">Schnoodle</option>
                                                            <option value="Scottish Deerhound">Scottish Deerhound</option>
                                                            <option value="Scottish Terrier">Scottish Terrier</option>
                                                            <option value="Sealyham Terrier">Sealyham Terrier</option>
                                                            <option value="Shetland Sheepdog">Shetland Sheepdog</option>
                                                            <option value="Shiba Inu">Shiba Inu</option>
                                                            <option value="Shih Tzu">Shih Tzu</option>
                                                            <option value="Siberian Husky">Siberian Husky</option>
                                                            <option value="Silken Windhound">Silken Windhound</option>
                                                            <option value="Silky Terrier">Silky Terrier</option>
                                                            <option value="Skye Terrier">Skye Terrier</option>
                                                            <option value="Sloughi">Sloughi</option>
                                                            <option value="Small Munsterlander Pointer">Small Munsterlander Pointer</option>
                                                            <option value="Soft Coated Wheaten Terrier">Soft Coated Wheaten Terrier</option>
                                                            <option value="Stabyhoun">Stabyhoun</option>
                                                            <option value="Staffordshire Bull Terrier">Staffordshire Bull Terrier</option>
                                                            <option value="Standard Schnauzer">Standard Schnauzer</option>
                                                            <option value="Sussex Spaniel">Sussex Spaniel</option>
                                                            <option value="Swedish Vallhund">Swedish Vallhund</option>
                                                            <option value="Tibetan Mastiff">Tibetan Mastiff</option>
                                                            <option value="Tibetan Spaniel">Tibetan Spaniel</option>
                                                            <option value="Tibetan Terrier">Tibetan Terrier</option>
                                                            <option value="Toy Fox Terrier">Toy Fox Terrier</option>
                                                            <option value="Treeing Tennessee Brindle">Treeing Tennessee Brindle</option>
                                                            <option value="Treeing Walker Coonhound">Treeing Walker Coonhound</option>
                                                            <option value="Vizsla">Vizsla</option>
                                                            <option value="Weimaraner">Weimaraner</option>
                                                            <option value="Welsh Springer Spaniel">Welsh Springer Spaniel</option>
                                                            <option value="Welsh Terrier">Welsh Terrier</option>
                                                            <option value="West Highland White Terrier">West Highland White Terrier</option>
                                                            <option value="Whippet">Whippet</option>
                                                            <option value="Wirehaired Pointing Griffon">Wirehaired Pointing Griffon</option>
                                                            <option value="Xoloitzcuintli">Xoloitzcuintli</option>
                                                            <option value="Yorkipoo">Yorkipoo</option>
                                                            <option value="Yorkshire Terrier">Yorkshire Terrier</option>


                                                        </select>
                                                        <div class="md-form">
                                                            <input id="newPetAge" required="required" placeholder="Age" type="number" name="age" class="form-control validate">
                                                            <label data-error="wrong" data-success="right" ></label>
                                                        </div>
                                                        <div class="md-form">
                                                            <div class="row">
                                                                <div class="col-md-4 col-sm-12 col-xs-12">
                                                                    <h5 class="h5-responsive"><strong>Gender</strong></h5>
                                                                </div>
                                                                <div class="col-md-8 col-sm-12 col-xs-12" style="margin-top:-12px">

                                                                    <!-- Default inline 1-->
                                                                    <div style="margin-left:25px" class="custom-control custom-radio custom-control-inline">
                                                                        <input type="radio" class="custom-control-input" id="defaultInline1" name="inlineDefaultRadiosExample">
                                                                        <label class="custom-control-label" id="genderDefault" onclick="whichGender('Male')" for="defaultInline1">Male</label>
                                                                    </div>

                                                                    <!-- Default inline 2-->
                                                                    <div class="custom-control custom-radio custom-control-inline" style="margin-left: 25px">
                                                                        <input type="radio" class="custom-control-input" onclick="whichGender('Female')" id="defaultInline2" name="inlineDefaultRadiosExample">
                                                                        <label class="custom-control-label" for="defaultInline2">Female</label>
                                                                    </div>


                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="md-form">
                                                            <div class="row">
                                                                <div class="col-md-4 col-sm-12 col-xs-12">
                                                                    <h5 class="h5-responsive"><strong>Vaccination</strong></h5>
                                                                </div>
                                                                <div class="col-md-8 col-sm-12 col-xs-12" style="margin-top:-12px">

                                                                    <!-- Material unchecked -->
                                                                    <div class="form-check">
                                                                        <input onclick="isVaccinated()" type="checkbox" class="form-check-input" id="materialUnchecked">
                                                                        <label class="form-check-label" for="materialUnchecked">Yes</label>
                                                                    </div>
                                                                </div> 
                                                            </div>
                                                        </div>
                                                        <div class="md-form mb-5">

                                                            <div class="row d-flex justify-content-center">

                                                                <!--Grid column-->
                                                                <div class="">

                                                                    <h5><strong>Size</strong></h5>

                                                                </div>
                                                                <!--Grid column-->

                                                            </div>
                                                            <!-- Material inline 1 -->
                                                            <div  class="form-check form-check-inline">
                                                                <input onclick="whichSize('5-10 kg')" type="radio" class="form-check-input" id="materialInline1" name="inlineMaterialRadiosExample">
                                                                <label class="form-check-label" for="materialInline1" >5-10 kg</label>
                                                            </div>

                                                            <!-- Material inline 2 -->
                                                            <div class="form-check form-check-inline">
                                                                <input id="sizeDefault" onclick="whichSize('10-20 kg')" type="radio" class="form-check-input" id="materialInline2" name="inlineMaterialRadiosExample">
                                                                <label class="form-check-label" for="materialInline2">10-20 kg</label>
                                                            </div>

                                                            <!-- Material inline 3 -->
                                                            <div class="form-check form-check-inline">
                                                                <input onclick="whichSize('20-30 kg')" type="radio" class="form-check-input" id="materialInline3" name="inlineMaterialRadiosExample">
                                                                <label class="form-check-label" for="materialInline3">20-30 kg</label>
                                                            </div>

                                                            <!-- Material inline 3 -->
                                                            <div class="form-check form-check-inline">
                                                                <input onclick="whichSize('40+ kg')" type="radio" class="form-check-input" id="materialInline4" name="inlineMaterialRadiosExample">
                                                                <label class="form-check-label" for="materialInline4">40+ kg</label>
                                                            </div>
                                                        </div>
                                                        <div class="text-center mb-3">                              <!--#verifyMail-->
                                                            <button type="button" id="petInfoModalButton" data-dismiss="" data-toggle="modal"  data-target="" class="btn blue-gradient btn-block btn-rounded z-depth-1a" style="font-weight: 500; border-radius: 20px;" onclick="$('#send').trigger('click');">Add</button>

                                                        </div>
                                                        <input hidden id="addPetQuick" name="addPetQuick" value="">
                                                        <input hidden id="hotelIdInput" name="hotelIdInput" value="">
                                                    </form>




                                                </div>

                                            </div>
                                            <!--/.Content-->
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

        <script src="static/plugins/jquery-datepicker/jquery-ui.js"></script>


        <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>


    </body>
</html>
