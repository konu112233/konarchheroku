<%-- 
    Document   : profile
    Created on : Jul 22, 2019, 5:32:56 PM
    Author     : OMER
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
        <!-- Cropper.js -->
        <link href="static/vendors/cropper/dist/cropper.min.css" rel="stylesheet">
        <!-- bootstrap-datetimepicker -->
        <link href="static/vendors/bootstrap-datetimepicker/build/css/bootstrap-datetimepicker.css" rel="stylesheet">


        <script>
            var dataURI, name, surname, gender, birthday, phone, email, aptNo, street, states, city, country, zipcode;

            window.onload = () => {
                gender = '${user.gender}';
                $('#gender' + gender).trigger("click");

            }

            function whichGender(g) {
                gender = g;
            }

            function updateProfile() {
                name = document.getElementById("firstname").value;
                surname = document.getElementById("lastname").value;
                birthday = document.getElementById("birthday").value;
                phone = document.getElementById("phone").value;
                email = document.getElementById("email").value;



                console.log(name + surname + gender + birthday + phone + email);
                var profile = JSON.stringify({
                    "photo": dataURI,
                    "name": name,
                    "surname": surname,
                    "phone": phone,
                    "email": email,
                    "birthday": birthday,
                    "gender": gender

                });
                console.log("Test" + profile);
                $('#result').val(profile);
                $("#updateProfile").submit();
            }

            //Photo crop start-----------------------

            //Open photo picker
            function openPhotoPicker() {
                $('#btnSquare').trigger('click');
                $('#modalCropper').modal('show');
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
                                addImage();
                            }, 1);
                });
                // display if image has a src
                $('#image').load(function () {
                    var imageObj = $(this);
                    if (!(imageObj.width() == 1 && imageObj.height() == 1)) {
                        console.log('Image source changed');
                        var image = $('#image').attr('src');
                        $('#image').attr('src', $('#image').attr('src'));
                    }
                });

                $("button[data-number=1]").click(function () {
                    $('#addItemModal').modal('hide');
                });
            });
            //Close modal
            function closeModal() {
                $('#getCroppedCanvasModal').modal('hide');
                $('#modalCropper').modal('hide');
            }
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

                //  javascript:location.reload(true)
                byteImage = test(dataURI);
                //  blobImage = b64toBlob(dataURI);
                //console.log("blob" + blobImage);
                // reader.readAsDataURL(blob);
            }
            //Read blob and convert to b64 to put image view
            var reader = new FileReader();
            reader.onload = function () {
                b64Image = reader.result;
                console.log("b64Image" + b64Image);
            };
            //Photo crop end---------------------

            function test(base64StringFromURL)
            {
                var parts = base64StringFromURL.split(";base64,");
                var contentType = parts[0].replace("data:", "");
                var base64 = parts[1];
                var byteArray = base64ToByteArray(base64);
                console.log("byteArray" + byteArray);
            }

            function base64ToByteArray(base64String) {
                try {
                    var sliceSize = 1024;
                    var byteCharacters = atob(base64String);
                    var bytesLength = byteCharacters.length;
                    var slicesCount = Math.ceil(bytesLength / sliceSize);
                    var byteArrays = new Array(slicesCount);

                    for (var sliceIndex = 0; sliceIndex < slicesCount; ++sliceIndex) {
                        var begin = sliceIndex * sliceSize;
                        var end = Math.min(begin + sliceSize, bytesLength);

                        var bytes = new Array(end - begin);
                        for (var offset = begin, i = 0; offset < end; ++i, ++offset) {
                            bytes[i] = byteCharacters[offset].charCodeAt(0);
                        }
                        byteArrays[sliceIndex] = new Uint8Array(bytes);
                    }
                    return byteArrays;
                } catch (e) {
                    console.log("Couldn't convert to byte array: " + e);
                    return undefined;
                }
            }
        </script>

    </head>
    <body class="nav-md">
        <div class="container body">
            <div class="main_container">
                <jsp:include page="dashboardHeader.jsp"></jsp:include>

                    <div class="right_col" role="main" style="min-height: 2202px;">
                        <div class="">
                            <div class="clearfix"></div>
                            <div class="row">
                                <div class="col-md-12 col-sm-12 col-xs-12">
                                    <div class="x_panel">
                                        <div class="x_content">
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
                                            <div class="col-md-3 col-sm-3 col-xs-12 profile_left">
                                                <form  id="user_info">
                                                    <div class="profile_img">
                                                        <div id="crop-avatar">

                                                            <img class="img-responsive avatar-view img-circle" src="${user.photo}" alt="Avatar" title="Change the avatar">
                                                        </div>
                                                    </div>
                                                    <h3 id = "name">${user.name} ${user.surname}</h3>
                                                <ul class="list-unstyled user_data">
                                                    <li id="mail">
                                                        <i class="fa fa-briefcase fa-envelope" ></i> ${user.email}
                                                    </li>
                                                    <li class="m-top-xs">
                                                        <i class="fa fa-phone user-profile-icon"></i>
                                                        <a id="telephone">${user.phone}</a>
                                                    </li>
                                                    <li class="m-top-xs">
                                                        <i class="fa fa-birthday-cake user-profile-icon"></i>
                                                        <a id="bod">${user.birthday}</a>
                                                    </li>
                                                    <li class="m-top-xs">
                                                        <i class="fa fa-mars fa-ll user-profile-icon"></i>
                                                        <a id="gender">${user.gender}</a>
                                                    </li>
                                                </ul>
                                                <button data-toggle="modal" data-target="#editModal" type="button" class="btn btn-success"><i class="fa fa-edit m-right-xs"></i>Edit Profile</button>

                                                <br>
                                            </form>
                                        </div>

                                        <div class="modal fade bs-example-modal-lg" id="editModal" tabindex="-1" role="dialog" aria-hidden="true">
                                            <div class="modal-dialog modal-lg">
                                                <div class="modal-content">

                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span>
                                                        </button>
                                                        <h4 class="modal-title" id="myModalLabel">Edit profile</h4>
                                                    </div>
                                                    <div class="modal-body">

                                                        <form id="updateProfile" action="updateProfile" method="POST">
                                                            <input hidden id="result" name="result" value="">
                                                        </form>

                                                        <div class="row">
                                                            <div style="" class="col-xs-12 col-sm-12 col-md-12">

                                                                <div class="col text-center">
                                                                    <img class="img-thumbnail img-circle" id="myImg" src="static/images/user.png" alt="Avatar" title="Change the avatar">

                                                                </div>
                                                                <br>

                                                                <div class="col text-center">
                                                                    <a  class="buttonPrevious btn btn-success btn-xs" onClick="openPhotoPicker();" ><i style="margin-right: 7px" class="fa fa-upload"></i>Change Photo</a>                                                  
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <br>
                                                        <form id="demo-form2" data-parsley-validate="" class="form-horizontal form-label-left" novalidate="">
                                                            <div class="form-group">
                                                                <label  class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">First Name <span class="required">*</span></label>
                                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                                    <input disabled type="text" id="firstname"  required="required" class="form-control col-md-7 col-xs-12" value="${user.name} " >
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">Last Name <span class="required">*</span>
                                                                </label>
                                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                                    <input disabled type="text" id="lastname" name="last-name" required="required" class="form-control col-md-7 col-xs-12" value="${user.surname}">
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="" class="control-label col-md-3 col-sm-3 col-xs-12">Mail</label>
                                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                                    <input disabled="" id="email" class="form-control col-md-7 col-xs-12" type="text" name="middle-name" value="${user.email}">
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="control-label col-md-3 col-sm-3 col-xs-12">Gender</label>
                                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                                    <div id="" class="btn-group" data-toggle="buttons" >
                                                                        <label class="btn btn-default" data-toggle-class="btn-primary" id="genderMale" onClick="whichGender('Male')" data-toggle-passive-class="btn-default">
                                                                            <input type="radio" name="gender"  value="Yes" > &nbsp;Male&nbsp;
                                                                        </label>
                                                                        <label class="btn btn-default" data-toggle-class="btn-primary"  id="genderFemale"  onClick="whichGender('Female')" data-toggle-passive-class="btn-default">
                                                                            <input type="radio" name="gender" value="No" >Female
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" id="bod">Date Of Birth <span class="required">*</span>
                                                                </label>
                                                                <div class="col-md-3 col-sm-3 col-xs-12">
                                                                    <div class='input-group date' id='myDatepicker2'>
                                                                        <input type='text' placeholder="Date" value="${user.birthday}" id="birthday" class="form-control" />
                                                                        <span class="input-group-addon">
                                                                            <span class="glyphicon glyphicon-calendar"></span>
                                                                        </span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="" class="control-label col-md-3 col-sm-3 col-xs-12">Phone</label>
                                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                                    <input id="phone" class="form-control col-md-7 col-xs-12" type="text" name="middle-name" value="${user.phone}">
                                                                </div>
                                                            </div>

                                                        </form>

                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                        <button type="button" onclick="updateProfile()" class="btn btn-primary">Save changes</button>
                                                    </div>

                                                </div>
                                            </div>

                                            <div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-hidden="true" id="modalCropper">
                                                <div class="modal-dialog modal-lg">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <button type="button" class="close"  onClick="closeModal()" aria-label="Close"><span aria-hidden="true" >×</span>
                                                            </button>
                                                        </div>
                                                        <div class="modal-body">
                                                            <div class="container cropper" >
                                                                <div id="imgContainer" class="row">
                                                                    <div  class="img-container" >
                                                                        <img id="image" src="" alt="Picture">
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
                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                            <div class="profile_title">
                                                <div class="col-md-6 ">
                                                    <h2><i style="margin-right: 10px" class="fa fa-bell"></i>Notifications</h2>
                                                </div>
                                                <div class="col-md-6">
                                                    <div id="reportrange" class="pull-right" style="margin-top: 5px; background: #fff; cursor: pointer; padding: 5px 10px; border: 1px solid #E6E9ED">
                                                        <i class="glyphicon glyphicon-calendar fa fa-calendar"></i>
                                                        <span>November 5, 2019 - December 23, 2019</span> <b class="caret"></b>
                                                    </div>
                                                </div>
                                            </div>


                                            <div class="" role="tabpanel" data-example-id="togglable-tabs">
                                                <ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
                                                    <li role="presentation" class="active"><a href="#tab_content1" id="home-tab" role="tab" data-toggle="tab" aria-expanded="true">Recent Activity</a>
                                                    </li>
                                                </ul>
                                                <div id="myTabContent" class="tab-content">
                                                    <div role="tabpanel" class="tab-pane fade active in" id="tab_content1" aria-labelledby="home-tab">

                                                        <ul class="messages">

                                                            <li>
                                                                <img src="static/images/message.png" class="avatar" alt="Avatar">
                                                                <div class="message_date">
                                                                    <h3 class="date text-error">21</h3>
                                                                    <p class="month">May</p>
                                                                </div>
                                                                <div class="message_wrapper">
                                                                    <h4 class="heading">Bookingpetz Team</h4>
                                                                    <blockquote class="message">Welcome to Bookingpetz.com. Our aim is to give the best experience to pet owners by offering them a user-friendly platform which allows to find the most suitable services based on location, facilities and customer rating for their dogs and cats.</blockquote>
                                                                    <br>
                                                                </div>
                                                            </li>
                                                        </ul>
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
            </div>
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
        <!-- bootstrap-daterangepicker -->
        <script src="static/vendors/moment/min/moment.min.js"></script>
        <script src="static/vendors/bootstrap-daterangepicker/daterangepicker.js"></script>
        <!-- bootstrap-datetimepicker -->    
        <script src="static/vendors/bootstrap-datetimepicker/build/js/bootstrap-datetimepicker.min.js"></script>
        <!-- Cropper -->
        <script src="static/vendors/cropper/dist/cropper.min.js" type="text/javascript"></script>
        <script src="https://kit.fontawesome.com/3135afb4f3.js"></script>

        <script>
                                                                $('#myDatepicker').datetimepicker();

                                                                $('#myDatepicker2').datetimepicker({
                                                                    format: 'DD.MM.YYYY'
                                                                });

                                                                $('#myDatepicker3').datetimepicker({
                                                                    format: 'hh:mm A'
                                                                });

                                                                $('#myDatepicker4').datetimepicker({
                                                                    ignoreReadonly: true,
                                                                    allowInputToggle: true
                                                                });

                                                                $('#datetimepicker6').datetimepicker();

                                                                $('#datetimepicker7').datetimepicker({
                                                                    useCurrent: false
                                                                });

                                                                $("#datetimepicker6").on("dp.change", function (e) {
                                                                    $('#datetimepicker7').data("DateTimePicker").minDate(e.date);
                                                                });

                                                                $("#datetimepicker7").on("dp.change", function (e) {
                                                                    $('#datetimepicker6').data("DateTimePicker").maxDate(e.date);
                                                                });
        </script>
    </body>
</html>

