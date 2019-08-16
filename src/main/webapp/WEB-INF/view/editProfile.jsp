<%-- 
    Document   : newjsp
    Created on : Jul 28, 2019, 4:37:09 PM
    Author     : omerfarukoner
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
        <!-- iCheck -->
        <link href="static/vendors/iCheck/skins/flat/green.css" rel="stylesheet">

        <!-- sLİDE -->
        <link rel="stylesheet" href="static/vendors/responsive-slides/responsiveslides.css">
        <link rel="stylesheet" href="static/vendors/responsive-slides/demo.css">
        <script src="//ajax.googleapis.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
        <script src="static/vendors/responsive-slides/responsiveslides.min.js"></script>

        <link href="static/vendors/cropper/dist/cropper.min.css" rel="stylesheet">

    </head>
    <style>



        .modal-dialog{
            position: relative;
            display: table; /* <-- This makes the trick */
            overflow-y: auto;    
            overflow-x: auto;
            width: auto;
            min-width: 200px;   
        }

        canvas {
            height: 350px;
            width: 350px;

        }

    </style>
    <script>
        // Modal
        $(function () {
            // display if image has a src
            $('#image').load(function () {
                var imageObj = $(this);

                if (!(imageObj.width() == 1 && imageObj.height() == 1)) {
                    console.log('Image source changed');
                    $('#cropper').css("display", "block");
                    $('#imgContainer').css("display", "block");
                }
            });

            // Get the modal
            var modal = document.getElementById("cropper");

            // Get the button that opens the modal
            var btn = document.getElementById("cropperButton");
            // Get the <span> element that closes the modal
            var span = document.getElementsByClassName("close")[0];
            // When the user clicks on the button, open the modal 
            btn.onclick = function () {

                $('#btnSquare').trigger('click');
                $('#btnUploadClick').trigger('click');
            };
            // When the user clicks on <span> (x), close the modal
            span.onclick = function () {
                modal.style.display = "none";

            };
            // When the user clicks anywhere outside of the modal, close it
            window.onclick = function (event) {
                if (event.target === modal) {
                    modal.style.display = "none";

                }
            };
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


            var dataURI = document.getElementById("download").href;


            var imgProfile = $("#profilePhoto").attr("src", dataURI);
            imgProfile.attr("width", "250");
            imgProfile.attr("height", "250");

            console.log("dataUri::" + dataURI);
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

        // Upload button listener
        $(function () {
            $('#image').load(function () {
                var imageObj = $(this);

                if (!(imageObj.width() == 1 && imageObj.height() == 1)) {
                    console.log('Image source changed');
                    $('#cropper').css("display", "block");
                    $('#imgContainer').css("display", "block");
                }
            });
        });
    </script>

    <body class="nav-md">
        <div class="container body">

            <div class="main_container">
                <jsp:include page="dashboardHeader.jsp"></jsp:include>
                    <div class="right_col" role="main">
                        <div class="clearfix"></div>
                        <br>    
                        <div >
                            <div class="x_panel">         
                                <div class="x_content">
                                    <div class="x_title">
                                        <h2>Profile Edit</h2>
                                        <div class="clearfix"></div>
                                    </div>                                 
                                    <div class="container cropper modal" id="cropper" width="50px ! important" style="display:none">
                                        <div class="modal-content">
                                            <div class="modal-header"><span class="close">&times;</span></div>
                                            <div class="modal-body">

                                                <div class="row">
                                                    <div id="imgContainer" class="img-container" style="display:none;">
                                                        <img id="image"  alt="Picture">
                                                    </div>

                                                </div>
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

                                                            <button type="button"   class="btn btn-success" data-method="getCroppedCanvas" >
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
                                                        <div class="modal fade docs-cropped" id="getCroppedCanvasModal" aria-hidden="true" aria-labelledby="getCroppedCanvasTitle" role="dialog" tabindex="-1">
                                                            <div class="modal-dialog">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                                        <h4 class="modal-title" id="getCroppedCanvasTitle">Cropped</h4>
                                                                    </div>
                                                                    <div class="modal-body"></div>
                                                                    <div class="modal-footer">
                                                                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                                        <a class="btn btn-primary" onclick="addImage();" id="download" href="javascript:void(0);"data-dismiss="modal" >Upload</a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div><!-- /.modal -->
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="x_content">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="col-md-4">
                                                </div>
                                                <div class="col-md-4">
                                                    <img class="img-responsive img-thumbnail img-circle" id="profilePhoto" src="static/images/profil_photo_220x220.jpeg" alt="Avatar" title="Change the avatar">
                                                    <br>
                                                    <br>
                                                    <div class="row"  >
                                                        <div class="col-md-2">

                                                        </div>
                                                        <a class="buttonPrevious btn btn-primary" id="cropperButton">Change Photo</a>

                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                </div>
                                            </div>
                                        </div>
                                        <br>
                                        <form id="demo-form2" data-parsley-validate="" class="form-horizontal form-label-left" novalidate="">
                                            <div class="form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">First Name <span class="required">*</span></label>

                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <input type="text" id="first-name"  required="required" class="form-control col-md-7 col-xs-12">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">Last Name <span class="required">*</span>
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <input type="text" id="last-name" name="last-name" required="required" class="form-control col-md-7 col-xs-12">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="middle-name" class="control-label col-md-3 col-sm-3 col-xs-12">Middle Name / Initial</label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <input id="middle-name" class="form-control col-md-7 col-xs-12" type="text" name="middle-name">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12">Gender</label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <div id="gender" class="btn-group" data-toggle="buttons">
                                                        <label class="btn btn-default" data-toggle-class="btn-primary" data-toggle-passive-class="btn-default">
                                                            <input checked type="radio" name="gender" value="male" data-parsley-multiple="gender"> &nbsp; Male &nbsp;
                                                        </label>
                                                        <label class="btn btn-primary" data-toggle-class="btn-primary" data-toggle-passive-class="btn-default">
                                                            <input type="radio" name="gender" value="female" data-parsley-multiple="gender"> Female
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" id="bod">Date Of Birth <span class="required">*</span>
                                                </label>
                                                <div class="col-md-2 col-sm-2 col-xs-12">
                                                    <input type="text"  class="form-control text-center" id="single_cal3" placeholder="Date" aria-describedby="inputSuccess2Status2">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="" class="control-label col-md-3 col-sm-3 col-xs-12">Phone</label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <input id="telephone" class="form-control col-md-7 col-xs-12" type="text" name="middle-name">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="" class="control-label col-md-3 col-sm-3 col-xs-12">Mail</label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <input id="mail" class="form-control col-md-7 col-xs-12" type="text" name="middle-name">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="" class="control-label col-md-3 col-sm-3 col-xs-12">Address</label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <input id="address" class="form-control col-md-7 col-xs-12" type="text" name="middle-name">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="" class="control-label col-md-3 col-sm-3 col-xs-12">Post code</label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <input id="middle-name" class="form-control col-md-7 col-xs-12" type="text" name="middle-name">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="" class="control-label col-md-3 col-sm-3 col-xs-12">City</label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <input id="middle-name" class="form-control col-md-7 col-xs-12" type="text" name="middle-name">
                                                </div>
                                            </div>

                                            <div class="ln_solid"></div>
                                            <div class="form-group">
                                                <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-6">
                                                    <button class="btn btn-primary" type="button">Cancel</button>
                                                    <button class="btn btn-primary" type="reset">Reset</button>
                                                    <button type="submit" class="btn btn-success">Save</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            <jsp:include page="dashboardFooter.jsp"></jsp:include>
            
            <!-- Geodate-->
            <script src="//geodata.solutions/includes/countrystatecity.js"></script>
            <!-- jQuery -->
            <script src="static/vendors/jquery/dist/jquery.min.js"></script>
            <!-- Bootstrap -->
            <script src="static/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
            <!-- FastClick -->
            <script src="static/vendors/fastclick/lib/fastclick.js"></script>
            <!-- NProgress -->
            <script src="static/vendors/nprogress/nprogress.js"></script>
            <!-- validator -->
            <script src="static/vendors/validator/validator.js"></script>
            <!-- jQuery Smart Wizard -->
            <script src="static/vendors/jQuery-Smart-Wizard/js/jquery.smartWizard.js"></script>
            <!-- Custom Theme Scripts -->
            <script src="static/vendors/build/js/custom.js"></script>
            <!-- iCheck -->
            <script src="static/vendors/iCheck/icheck.min.js"></script>
            <!-- FullCalendar -->
            <script src="static/vendors/moment/min/moment.min.js"></script>
            <script src="static/vendors/fullcalendar/dist/fullcalendar.min.js"></script>
            <!--Slider-->
            <script src="static/vendors/responsive-slides/responsiveslides.min.js"></script>
            <script src="static/vendors/cropper/dist/cropper.min.js" type="text/javascript"></script>
            <script src="https://kit.fontawesome.com/3135afb4f3.js"></script>
    </body>
</html>

