<%-- 
    Document   : newjsp
    Created on : Jul 10, 2019, 4:37:09 PM
    Author     : burakzengin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <!-- PNotify -->
        <link href="static/vendors/pnotify/dist/pnotify.css" rel="stylesheet">
        <link href="static/vendors/pnotify/dist/pnotify.buttons.css" rel="stylesheet">
        <link href="static/vendors/pnotify/dist/pnotify.nonblock.css" rel="stylesheet">
        <!-- Cropper.js -->
        <link href="static/vendors/cropper/dist/cropper.min.css" rel="stylesheet">
    </head>
    <style>
        #modalDialogAddPet{
            position: relative;
            display: table; /* <-- This makes the trick */
            overflow-y: auto;    
            overflow-x: auto;
            width: auto;

        }

/*        #imgContainer{
            zoom:100%;
        }  */
    </style>
    <script type="text/javascript">

        $(document).ready(function () {


            function changeStyle() {
                alert(span);
//                if (span.style.color === 'red') {
//                    span.style.color = 'black';
//                } else {
//                    span.style.color = 'red'
//                }
            }
        });



        var dataURI;

        //Open photo picker
        function openPhotoPicker() {
            $('#btnSquare').trigger('click');
            $('#btnUploadClick').trigger('click');
        }

        // Modal
        $(function () {

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

//                    document.body.style.zoom = "90%";
                    var image = $('#image').attr('src');
                    $('#image').attr('src', $('#image').attr('src'));

                    //    $('#imgContainer').css("display", "block");
                    setTimeout(
                            function () {
                                //    $('#image').attr('src',image); 
                            }, 500);

                    $(".cropper-container").attr("style", "width: 500px; height: 500px");
//                    var span = document.getElementsByClassName('cropper-container cropper-bg')[0];
//                    span
//                    alert(span);
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
                    title: 'Lütfen (*) yerleri doldurun!',
                    type: 'error',
                    styling: 'bootstrap3'
                });
            }
        }
        /* Remove Pet */

        function removePet(petId) {
            var el = document.getElementById(petId + "-comp");
            el.remove();
        }

        var type = "Dog";
        var name = "Nameless";
        var breed = "#";
        var gender = "female";
        var age = "#";
        var vaccination = "No";
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
        function addPet() {

            id = Math.floor(Math.random() * 100);
            type = document.getElementById("petType").value;
            if (type == "Choose type") {
                type = "Unknown";
            }
            name = document.getElementById("petName").value;
            breed = document.getElementById("petBreed").value;
            age = document.getElementById("petAge").value;
            petImg = dataURI;

            //   alert(name + " " + breed + " " + gender + " " + age + " " + size);
            {
                new PNotify({
                    title: 'A pet is being added.',
                    text: 'Please,check your pets out!',
                    type: 'success',
                    styling: 'bootstrap3'
                });
            }

            var div = '<div id="' + id + "-comp" + '" class="col-md-4 col-sm-4 col-xs-12 profile_details"> <div class="well profile_view"> <div class="col-sm-12"> <h4 class="brief"><i>' + type + '</i></h4> <div class="row"> <div class="left col-xs-6 col-sm-6"> <h3><strong>' + name + '</strong></h3> <p><strong>Breed: </strong>' + breed + '</p> <p><strong>Size (Kg) : </strong>' + size + '</p> <p><strong>Gender: </strong>' + gender + '</p> <p><strong>Age: </strong>' + age + '</p><p id="' + id + '-vaccination"><strong>Vaccination: </strong>' + vaccination + '</p> </div> <div class="right col-xs-6 col-sm-6 right"> <img width="192" height="192" src="  ' + petImg + ' " alt="" class="img-circle img-responsive" /> </div> </div> </div> <div class="col-xs-12 bottom text-center"> <div class="col-xs-12 col-sm-12 emphasis"> <button id="' + id + '" onClick="removePet(this.id);" type="button" class="btn btn-danger btn-xs"> <i class="fa fa-minus-circle"> </i> Delete </button><button type="button" class="btn btn-warning btn-xs"> <i class="fa fa-edit"> </i> Edit Pet </button> <button type="button" class="btn btn-success btn-xs"> <i class="fa fa-search"> </i> Find a Pet Hotel </button> </div> </div> </div> </div>';
            document.getElementById("pets").innerHTML = document.getElementById("pets").innerHTML + div;
        }

        /*EditPet*/
        function editPet(id) {
            const petName = document.querySelector('#' + id + '-name').textContent.trim();
            const petBreed = document.querySelector('#' + id + '-breed').textContent.trim();
            const petSize = document.querySelector('#' + id + '-size').textContent.trim();
            const petAge = document.querySelector('#' + id + '-age').textContent.trim();
            const petGender = document.querySelector('#' + id + '-gender').textContent.trim();
            document.querySelector('#petName').value = petName;
            document.querySelector('#petBreed').value = petBreed;
            document.querySelector('#petAge').value = petAge;
            document.getElementById("myModalLabel").innerHTML = "Edit Pet";
            $('#modalAddPet').modal("show");

        }
    </script>
    <body class="nav-md">
        <div class="container body">

            <div class="main_container">
                <jsp:include page="dashboardHeader.jsp"></jsp:include>

                    <div class="right_col" role="main">
                        <div >
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

                                    <h3>My Pets <button type="button" data-toggle="modal"  data-target="#modalAddPet" style="margin-left:10px; padding-left: 25px; padding-right: 25px;" class="btn btn-primary"><i class="fa fa-plus-circle" aria-hidden="true"> </i> Add More Pets </button></h3>
                                    <div class="x_content">

                                        <div class="modal fade bs-example-modal-lg" id="modalAddPet" tabindex="-1" role="dialog" aria-hidden="true" style="display: none;">
                                            <div id="modalDialogAddPet" class="modal-dialog modal-lg">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span>
                                                        </button>

                                                        <h4 class="modal-title" id="myModalLabel">Add a Pet</h4>
                                                    </div>
                                                    <div class="">
                                                        <div class="x_content">
                                                            <br />
                                                            <form id="demo-form2" data-parsley-validate class="form-horizontal form-label-left">

                                                                <div class="row">

                                                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                                                        <div class="col-md-12 col-sm-12 col-xs-12">
                                                                            <!-- space-->
                                                                            <div class="col-xs-2 col-sm-2 col-md-4"></div>
                                                                            <!-- profil photo -->
                                                                            <div style="" class="col-xs-4 col-sm-4 col-md-4">
                                                                                <img class="img-responsive img-thumbnail img-circle" id="myImg" src="static/images/user.png" alt="Avatar" title="Change the avatar">
                                                                                <br>
                                                                                <br>
                                                                                <div class="row"  >
                                                                                    <div class="col-md-3">

                                                                                    </div>
                                                                                    <div class="col-md-6">

                                                                                        <a class="buttonPrevious btn btn-success btn-xs" onClick="openPhotoPicker();" ><i style="margin-right:7px;" class="fa fa-upload"></i>Change Photo</a>

                                                                                    </div>
                                                                                    <div class="col-md-3">

                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <!-- space-->
                                                                            <div class="col-xs-2 col-sm-2 col-md-2"></div>
                                                                        </div><!-- -->

                                                                        <div style="margin-top:10px" class="col-md-12 col-sm-12 col-xs-12">
                                                                            <!-- space-->
                                                                            <div  class="col-xs-0 col-sm-0 col-md-2"></div>
                                                                            <!-- informations -->
                                                                            <div  class="col-xs-12 col-sm-12 col-md-9">
                                                                                <div class="form-group">

                                                                                    <div class="form-group">
                                                                                        <label  class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Type of Pet <span class="required">*</span>
                                                                                        </label>
                                                                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                                                                            <select id="petType" class="form-control">
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
                                                                                </div>

                                                                                <div class="form-group">

                                                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">Name <span class="required">*</span>
                                                                                    </label>
                                                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                                                        <input id="petName" type="text" id="last-name" name="last-name" required="required" class="form-control col-md-7 col-xs-12">
                                                                                    </div>
                                                                                </div>
                                                                                <div class="form-group">
                                                                                    <label for="middle-name" class="control-label col-md-3 col-sm-3 col-xs-12">Breed</label>
                                                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                                                        <input id="petBreed" id="middle-name" class="form-control col-md-7 col-xs-12" type="text" name="middle-name">
                                                                                    </div>
                                                                                </div>
                                                                                <div class="form-group">
                                                                                    <label  class="control-label col-md-3 col-sm-3 col-xs-12">Gender</label>
                                                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                                                        <div id="petGender" class="btn-group" data-toggle="buttons">
                                                                                            <label class="btn btn-default" data-toggle-class="btn-primary" onClick="whichGender('male')" data-toggle-passive-class="btn-default">
                                                                                                <input type="radio" name="gender" value="male" > &nbsp; Male &nbsp;
                                                                                            </label>
                                                                                            <label class="btn btn-default" data-toggle-class="btn-primary" onClick="whichGender('female')" data-toggle-passive-class="btn-default">
                                                                                                <input type="radio" name="gender" value="female" > Female
                                                                                            </label>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="form-group">
                                                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12">Age<span class="required">*</span>
                                                                                    </label>
                                                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                                                        <input id="petAge" class="date-picker form-control col-md-7 col-xs-12" required="required" type="text">
                                                                                    </div>

                                                                                </div>
                                                                                <div class="form-group">
                                                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12">Vaccination<span class="required">*</span>
                                                                                    </label>      
                                                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                                                        <div id="" class="btn-group" data-toggle="buttons">
                                                                                            <label class="btn btn-default" data-toggle-class="btn-primary" onClick="isVaccinated('Yes')" data-toggle-passive-class="btn-default">
                                                                                                <input type="radio" name="gender" value="Yes" > Yes
                                                                                            </label>
                                                                                            <label class="btn btn-default" data-toggle-class="btn-primary"  onClick="isVaccinated('No')" data-toggle-passive-class="btn-default">
                                                                                                <input type="radio" name="gender" value="No" >  &nbsp;No&nbsp;
                                                                                            </label>
                                                                                        </div>
                                                                                    </div>

                                                                                </div>
                                                                                <div class="form-group">
                                                                                    <label class="control-label col-md-3 col-sm-3 col-xs-5">Size<span class="required">*</span>
                                                                                    </label>
                                                                                    <br>
                                                                                    <div id="petSize" class="col-md-3 col-sm-3 col-xs-5 btn-group-vertical " style="">
                                                                                        <button class="btn btn-default" type="button" onClick="whichSize('5-10kg')"> 5-10kg</button>
                                                                                        <button class="btn btn-default" type="button" onClick="whichSize('10-20kg')" >10-20kg</button>
                                                                                        <button class="btn btn-default" type="button" onClick="whichSize('20-40kg')">20-40kg</button>
                                                                                        <button class="btn btn-default" type="button" onClick="whichSize('40kg+')">40+kg</button>  </                                                                                                                                                                    </div>
                                                                                </div>

                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                        </div>
                                                        <div class="ln_solid"></div>
                                                        </form>
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                    <button  type="button" onClick="addPet()" class="btn btn-primary"  data-dismiss="modal" >Save changes</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-hidden="true" id="modalCropper">
                                        <div class="modal-dialog modal-lg">
                                            <div class="modal-content">

                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span>
                                                    </button>
                                                    <h4 class="modal-title" id="myModalLabel">Modal title</h4>
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
                                                    <div class="row" id="imgButtons" style="">
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
                                    <div class="x_content">
                                        <div id="pets" class="row">
                                            <div class="clearfix"></div>
                                            <div id="newPet" >
                                            </div>
                                            <div id="pet1-comp" class="col-md-4 col-sm-4 col-xs-12 profile_details">
                                                <div class="well profile_view">
                                                    <div class="col-sm-12">
                                                        <h4 class="brief"><i>Dog</i></h4>
                                                        <div class="row">
                                                            <div class="left col-xs-6 col-md-6 col-sm-6 ">
                                                                <h3 id="pet1-name"><strong>Arthur</strong></h3>
                                                                <p id ="pet1-breed"><strong>Breed: </strong>Dogo Argentino </p>
                                                                <p id="pet1-size"><strong>Size (Kg) :     </strong>40+ kg </p>
                                                                <p id="pet1-gender"><strong>Gender: </strong>Male </p>
                                                                <p id="pet1-age"><strong>Age: </strong>2 years </p>
                                                                <p id="pet1-vaccination"><strong>Vaccination: </strong>Yes</p>
                                                            </div>
                                                            <div class="right col-xs-6 col-md-6 col-sm-6 right ">
                                                                <img src="static/images/dog.jpg" alt="" class="img-circle img-responsive" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-xs-12 bottom text-center">
                                                        <div class="col-xs-12 col-sm-12 emphasis">
                                                            <button id="pet1" onClick="removePet(this.id)" type="button" class="btn btn-danger btn-xs">
                                                                <i class="fa fa-minus-circle"> </i> Delete
                                                            </button>
                                                            <button id="pet1" onclick="editPet(this.id)"  type="button" class="btn btn-warning btn-xs">
                                                                <i class="fa fa-edit"> </i> Edit Pet
                                                            </button>
                                                            <button type="button" class="btn btn-success btn-xs">
                                                                <i class="fa fa-search"> </i> Find a Pet Hotel
                                                            </button>
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
            </div>
        <jsp:include page="dashboardFooter.jsp"></jsp:include>

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
        <!-- PNotify -->
        <script src="static/vendors/pnotify/dist/pnotify.js"></script>
        <script src="static/vendors/pnotify/dist/pnotify.buttons.js"></script>
        <script src="static/vendors/pnotify/dist/pnotify.nonblock.js"></script>
        <!-- Cropper -->
        <script src="static/vendors/cropper/dist/cropper.js" type="text/javascript"></script>
        <script src="https://kit.fontawesome.com/3135afb4f3.js"></script>

    </body>
</html>
