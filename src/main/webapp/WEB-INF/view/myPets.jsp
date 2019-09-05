<%-- 
    Document   : myPets
    Created on : Jul 10, 2019, 4:37:09 PM
    Author     : burakzengin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Bookingpetz.com</title>

        <!-- Bootstrap -->
        <link href="static/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Font Awesome -->
        <link href="static/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
        <!-- NProgress -->
        <link href="static/vendors/nprogress/nprogress.css" rel="stylesheet">
        <!-- Custom Theme Style -->
        <link href="static/vendors/build/css/custom.min.css" rel="stylesheet">
        <!-- Ajax jquery.min.js -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <!-- Cropper.js -->
        <link href="static/vendors/cropper/dist/cropper.min.css" rel="stylesheet">


    </head>
    <style>


        #imgContainer{
            zoom:100%;
        }  

        @media all and (min-width: 960px) {
            #modalDialogAddPet{
                position: relative;
                display: table; /* <-- This makes the trick */
                overflow-y: auto;    
                overflow-x: auto;
                width:750px;


            }
        }
        @media all and (max-width: 959px) and (min-width: 600px) {
            #modalDialogAddPet{
                position: relative;
                display: table; /* <-- This makes the trick */
                overflow-y: auto;    
                overflow-x: auto;
                max-width:750px;


            }
        }
        @media all and (max-width: 599px) and (min-width: 320px) {
            #modalDialogAddPet{
                position: relative;
                display: table; /* <-- This makes the trick */
                overflow-y: auto;    
                overflow-x: auto;
                max-width:400px;


            }
        }

        #deleteConfirmModal #deleteConfirmDialog{
            max-width: 40% !important;
        }
    </style>
    <script type="text/javascript">
        var petList = new Array();
        $(document).ready(function () {
        <c:forEach var="p" items="${pets}">
            console.log("name222:" + '${p.name}');
            var pet = {
                "id": '${p.id}',
                "name": '${p.name}',
                "petType": '${p.petType}',
                "breed": '${p.breed}',
                "gender": '${p.gender}',
                "age": parseInt('${p.age}'),
                "petSize": '${p.petSize}',
                "microchipNo": '${p.microchipNo}',
                "allergies": '${p.allergies}',
                "underMedication": '${p.underMedication}',
                "eatingRoutine": '${p.eatingRoutine}',
                "sleepingPlace": '${p.sleepingPlace}',
                "neuteredStreilized": '${p.neuteredStreilized}',
                "friendly": '${p.friendly}',
                "getAlongChildren": '${p.getAlongChildren}',
                "vaccination": '${p.vaccination}'
            };
            petList.push(pet);
        </c:forEach>
            var pet = JSON.stringify(petList[0]);
            console.log(pet);
        });
        var dataURI;
        //Open photo picker
        function openPhotoPicker() {
            $('#btnSquare').trigger('click');
            $('#btnUploadClick').trigger('click');
        }

        // Modal
        $(function () {


            var petList = '${pets}';
            if (petList == '[]') {
                console.log("pets::" + petList);
                //  $("#yesPet").css("display", "block");
                //$("#noPet").css("display", "none");
                $('#noPet').show();
                $('#yesPet').hide();
            }


            //Upload image 1 secs after modal opened
            $('#getCroppedCanvasModal').on('show.bs.modal', function () {
                setTimeout(
                        function () {
                            $('#download').trigger('click');
                        }, 1);
            });
            // display if image has a src
            $('#image').load(function () {
                var imageObj = $(this);
                if (!(imageObj.width() == 1 && imageObj.height() == 1)) {
                    console.log('Image source changed');
                    $('#modalCropper').modal('show');
                    document.body.style.zoom = "90%";
                    var image = $('#image').attr('src');
                    $('#image').attr('src', $('#image').attr('src'));
                    //    $('#imgContainer').css("display", "block");
                    setTimeout(
                            function () {
                                //    $('#image').attr('src',image); 
                            }, 500);
                }
            });
        });
        //Convert data from 64b to Blob and upload
        function b64toBlob(dataURI) {

            var byteString = atob(dataURI.split(',')[1]);
            var ab = new ArrayBuffer(byteString.length);
            var ia = new Uint8Array(ab);
            for (var i = 0; i < byteString.length; i++) {
                ia[i] = byteString.charCodeAt(i);
            }
            return new Blob([ab], {type: 'image/jpeg'});
        }

        // get cropped image 
        function addImage() {

            dataURI = document.getElementById("download").href;
            var imgProfile = $("#myImg").attr("src", dataURI);
            imgProfile.attr("width", "250");
            imgProfile.attr("height", "250");
            console.log("dataUri::" + dataURI);
            $('#getCroppedCanvasModal').modal('hide');
            $('#modalCropper').modal('hide');
            //     $('#getCroppedCanvasModal').css("display", "none");


            //   console.log("src::"+img.src);

            //  javascript:location.reload(true)


            //  var blob = b64toBlob(dataURI);
            // reader.readAsDataURL(blob);
        }

        //Read blob and conver to b64 to put image view
        var reader = new FileReader();
        reader.onload = function () {

            var b64Image = reader.result;
            console.log("img was put to img-1" + b64Image);
        };
        /*Notification*/
        function myFunction() {
            var txt = document.getElementById('unvan');
            var txt1 = document.getElementById('yetkili');
            if (txt.value === "" || txt1.value === "")
            {
                new PNotify({
                    title: 'Please (*) fill the blank!',
                    type: 'error',
                    styling: 'bootstrap3'
                });
            }
        }

        var type = "Dog";
        var name = "Nameless";
        var breed = "#";
        var gender = "female";
        var age = "#";
        var vaccination;
        var microchipNo;
        var allergies;
        var underMedication;
        var eatingRoutine;
        var sleepingPlace;
        var neutered;
        var friendly;
        var getAlongChild;
        var size = "#";
        var petImg = "static/images/user.png";
        var id = 0;
        function whichGender(g) {
            gender = g;
        }
        function whichSize(s) {
            size = s;
        }
        function isVaccinated(v) {
            vaccination = v;
        }
        function isNeutered(n) {
            neutered = n;
        }
        function isFriendly(f) {
            friendly = f;
        }
        function isGetAlongChild(c) {
            getAlongChild = c
        }


        function addPet() {
            name = document.getElementById("name").value;
            type = document.getElementById("type").value;
            breed = document.getElementById("breed").value;
            age = document.getElementById("age").value;
            microchipNo = document.getElementById("microchipNo").value;
            allergies = document.getElementById("allergies").value;
            underMedication = document.getElementById("underMedication").value;
            eatingRoutine = document.getElementById("eatingRoutine").value;
            sleepingPlace = document.getElementById("sleepingPlace").value;
            petImg = dataURI;
            console.log(type + " " + name + " " + breed + " " + gender + " " + age + " " + microchipNo + " " + allergies + " " + underMedication + " " + eatingRoutine + " " + sleepingPlace + " " + vaccination + " " + size + " " + neutered + " " + friendly + " " + getAlongChild);
            var pet = JSON.stringify({
                "name": name,
                "petType": type,
                "breed": breed,
                "gender": gender,
                "age": parseInt(age),
                "petSize": size,
                "microchipNo": microchipNo,
                "allergies": allergies,
                "underMedication": underMedication,
                "eatingRoutine": eatingRoutine,
                "sleepingPlace": sleepingPlace,
                "neuteredStreilized": neutered,
                "friendly": friendly,
                "getAlongChildren": getAlongChild,
                "vaccination": vaccination
            });
            console.log("Test" + pet);
            $('#result').val(pet);
            $("#addPet").submit();
        }
        
        var updateId;

        /*EditPet*/
        function editPet(id) {
            updateId = id;
            console.log("ff" + id);
            for (var i = 0; i < petList.length; i++) {

                if (petList[i].id == id) {
                    const petName = petList[i].name;
                    const petBreed = petList[i].breed;
                    const petSize = petList[i].petSize;
                    const petAge = petList[i].age;
                    const petGender = petList[i].gender;
                    const petType = petList[i].petType;
                    const vaccination = petList[i].vaccination;
                    const microchipNo = petList[i].microchipNo;
                    const allergies = petList[i].allergies;
                    const underMedication = petList[i].underMedication;
                    const eatingRoutine = petList[i].eatingRoutine;
                    const sleepingPlace = petList[i].sleepingPlace;
                    const neuteredStreilized = petList[i].neuteredStreilized;
                    const friendly = petList[i].friendly;
                    const getAlongChildren = petList[i].getAlongChildren;

                    document.querySelector('#name1').value = petName;
                    document.querySelector('#breed1').value = petBreed;
                    document.querySelector('#age1').value = petAge;
                    document.querySelector('#type1').value = petType;
                    document.querySelector('#microchipNo1').value = microchipNo;
                    document.querySelector('#allergies1').value = allergies;
                    document.querySelector('#underMedication1').value = underMedication;
                    document.querySelector('#eatingRoutine1').value = eatingRoutine;
                    document.querySelector('#sleepingPlace1').value = sleepingPlace;

                    $('#gender' + petGender).trigger("click");
                    $('#vaccination' + vaccination).trigger("click");
                    $('#size' + petSize).trigger("click");
                    $('#neuteredStreilized' + neuteredStreilized).trigger("click");
                    $('#friendly' + friendly).trigger("click");
                    $('#getAlongChildren' + getAlongChildren).trigger("click");



                    $('#modalEditPet').modal("show");
                }
            }

            //$("#addBtn").css("display", "none");
            //$("#addBtn").attr("onclick", "updatePet();");

        }

        function updatePet() {
            name = document.getElementById("name1").value;
            type = document.getElementById("type1").value;
            breed = document.getElementById("breed1").value;
            age = document.getElementById("age1").value;
            microchipNo = document.getElementById("microchipNo1").value;
            allergies = document.getElementById("allergies1").value;
            underMedication = document.getElementById("underMedication1").value;
            eatingRoutine = document.getElementById("eatingRoutine1").value;
            sleepingPlace = document.getElementById("sleepingPlace1").value;
            petImg = dataURI;
            console.log(type + " " + name + " " + breed + " " + gender + " " + age + " " + microchipNo + " " + allergies + " " + underMedication + " " + eatingRoutine + " " + sleepingPlace + " " + vaccination + " " + size + " " + neutered + " " + friendly + " " + getAlongChild);
            var pet = JSON.stringify({
                "id": updateId,
                "name": name,
                "petType": type,
                "breed": breed,
                "gender": gender,
                "age": parseInt(age),
                "petSize": size,
                "microchipNo": microchipNo,
                "allergies": allergies,
                "underMedication": underMedication,
                "eatingRoutine": eatingRoutine,
                "sleepingPlace": sleepingPlace,
                "neuteredStreilized": neutered,
                "friendly": friendly,
                "getAlongChildren": getAlongChild,
                "vaccination": vaccination
            });
            console.log("Test" + pet);
            $('#resultUpdate').val(pet);
            $("#updatePet").submit();
        }

        function changeButtonType() {
            $('#deleteBtn').attr('type', 'submit');
            $('#deleteBtn').trigger("click");
        }
    </script>
    <body class="nav-md">
        <div class="container body">
            <div class="main_container">
                <jsp:include page="dashboardHeader.jsp"></jsp:include>
                    <div class="right_col" role="main">
                        <div>
                            <div class="page-title">
                                <div class="title_left">
                                    <!-- cropped Canvas -->
                                    <div class="modal fade docs-cropped" id="getCroppedCanvasModal" aria-hidden="true" aria-labelledby="getCroppedCanvasTitle" role="dialog" tabindex="-1">
                                        <div class="modal-dialog"  id="">
                                            <div class="modal-content">
                                                <div class="modal-body" style="display:none">
                                                </div>
                                                <div class="modal-footer" style="display:none">
                                                    <a class="btn btn-primary" data-dismiss-modal="modal2" onclick="addImage();" id="download" href="javascript:void(0);" >Upload</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <h3>My Pets <button id="yesPet" type="button" data-toggle="modal"  data-target="#modalAddPet" style="margin-left:10px; padding-left: 25px; padding-right: 25px;" class="btn btn-primary"><i class="fa fa-plus-circle" aria-hidden="true"> </i> Add More Pets </button></h3>
                                    <div class="x_content">

                                        <div class="modal fade bs-example-modal" id="modalAddPet" tabindex="-1" role="dialog" aria-hidden="true" style="display: none;">
                                            <div id="modalDialogAddPet" class="modal-dialog modal">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h4 class="modal-title" id="myModalLabel">Add a Pet</h4>
                                                    </div>
                                                    <div class="">
                                                        <div class="x_content">
                                                            <br />
                                                            <form id="demo-form2" data-parsley-validate class="form-horizontal form-label-left">
                                                                <div class="row">

                                                                    <div class="col-md-2 col-xs-0 col-sm-2">
                                                                    </div>
                                                                    <!-- profil photo -->
                                                                    <div style="" class="col-xs-12 col-sm-4 col-md-4">
                                                                        <div class="col-md-0 col-xs-2">

                                                                        </div>
                                                                        <div class="col-md-12 col-xs-8">
                                                                            <img class="img-thumbnail img-circle" id="myImg" src="static/images/user.png" alt="Avatar" title="Change the avatar">
                                                                            <br>
                                                                            <br>
                                                                            <div class="col text-center">
                                                                                <a  class="buttonPrevious btn btn-success btn-xs" onClick="openPhotoPicker();" ><i style="margin-right: 7px" class="fa fa-upload"></i>Change Photo</a>                                                  

                                                                            </div>


                                                                        </div>
                                                                        <div class="col-md-0  col-xs-2">

                                                                        </div>

                                                                    </div>

                                                                    <div class="col-md-6 col-xs-12 col-sm-6">
                                                                        <div class="form-group">
                                                                            <label class="control-label col-md-3 col-sm-3 col-xs-12"  for="name">Name *</label>
                                                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                                                <input type="text" id="name" name="name" value="" required="required" class="form-control col-md-7 col-xs-12">
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label  class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name"><span class="required">Type *</span>
                                                                            </label>
                                                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                                                <select id="type" class="form-control">
                                                                                    <option>Choose type</option>
                                                                                    <option>Dog</option>
                                                                                    <option>Cat</option>
                                                                                    <option>Rabbit</option>
                                                                                    <option>Bird</option>
                                                                                    <option>Guinea Pig</option>
                                                                                    <option>Ferret</option>
                                                                                    <option>Others</option>

                                                                                </select>
                                                                            </div>
                                                                        </div>

                                                                        <div class="form-group">
                                                                            <label class="control-label col-md-3 col-sm-3 col-xs-12"  for="breed">Breed *</label>
                                                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                                                <input type="text" id="breed" name="breed" required="required" class="form-control col-md-7 col-xs-12">
                                                                            </div>
                                                                        </div>


                                                                        <div class="form-group">
                                                                            <label class="control-label col-md-3 col-sm-3 col-xs-12"  for="age">Age *</label>
                                                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                                                <input type="text" id="age" name="age" required="required" class="form-control col-md-7 col-xs-12">
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label class="control-label col-md-4 col-sm-3 col-xs-12" for="friendly">Gender *</label>
                                                                            <div id="" class="btn-group" data-toggle="buttons" >
                                                                                <label class="btn btn-default" data-toggle-class="btn-primary" id="" onClick="whichGender('Male')" data-toggle-passive-class="btn-default">
                                                                                    <input type="radio" name="gender"  value="Yes" > &nbsp;Male&nbsp;
                                                                                </label>
                                                                                <label class="btn btn-default" data-toggle-class="btn-primary"  id=""  onClick="whichGender('Female')" data-toggle-passive-class="btn-default">
                                                                                    <input type="radio" name="gender" value="No" >Female
                                                                                </label>
                                                                            </div>
                                                                        </div>

                                                                        <div class="form-group">
                                                                            <label class="control-label col-md-4 col-sm-3 col-xs-12" for="last-name">Vaccination *</label>
                                                                            <div id="" class="btn-group" data-toggle="buttons">
                                                                                <label class="btn btn-default" data-toggle-class="btn-primary" id="" onClick="isVaccinated('Yes')" data-toggle-passive-class="btn-default">
                                                                                    <input type="radio" name="gender" value="Yes" > Yes
                                                                                </label>
                                                                                <label class="btn btn-default" data-toggle-class="btn-primary" id="" onClick="isVaccinated('No')" data-toggle-passive-class="btn-default">
                                                                                    <input type="radio" name="gender" value="No" >  &nbsp;No&nbsp;
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-xs-0 col-sm-2 col-md-2"></div>

                                                                </div>
                                                                <br>
                                                                <div class="col-md-12 col-sm-12 col-xm-12">
                                                                    <div class="form-group">
                                                                        <label class="control-label col-md-4 col-sm-3 col-xs-12" for="last-name" style="margin-top:9px">Size *</label>
                                                                        <div id="" class="btn-group" data-toggle="buttons">

                                                                            <label onClick="whichSize('0-10kg')" id="" style="margin-top:9px" class="btn btn-default" data-toggle-class="btn-primary"  data-toggle-passive-class="btn-default">
                                                                                <input type="radio" name="gender" style="font-size: 55px" value="Yes" > 0 - 10kg</label>

                                                                            <label onClick="whichSize('10-20kg')" id="" style="margin-top:9px" class="btn btn-default" data-toggle-class="btn-primary"   data-toggle-passive-class="btn-default">
                                                                                <input type="radio" name="gender" value="No" >  10 - 20kg</label>

                                                                            <label onClick="whichSize('20-30kg')" id="" style="margin-top:9px" class="btn btn-default" data-toggle-class="btn-primary"   data-toggle-passive-class="btn-default">
                                                                                <input type="radio" name="gender" value="No" >  20-30kg</label>

                                                                            <label id="" onClick="whichSize('40kg+')" id="" style="margin-top:9px" class="btn btn-default" data-toggle-class="btn-primary"   data-toggle-passive-class="btn-default">
                                                                                <input type="radio" name="gender" value="No" >  40kg+</label>

                                                                        </div>
                                                                    </div>
                                                                    <br>
                                                                    <div class="x_panel">
                                                                        <div class="x_title">
                                                                            <h2>Additional Informations</h2>
                                                                            <ul class="nav navbar-right panel_toolbox">
                                                                                <li class="dropdown">
                                                                                    <a href="#" class="" data-toggle="dropdown" role="button" aria-expanded="false"><i class=""></i></a>
                                                                                </li>
                                                                                <li><a class=""><i class=""></i></a>
                                                                                </li>
                                                                                <li><a class="collapse-link"><i class="fa fa-chevron-down"></i></a>
                                                                                </li>
                                                                            </ul>
                                                                            <div class="clearfix"></div>
                                                                        </div>
                                                                        <div class="x_content" style="display:none">
                                                                            <div class="col-md-12" style=" margin-top:15px;">
                                                                                <div class="col-md-1 col-sm-1 col-xs-0"></div>
                                                                                <div class="col-md-9 col-sm-9 col-xs-12">


                                                                                    <div class="form-group" style="margin-top:15px;">
                                                                                        <label class="control-label col-md-3 col-sm-6 col-xs-12"  for="microchipNo">Microchip No</label>
                                                                                        <div id="" class="btn-group col-md-9 col-sm-6 col-xs-12" data-toggle="buttons">
                                                                                            <input type="text" id="microchipNo" name="microchipNo" required="required" class="form-control">
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="form-group" style="margin-top:15px;">
                                                                                        <label class="control-label col-md-3 col-sm-6 col-xs-12" for="allergies">Allergies</label>
                                                                                        <div id="" class="btn-group col-md-9 col-sm-6 col-xs-12" data-toggle="buttons">
                                                                                            <input  type="text" id="allergies" name="allergies" required="required" class="form-control">
                                                                                        </div>
                                                                                    </div>

                                                                                    <div class="form-group" style="margin-top:15px;">
                                                                                        <label class="control-label col-md-3 col-sm-6 col-xs-12"  for="underMedication">Under medication</label>
                                                                                        <div id="" class="btn-group col-md-9 col-sm-6 col-xs-12" data-toggle="buttons">
                                                                                            <input type="text" id="underMedication" name="underMedication" required="required" class="form-control">
                                                                                        </div>
                                                                                    </div>

                                                                                    <div class="form-group" style="margin-top:15px;">
                                                                                        <label class="control-label col-md-3 col-sm-6 col-xs-12"  for="eatingRoutine">Eating routine</label>
                                                                                        <div id="" class="btn-group col-md-9 col-sm-6 col-xs-12" data-toggle="buttons">
                                                                                            <input type="text" id="eatingRoutine" name="eatingRoutine" required="required" class="form-control">
                                                                                        </div>
                                                                                    </div>

                                                                                    <div class="form-group" style="margin-top:15px;">
                                                                                        <label class="control-label col-md-3 col-sm-6 col-xs-12"  for="sleepingPlace">Sleeping place</label>
                                                                                        <div id="" class="btn-group col-md-9 col-sm-6 col-xs-12" data-toggle="buttons">
                                                                                            <input type="text" id="sleepingPlace" name="sleepingPlace" required="required" class="form-control">
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="form-group">
                                                                                        <label class="control-label col-md-6 col-sm-3 col-xs-12" for="last-name">Neutered sterilized</label>
                                                                                        <div id="" class="btn-group" data-toggle="buttons">
                                                                                            <label class="btn btn-default" data-toggle-class="btn-primary" onClick="isNeutered('Yes')" data-toggle-passive-class="btn-default">
                                                                                                <input type="radio" name="gender" value="Yes" > Yes
                                                                                            </label>
                                                                                            <label class="btn btn-default" data-toggle-class="btn-primary"  onClick="isNeutered('No')" data-toggle-passive-class="btn-default">
                                                                                                <input type="radio" name="gender" value="No" >  &nbsp;No&nbsp;
                                                                                            </label>
                                                                                        </div>
                                                                                    </div>

                                                                                    <div class="form-group">
                                                                                        <label class="control-label col-md-6 col-sm-3 col-xs-12" for="friendly">Friendly</label>
                                                                                        <div id="" class="btn-group" data-toggle="buttons">
                                                                                            <label class="btn btn-default" data-toggle-class="btn-primary" onClick="isFriendly('Yes')" data-toggle-passive-class="btn-default">
                                                                                                <input type="radio" name="gender" value="Yes" > Yes
                                                                                            </label>
                                                                                            <label class="btn btn-default" data-toggle-class="btn-primary"  onClick="isFriendly('No')" data-toggle-passive-class="btn-default">
                                                                                                <input type="radio" name="gender" value="No" >  &nbsp;No&nbsp;
                                                                                            </label>
                                                                                        </div>
                                                                                    </div>

                                                                                    <div class="form-group">
                                                                                        <label class="control-label col-md-6 col-sm-3 col-xs-12" for="last-name">Get along children</label>
                                                                                        <div id="" class="btn-group" data-toggle="buttons">
                                                                                            <label class="btn btn-default" data-toggle-class="btn-primary" onClick="isGetAlongChild('Yes')" data-toggle-passive-class="btn-default">
                                                                                                <input type="radio" name="gender" value="Yes" > Yes
                                                                                            </label>
                                                                                            <label class="btn btn-default" data-toggle-class="btn-primary"  onClick="isGetAlongChild('No')" data-toggle-passive-class="btn-default">
                                                                                                <input type="radio" name="gender" value="No" >  &nbsp;No&nbsp;
                                                                                            </label>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="col-md-1  col-sm-1 col-xs-0"></div>

                                                                            </div>
                                                                        </div>
                                                                    </div>

                                                                </div>
                                                            </form>
                                                        </div>
                                                        <form id="addPet" action="addPet" method="POST">
                                                            <input hidden id="result" name="result" value="">
                                                        </form>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                            <button  id="addBtn" type="button" onClick="addPet()" class="btn btn-primary"  data-dismiss="modal" >Save</button>

                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-hidden="true" id="modalCropper">
                                                <div class="modal-dialog modal-lg">
                                                    <div class="modal-content">


                                                        <div class="modal-header">
                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span>
                                                            </button>

                                                        </div>

                                                        <div class="modal-body">
                                                            <div class="container cropper" >

                                                                <div id="imgContainer" class="row">
                                                                    <div  class="img-container" >
                                                                        <img id="image"  alt="Picture">
                                                                    </div>

                                                                </div>

                                                            </div>   
                                                        </div>
                                                        <div class="modal-footer">
                                                            <div class="row" id="imgButtons" style="display:flex;justify-content: flex-end">
                                                                <div class="docs-buttons">
                                                                    <div class="btn-group">
                                                                        <button type="button" class="btn btn-primary" data-method="zoom" data-option="0.1" title="Zoom In">
                                                                            <span class="docs-tooltip" data-toggle="tooltip" title="Zoom In">
                                                                                <span class="fa fa-search-plus"></span>
                                                                            </span>
                                                                        </button>
                                                                        <button type="button" class="btn btn-primary" data-method="zoom" data-option="-0.1" title="Zoom Out">
                                                                            <span class="docs-tooltip" data-toggle="tooltip" title="Zoom Out">
                                                                                <span class="fa fa-search-minus"></span>
                                                                            </span>
                                                                        </button>
                                                                    </div>
                                                                    <div class="btn-group">
                                                                        <button type="button" class="btn btn-primary" data-method="move" data-option="-10" data-second-option="0" title="Move Left">
                                                                            <span class="docs-tooltip" data-toggle="tooltip" title="Move Left">
                                                                                <span class="fa fa-arrow-left"></span>
                                                                            </span>
                                                                        </button>
                                                                        <button type="button" class="btn btn-primary" data-method="move" data-option="10" data-second-option="0" title="Move Right">
                                                                            <span class="docs-tooltip" data-toggle="tooltip" title="Move Right">
                                                                                <span class="fa fa-arrow-right"></span>
                                                                            </span>
                                                                        </button>
                                                                        <button type="button" class="btn btn-primary" data-method="move" data-option="0" data-second-option="-10" title="Move Up">
                                                                            <span class="docs-tooltip" data-toggle="tooltip" title="Move Up">
                                                                                <span class="fa fa-arrow-up"></span>
                                                                            </span>
                                                                        </button>
                                                                        <button type="button" class="btn btn-primary" data-method="move" data-option="0" data-second-option="10" title="Move Down">
                                                                            <span class="docs-tooltip" data-toggle="tooltip" title="Move Down">
                                                                                <span class="fa fa-arrow-down"></span>
                                                                            </span>
                                                                        </button>
                                                                    </div>
                                                                    <div class="btn-group">
                                                                        <button type="button" class="btn btn-primary" data-method="rotate" data-option="-45" title="Rotate Left">
                                                                            <span class="docs-tooltip" data-toggle="tooltip" title="Rotate Left">
                                                                                <span class="fa fa-rotate-left"></span>
                                                                            </span>
                                                                        </button>
                                                                        <button type="button" class="btn btn-primary" data-method="rotate" data-option="45" title="Rotate Right">
                                                                            <span class="docs-tooltip" data-toggle="tooltip" title="Rotate Right">
                                                                                <span class="fa fa-rotate-right"></span>
                                                                            </span>
                                                                        </button>
                                                                    </div>
                                                                    <div class="btn-group">
                                                                        <button type="button" class="btn btn-primary" data-method="reset" title="Reset">
                                                                            <span class="docs-tooltip" data-toggle="tooltip" title="Reset">
                                                                                <span class="fa fa-refresh"></span>
                                                                            </span>
                                                                        </button>
                                                                        <label  id="btnUploadClick" class="btn btn-primary btn-upload" for="inputImage" title="Upload image file">
                                                                            <input type="file" class="sr-only" id="inputImage" name="file" accept="image/*">
                                                                            <span class="docs-tooltip" data-toggle="tooltip" title="Upload image file">
                                                                                <span class="fa fa-upload"></span>
                                                                            </span>
                                                                        </label>
                                                                    </div>
                                                                    <div class="btn-group">
                                                                        <button type="button"  class="btn btn-success" data-method="getCroppedCanvas" >
                                                                            <span  class="docs-tooltip" data-toggle="tooltip" >
                                                                                Crop
                                                                            </span>
                                                                        </button>
                                                                    </div>
                                                                    <div style="display:none"  class="col-md-3 docs-toggles">
                                                                        <!-- <h3 class="page-header">Toggles:</h3> -->
                                                                        <div class="btn-group btn-group-justified" data-toggle="buttons">

                                                                            <label id="btnSquare" class="btn btn-primary">
                                                                                <input type="radio" class="sr-only" id="aspectRatio2" name="aspectRatio" value="1">
                                                                                <span class="docs-tooltip" data-toggle="tooltip" title="aspectRatio: 1 / 1">
                                                                                    1:1
                                                                                </span>
                                                                            </label>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="modal fade bs-example-modal" id="modalEditPet" tabindex="-1" role="dialog" aria-hidden="true" style="display: none;">
                                            <div id="modalDialogAddPet" class="modal-dialog modal">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h4 class="modal-title" id="myModalLabel">Edit Pet</h4>
                                                    </div>
                                                    <div class="">
                                                        <div class="x_content">
                                                            <br />
                                                            <form id="demo-form2" data-parsley-validate class="form-horizontal form-label-left">
                                                                <div class="row">

                                                                    <div class="col-md-2 col-xs-0 col-sm-2">
                                                                    </div>
                                                                    <!-- profil photo -->
                                                                    <div style="" class="col-xs-12 col-sm-4 col-md-4">
                                                                        <div class="col-md-0 col-xs-2">

                                                                        </div>
                                                                        <div class="col-md-12 col-xs-8">
                                                                            <img class="img-thumbnail img-circle" id="myImg" src="static/images/user.png" alt="Avatar" title="Change the avatar">
                                                                            <br>
                                                                            <br>
                                                                            <div class="col text-center">
                                                                                <a  class="buttonPrevious btn btn-success btn-xs" onClick="openPhotoPicker();" ><i style="margin-right: 7px" class="fa fa-upload"></i>Change Photo</a>                                                  

                                                                            </div>


                                                                        </div>
                                                                        <div class="col-md-0  col-xs-2">

                                                                        </div>

                                                                    </div>

                                                                    <div class="col-md-6 col-xs-12 col-sm-6">
                                                                        <div class="form-group">
                                                                            <label class="control-label col-md-3 col-sm-3 col-xs-12"  for="name">Name *</label>
                                                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                                                <input type="text" id="name1" name="name" value="" required="required" class="form-control col-md-7 col-xs-12">
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label  class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name"><span class="required">Type *</span>
                                                                            </label>
                                                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                                                <select id="type1" class="form-control">
                                                                                    <option>Choose type</option>
                                                                                    <option>Dog</option>
                                                                                    <option>Cat</option>
                                                                                    <option>Rabbit</option>
                                                                                    <option>Bird</option>
                                                                                    <option>Guinea Pig</option>
                                                                                    <option>Ferret</option>
                                                                                    <option>Others</option>

                                                                                </select>
                                                                            </div>
                                                                        </div>

                                                                        <div class="form-group">
                                                                            <label class="control-label col-md-3 col-sm-3 col-xs-12"  for="breed">Breed *</label>
                                                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                                                <input type="text" id="breed1" name="breed" required="required" class="form-control col-md-7 col-xs-12">
                                                                            </div>
                                                                        </div>


                                                                        <div class="form-group">
                                                                            <label class="control-label col-md-3 col-sm-3 col-xs-12"  for="age">Age *</label>
                                                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                                                <input type="text" id="age1" name="age" required="required" class="form-control col-md-7 col-xs-12">
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label class="control-label col-md-4 col-sm-3 col-xs-12" for="friendly">Gender *</label>
                                                                            <div id="" class="btn-group" data-toggle="buttons" >
                                                                                <label class="btn btn-default" data-toggle-class="btn-primary" id="genderMale" onClick="whichGender('Male')" data-toggle-passive-class="btn-default">
                                                                                    <input type="radio" name="gender"  value="Yes" > &nbsp;Male&nbsp;
                                                                                </label>
                                                                                <label class="btn btn-default" data-toggle-class="btn-primary"  id="genderFemale"  onClick="whichGender('Female')" data-toggle-passive-class="btn-default">
                                                                                    <input type="radio" name="gender" value="No" >Female
                                                                                </label>
                                                                            </div>
                                                                        </div>

                                                                        <div class="form-group">
                                                                            <label class="control-label col-md-4 col-sm-3 col-xs-12" for="last-name">Vaccination *</label>
                                                                            <div id="" class="btn-group" data-toggle="buttons">
                                                                                <label class="btn btn-default" data-toggle-class="btn-primary" id="vaccinationYes" onClick="isVaccinated('Yes')" data-toggle-passive-class="btn-default">
                                                                                    <input type="radio" name="gender" value="Yes" > Yes
                                                                                </label>
                                                                                <label class="btn btn-default" data-toggle-class="btn-primary" id="vaccinationNo" onClick="isVaccinated('No')" data-toggle-passive-class="btn-default">
                                                                                    <input type="radio" name="gender" value="No" >  &nbsp;No&nbsp;
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-xs-0 col-sm-2 col-md-2"></div>

                                                                </div>
                                                                <br>
                                                                <div class="col-md-12 col-sm-12 col-xm-12">
                                                                    <div class="form-group">
                                                                        <label class="control-label col-md-4 col-sm-3 col-xs-12" for="last-name" style="margin-top:9px">Size *</label>
                                                                        <div id="" class="btn-group" data-toggle="buttons">

                                                                            <label onClick="whichSize('0-10kg')" id="size0-10kg" style="margin-top:9px" class="btn btn-default" data-toggle-class="btn-primary"  data-toggle-passive-class="btn-default">
                                                                                <input type="radio" name="gender" style="font-size: 55px" value="Yes" > 0 - 10kg</label>

                                                                            <label onClick="whichSize('10-20kg')" id="size10-20kg" style="margin-top:9px" class="btn btn-default" data-toggle-class="btn-primary"   data-toggle-passive-class="btn-default">
                                                                                <input type="radio" name="gender" value="No" >  10 - 20kg</label>

                                                                            <label onClick="whichSize('20-30kg')" id="size20-30kg" style="margin-top:9px" class="btn btn-default" data-toggle-class="btn-primary"   data-toggle-passive-class="btn-default">
                                                                                <input type="radio" name="gender" value="No" >  20-30kg</label>

                                                                            <label id="" onClick="whichSize('40kg+')" id="size40kg+" style="margin-top:9px" class="btn btn-default" data-toggle-class="btn-primary"   data-toggle-passive-class="btn-default">
                                                                                <input type="radio" name="gender" value="No" >  40kg+</label>

                                                                        </div>
                                                                    </div>
                                                                    <br>
                                                                    <div class="x_panel">
                                                                        <div class="x_title">
                                                                            <h2>Additional Informations</h2>
                                                                            <ul class="nav navbar-right panel_toolbox">
                                                                                <li class="dropdown">
                                                                                    <a href="#" class="" data-toggle="dropdown" role="button" aria-expanded="false"><i class=""></i></a>
                                                                                </li>
                                                                                <li><a class=""><i class=""></i></a>
                                                                                </li>
                                                                                <li><a class="collapse-link"><i class="fa fa-chevron-down"></i></a>
                                                                                </li>
                                                                            </ul>
                                                                            <div class="clearfix"></div>
                                                                        </div>
                                                                        <div class="x_content" style="display:none">
                                                                            <div class="col-md-12" style=" margin-top:15px;">
                                                                                <div class="col-md-1 col-sm-1 col-xs-0"></div>
                                                                                <div class="col-md-9 col-sm-9 col-xs-12">


                                                                                    <div class="form-group" style="margin-top:15px;">
                                                                                        <label class="control-label col-md-3 col-sm-6 col-xs-12"  for="microchipNo">Microchip No</label>
                                                                                        <div id="" class="btn-group col-md-9 col-sm-6 col-xs-12" data-toggle="buttons">
                                                                                            <input type="text" id="microchipNo1" name="microchipNo" required="required" class="form-control">
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="form-group" style="margin-top:15px;">
                                                                                        <label class="control-label col-md-3 col-sm-6 col-xs-12" for="allergies">Allergies</label>
                                                                                        <div id="" class="btn-group col-md-9 col-sm-6 col-xs-12" data-toggle="buttons">
                                                                                            <input  type="text" id="allergies1" name="allergies" required="required" class="form-control">
                                                                                        </div>
                                                                                    </div>

                                                                                    <div class="form-group" style="margin-top:15px;">
                                                                                        <label class="control-label col-md-3 col-sm-6 col-xs-12"  for="underMedication">Under medication</label>
                                                                                        <div id="" class="btn-group col-md-9 col-sm-6 col-xs-12" data-toggle="buttons">
                                                                                            <input type="text" id="underMedication1" name="underMedication" required="required" class="form-control">
                                                                                        </div>
                                                                                    </div>

                                                                                    <div class="form-group" style="margin-top:15px;">
                                                                                        <label class="control-label col-md-3 col-sm-6 col-xs-12"  for="eatingRoutine">Eating routine</label>
                                                                                        <div id="" class="btn-group col-md-9 col-sm-6 col-xs-12" data-toggle="buttons">
                                                                                            <input type="text" id="eatingRoutine1" name="eatingRoutine" required="required" class="form-control">
                                                                                        </div>
                                                                                    </div>

                                                                                    <div class="form-group" style="margin-top:15px;">
                                                                                        <label class="control-label col-md-3 col-sm-6 col-xs-12"  for="sleepingPlace">Sleeping place</label>
                                                                                        <div id="" class="btn-group col-md-9 col-sm-6 col-xs-12" data-toggle="buttons">
                                                                                            <input type="text" id="sleepingPlace1" name="sleepingPlace" required="required" class="form-control">
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="form-group">
                                                                                        <label class="control-label col-md-6 col-sm-3 col-xs-12" for="last-name">Neutered sterilized</label>
                                                                                        <div id="" class="btn-group" data-toggle="buttons">
                                                                                            <label class="btn btn-default" data-toggle-class="btn-primary" id="neuteredStreilizedYes" onClick="isNeutered('Yes')" data-toggle-passive-class="btn-default">
                                                                                                <input type="radio" name="gender" value="Yes" > Yes
                                                                                            </label>
                                                                                            <label class="btn btn-default" data-toggle-class="btn-primary" id="neuteredStreilizedNo" onClick="isNeutered('No')" data-toggle-passive-class="btn-default">
                                                                                                <input type="radio" name="gender" value="No" >  &nbsp;No&nbsp;
                                                                                            </label>
                                                                                        </div>
                                                                                    </div>

                                                                                    <div class="form-group">
                                                                                        <label class="control-label col-md-6 col-sm-3 col-xs-12" for="friendly">Friendly</label>
                                                                                        <div id="" class="btn-group" data-toggle="buttons">
                                                                                            <label class="btn btn-default" data-toggle-class="btn-primary" id="friendlyYes"  onClick="isFriendly('Yes')" data-toggle-passive-class="btn-default">
                                                                                                <input type="radio" name="gender" value="Yes" > Yes
                                                                                            </label>
                                                                                            <label class="btn btn-default" data-toggle-class="btn-primary" id="friendlyNo" onClick="isFriendly('No')" data-toggle-passive-class="btn-default">
                                                                                                <input type="radio" name="gender" value="No" >  &nbsp;No&nbsp;
                                                                                            </label>
                                                                                        </div>
                                                                                    </div>

                                                                                    <div class="form-group">
                                                                                        <label class="control-label col-md-6 col-sm-3 col-xs-12" for="last-name">Get along children</label>
                                                                                        <div id="" class="btn-group" data-toggle="buttons">
                                                                                            <label class="btn btn-default" data-toggle-class="btn-primary" id="getAlongChildrenYes" onClick="isGetAlongChild('Yes')" data-toggle-passive-class="btn-default">
                                                                                                <input type="radio" name="gender" value="Yes" > Yes
                                                                                            </label>
                                                                                            <label class="btn btn-default" data-toggle-class="btn-primary" id="getAlongChildrenNo"  onClick="isGetAlongChild('No')" data-toggle-passive-class="btn-default">
                                                                                                <input type="radio" name="gender" value="No" >  &nbsp;No&nbsp;
                                                                                            </label>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="col-md-1  col-sm-1 col-xs-0"></div>

                                                                            </div>
                                                                        </div>
                                                                    </div>

                                                                </div>
                                                            </form>
                                                        </div>
                                                        <form id="updatePet" action="updatePet" method="POST">
                                                            <input hidden id="resultUpdate" name="resultUpdate" value="">
                                                        </form>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                            <button  id="addBtn" type="button" onClick="updatePet()" class="btn btn-primary"  data-dismiss="modal" >Save Changes</button>

                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-hidden="true" id="modalCropper">
                                                <div class="modal-dialog modal-lg">
                                                    <div class="modal-content">


                                                        <div class="modal-header">
                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span>
                                                            </button>

                                                        </div>

                                                        <div class="modal-body">
                                                            <div class="container cropper" >

                                                                <div id="imgContainer" class="row">
                                                                    <div  class="img-container" >
                                                                        <img id="image"  alt="Picture">
                                                                    </div>

                                                                </div>

                                                            </div>   
                                                        </div>
                                                        <div class="modal-footer">
                                                            <div class="row" id="imgButtons" style="display:flex;justify-content: flex-end">
                                                                <div class="docs-buttons">
                                                                    <div class="btn-group">
                                                                        <button type="button" class="btn btn-primary" data-method="zoom" data-option="0.1" title="Zoom In">
                                                                            <span class="docs-tooltip" data-toggle="tooltip" title="Zoom In">
                                                                                <span class="fa fa-search-plus"></span>
                                                                            </span>
                                                                        </button>
                                                                        <button type="button" class="btn btn-primary" data-method="zoom" data-option="-0.1" title="Zoom Out">
                                                                            <span class="docs-tooltip" data-toggle="tooltip" title="Zoom Out">
                                                                                <span class="fa fa-search-minus"></span>
                                                                            </span>
                                                                        </button>
                                                                    </div>
                                                                    <div class="btn-group">
                                                                        <button type="button" class="btn btn-primary" data-method="move" data-option="-10" data-second-option="0" title="Move Left">
                                                                            <span class="docs-tooltip" data-toggle="tooltip" title="Move Left">
                                                                                <span class="fa fa-arrow-left"></span>
                                                                            </span>
                                                                        </button>
                                                                        <button type="button" class="btn btn-primary" data-method="move" data-option="10" data-second-option="0" title="Move Right">
                                                                            <span class="docs-tooltip" data-toggle="tooltip" title="Move Right">
                                                                                <span class="fa fa-arrow-right"></span>
                                                                            </span>
                                                                        </button>
                                                                        <button type="button" class="btn btn-primary" data-method="move" data-option="0" data-second-option="-10" title="Move Up">
                                                                            <span class="docs-tooltip" data-toggle="tooltip" title="Move Up">
                                                                                <span class="fa fa-arrow-up"></span>
                                                                            </span>
                                                                        </button>
                                                                        <button type="button" class="btn btn-primary" data-method="move" data-option="0" data-second-option="10" title="Move Down">
                                                                            <span class="docs-tooltip" data-toggle="tooltip" title="Move Down">
                                                                                <span class="fa fa-arrow-down"></span>
                                                                            </span>
                                                                        </button>
                                                                    </div>
                                                                    <div class="btn-group">
                                                                        <button type="button" class="btn btn-primary" data-method="rotate" data-option="-45" title="Rotate Left">
                                                                            <span class="docs-tooltip" data-toggle="tooltip" title="Rotate Left">
                                                                                <span class="fa fa-rotate-left"></span>
                                                                            </span>
                                                                        </button>
                                                                        <button type="button" class="btn btn-primary" data-method="rotate" data-option="45" title="Rotate Right">
                                                                            <span class="docs-tooltip" data-toggle="tooltip" title="Rotate Right">
                                                                                <span class="fa fa-rotate-right"></span>
                                                                            </span>
                                                                        </button>
                                                                    </div>
                                                                    <div class="btn-group">
                                                                        <button type="button" class="btn btn-primary" data-method="reset" title="Reset">
                                                                            <span class="docs-tooltip" data-toggle="tooltip" title="Reset">
                                                                                <span class="fa fa-refresh"></span>
                                                                            </span>
                                                                        </button>
                                                                        <label  id="btnUploadClick" class="btn btn-primary btn-upload" for="inputImage" title="Upload image file">
                                                                            <input type="file" class="sr-only" id="inputImage" name="file" accept="image/*">
                                                                            <span class="docs-tooltip" data-toggle="tooltip" title="Upload image file">
                                                                                <span class="fa fa-upload"></span>
                                                                            </span>
                                                                        </label>
                                                                    </div>
                                                                    <div class="btn-group">
                                                                        <button type="button"  class="btn btn-success" data-method="getCroppedCanvas" >
                                                                            <span  class="docs-tooltip" data-toggle="tooltip" >
                                                                                Crop
                                                                            </span>
                                                                        </button>
                                                                    </div>
                                                                    <div style="display:none"  class="col-md-3 docs-toggles">
                                                                        <!-- <h3 class="page-header">Toggles:</h3> -->
                                                                        <div class="btn-group btn-group-justified" data-toggle="buttons">

                                                                            <label id="btnSquare" class="btn btn-primary">
                                                                                <input type="radio" class="sr-only" id="aspectRatio2" name="aspectRatio" value="1">
                                                                                <span class="docs-tooltip" data-toggle="tooltip" title="aspectRatio: 1 / 1">
                                                                                    1:1
                                                                                </span>
                                                                            </label>
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
                                </div>
                                <div class="clearfix"></div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="x_panel">
                                            <div id="noPet" hidden class="col text-center">
                                                <h2>You have no pet to display <button type="button" data-toggle="modal"  data-target="#modalAddPet" style="margin-left:10px; padding-left: 25px; padding-right: 25px;" class="btn btn-primary"><i class="fa fa-plus-circle" aria-hidden="true"> </i> Add a Pet </button></h2>
                                            </div>


                                            <div class="x_content">
                                                <div id="pets" class="row">
                                                    <div class="clearfix"></div>
                                                    <div id="newPet" >
                                                    </div>
                                                <c:forEach var="p" items="${pets}">
                                                    <div id="pet1-comp" class="col-md-4 col-sm-4 col-xs-12 profile_details">
                                                        <div class="well profile_view">
                                                            <div class="col-sm-12">
                                                                <h4 class="brief"><i>${p.petType}</i></h4>
                                                                <div class="row">
                                                                    <div class="left col-xs-6 col-md-6 col-sm-6 ">
                                                                        <h3 id="pet1-name"><strong>${p.name}</strong></h3>
                                                                        <p id ="pet1-breed"><strong>Breed: </strong>${p.breed} </p>
                                                                        <p id="pet1-size"><strong>Size (Kg) :     </strong>${p.petSize} </p>
                                                                        <p id="pet1-gender"><strong>Gender: </strong>${p.gender} </p>
                                                                        <p id="pet1-age"><strong>Age: </strong>${p.age} years </p>
                                                                        <p id="pet1-vaccination"><strong>Vaccination: </strong>Yes</p>
                                                                    </div>
                                                                    <div class="right col-xs-6 col-md-6 col-sm-6 right ">
                                                                        <img src="static/images/dog.jpg" alt="" class="img-circle img-responsive" />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-xs-12 bottom text-center">
                                                                <div class="col-xs-12 col-sm-12 emphasis">
                                                                    <form id="removePet" action="removePet" method="POST">
                                                                        <input hidden id="petId" name="petId" value="${p.id}">
                                                                        <button id="deleteBtn" type="button" data-toggle="modal" data-target="#deleteConfirmModal" class="btn btn-danger btn-xs">
                                                                            <i class="fa fa-minus-circle"> </i> Delete
                                                                        </button>
                                                                    </form>
                                                                    <button id="${p.id}" onclick="editPet(this.id)"  type="button" class="btn btn-warning btn-xs">
                                                                        <i class="fa fa-edit"> </i> Edit Pet
                                                                    </button>
                                                                    <button type="button" class="btn btn-success btn-xs">
                                                                        <i class="fa fa-search"> </i> Find a Pet Hotel
                                                                    </button>
                                                                </div>
                                                            </div>
                                                            <div id="deleteConfirmModal" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-hidden="true">
                                                                <div id="deleteConfirmDialog"  class="modal-dialog modal-lg">
                                                                    <div class="modal-content">

                                                                        <div class="modal-header">
                                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span>
                                                                            </button>
                                                                            <h4 class="modal-title" id="myModalLabel2">Delete the Pet</h4>
                                                                        </div>
                                                                        <div class="modal-body">
                                                                            <br />
                                                                            <form id="demo-form2" data-parsley-validate class="form-horizontal form-label-left">
                                                                                <div class="row" >
                                                                                    <div style="" >
                                                                                        <div class="col-md-5 col-xs-12 col-sm-12" >
                                                                                            <span style="margin-top:15%;padding-left: 40%;font-size: 90px;text-align: center" class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
                                                                                        </div>
                                                                                        <div class="col-md-6 col-xs-12 col-sm-12" style="margin-top:25px">
                                                                                            <h1 ><strong>Are you sure?</strong></h1>
                                                                                            <h3>You're about to delete your pet!</h3>
                                                                                        </div>
                                                                                    </div>

                                                                                </div>
                                                                            </form>
                                                                        </div>
                                                                        <div class="modal-footer">
                                                                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                                            <button type="button" class="btn btn-primary" onclick="changeButtonType()">Delete</button>
                                                                        </div>

                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <!-- /modals -->
                                                        </div>
                                                    </div>
                                                </c:forEach>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <jsp:include page="dashboardFooter.jsp"></jsp:include>
        </div>

        <!-- jQuery -->
        <script src="static/vendors/jquery/dist/jquery.min.js"></script>
        <!-- Bootstrap -->
        <script src="static/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
        <!-- FastClick -->
        <script src="static/vendors/fastclick/lib/fastclick.js"></script>
        <!-- NProgress -->
        <script src="static/vendors/nprogress/nprogress.js"></script>
        <!-- Custom Theme Scripts -->
        <script src="static/vendors/build/js/custom.min.js"></script>  
        <!-- Cropper -->
        <script src="static/vendors/cropper/dist/cropper.min.js" type="text/javascript"></script>
        <script src="https://kit.fontawesome.com/3135afb4f3.js"></script>
    </body>
</html>
