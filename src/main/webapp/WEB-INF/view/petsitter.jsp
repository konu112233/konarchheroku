<%-- 
    Document   : petsitter
    Created on : Jul 18, 2019, 3:42:08 PM
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

        <link href="static/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="static/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
        <link href="static/vendors/build/css/custom.min.css" rel="stylesheet">
        <!-- NProgress -->
        <link href="static/vendors/nprogress/nprogress.css" rel="stylesheet">
        <!-- Switchery -->
        <link href="static/vendors/switchery/dist/switchery.min.css" rel="stylesheet">

    </head>
    <body class="nav-md">
        <div class="container body">
            <div class="main_container">
                <jsp:include page="dashboardHeader.jsp"></jsp:include>

                    <div class="right_col" role="main">

                        <!-- Smart Wizard -->
                        <p class="h4 text-center">Complete your profile !</p>
                        <div id="wizard" class="form_wizard wizard_horizontal">
                            <ul class="wizard_steps">
                                <li>
                                    <a href="#step-1">
                                        <span class="step_no">1</span>
                                        <span class="step_descr">
                                            Account<br />
                                            <small>Create your pet sitter account</small>
                                        </span>
                                    </a>
                                </li>
                                <li>
                                    <a href="#step-2">
                                        <span class="step_no">2</span>
                                        <span class="step_descr">
                                            Details<br />
                                            <small>My personal details</small>
                                        </span>
                                    </a>
                                </li>
                                <li>
                                    <a href="#step-3">
                                        <span class="step_no">3</span>
                                        <span class="step_descr">
                                            Services<br />
                                            <small>My services</small>
                                        </span>
                                    </a>
                                </li>
                                <li>
                                    <a href="#step-4">
                                        <span class="step_no">4</span>
                                        <span class="step_descr">
                                            My home details<br />
                                            <small>Home details</small>
                                        </span>
                                    </a>
                                </li>
                                <li>
                                    <a href="#step-5">
                                        <span class="step_no">5</span>
                                        <span class="step_descr">
                                            My Pets<br />
                                            <small>Pets</small>
                                        </span>
                                    </a>
                                </li>
                                <li>
                                    <a href="#step-6">
                                        <span class="step_no">6</span>
                                        <span class="step_descr">
                                            Confirmation<br />
                                            <small>Complete your account</small>
                                        </span>
                                    </a>
                                </li>
                            </ul>
                            <div id="step-1">
                                <h2 class="StepTitle">Account</h2>
                                <div class="x_panel">         
                                    <div class="x_content">
                                        <br />

                                        <h4>Account</h4>

                                        <form class="form-horizontal form-label-left">
                                            <div class="form-group">
                                                <label class="control-label col-md-3" for="first-name">Address <span class="required">*</span>
                                                </label>
                                                <div class="col-md-6">
                                                    <input type="text" id="first-name2" required="required" class="form-control col-md-7 col-xs-12">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3" for="first-name">Post code <span class="required">*</span>
                                                </label>
                                                <div class="col-md-6">
                                                    <input type="text" id="first-name2" required="required" class="form-control col-md-7 col-xs-12">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3" for="first-name">City <span class="required">*</span>
                                                </label>
                                                <div class="col-md-6">
                                                    <input type="text" id="first-name2" required="required" class="form-control col-md-7 col-xs-12">
                                                </div>
                                            </div>

                                        </form>
                                    </div>
                                </div>

                            </div>
                            <div id="step-2">
                                <h2 class="StepTitle">Details</h2>
                                <div class="x_panel">         
                                    <div class="x_content">
                                        <br />

                                        <h4>My Personal Details</h4>
                                        <p class="font-gray-dark">
                                            Let tell about yourself !
                                        </p>
                                        <form class="form-horizontal form-label-left">
                                            <div class="form-group">
                                                <label class="control-label col-md-3" for="first-name">Title of your profile <span class="required">*</span>
                                                </label>
                                                <div class="col-md-6">
                                                    <input type="text" id="first-name2" required="required" class="form-control col-md-7 col-xs-12">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-3">Date of Birth</label>
                                                <div class="col-md-2 col-sm-2 col-xs-5">
                                                    <input type="text" class="form-control" data-inputmask="'mask': '99/99/9999'">
                                                    <span class="fa fa-user form-control-feedback right" aria-hidden="true"></span>
                                                </div>
                                            </div>
                                            <div class="item form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="textarea">Describe yourself and motivations <span class="required">*</span>
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <textarea id="textarea" required="required" name="textarea" class="form-control col-md-7 col-xs-12"></textarea>
                                                </div>
                                            </div>
                                            <div class="item form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="textarea">Describe your typical petsitting day <span class="required">*</span>
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <textarea id="textarea" required="required" name="textarea" class="form-control col-md-7 col-xs-12"></textarea>
                                                </div>
                                            </div>

                                            <div class="item form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="textarea">Employment status *</label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <select id="heard" class="form-control" required>
                                                        <option value="">Employed</option>
                                                        <option value="press">Unemployed</option>
                                                        <option value="net">Retired</option>
                                                        <option value="mouth">Student</option>
                                                    </select>
                                                </div>

                                            </div>

                                            <div class="form-group">
                                                <label class="col-md-3 col-sm-3 col-xs-12 control-label">Smoke *</label>
                                                <div class="col-md-9 col-sm-9 col-xs-12">
                                                    <div class="radio">
                                                        <label>
                                                            <input type="radio" checked="" value="option1" id="optionsRadios1" name="optionsRadios" required="required"> Yes
                                                        </label>
                                                    </div>
                                                    <div class="radio">
                                                        <label>
                                                            <input type="radio" value="option2" id="optionsRadios2" name="optionsRadios" required="required"> No
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <div id="step-3">
                                <h2 class="StepTitle">Services</h2>
                                <div class="x_panel">         
                                    <div class="x_content">
                                        <br />

                                        <h4>Services</h4>

                                        <form class="form-horizontal form-label-left">

                                            <div class="">
                                                <div class="col-md-12 col-sm-6 col-xs-12">
                                                    <div class="x_panel">

                                                        <div class="x_content">


                                                            <div class="" role="tabpanel" data-example-id="togglable-tabs">
                                                                <ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
                                                                    <li role="presentation" class="active"><a href="#tab_content1" id="home-tab" role="tab" data-toggle="tab" aria-expanded="true">Boarding in my home</a>
                                                                    </li>
                                                                    <li role="presentation" class=""><a href="#tab_content2" role="tab" id="profile-tab" data-toggle="tab" aria-expanded="false">Visits or walk</a>
                                                                    </li>
                                                                    <li role="presentation" class=""><a href="#tab_content3" role="tab" id="profile-tab2" data-toggle="tab" aria-expanded="false">Overnight sitting in the owner's home</a>
                                                                    </li>
                                                                </ul>
                                                                <div id="myTabContent" class="tab-content">
                                                                    <div role="tabpanel" class="tab-pane fade active in" id="tab_content1" aria-labelledby="home-tab">

                                                                        <div class="form-group">
                                                                            <label class="col-md-3 col-sm-3 col-xs-12 control-label">I can board pets in my home
                                                                                <br>

                                                                            </label>

                                                                            <div class="col-md-9 col-sm-9 col-xs-12">
                                                                                <div class="checkbox">
                                                                                    <label>
                                                                                        <input type="checkbox" class="flat"> Yes
                                                                                    </label>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label class="col-md-3 col-sm-3 col-xs-12 control-label">I can pick up and drop off the pet at the owner's home
                                                                                <br>

                                                                            </label>

                                                                            <div class="col-md-9 col-sm-9 col-xs-12">
                                                                                <div class="checkbox">
                                                                                    <label>
                                                                                        <input type="checkbox" class="flat"> Yes
                                                                                    </label>
                                                                                </div>
                                                                            </div>
                                                                        </div>

                                                                        <div class="form-group">
                                                                            <label class="col-md-3 col-sm-3 col-xs-12 control-label">I agree to sit only one pet at a time if requested by the owner(additional payment of Ä15)
                                                                                <br>

                                                                            </label>

                                                                            <div class="col-md-9 col-sm-9 col-xs-12">
                                                                                <div class="checkbox">
                                                                                    <label>
                                                                                        <input type="checkbox" class="flat"> Yes
                                                                                    </label>
                                                                                </div>
                                                                            </div>
                                                                        </div>

                                                                    </div>
                                                                    <div role="tabpanel" class="tab-pane fade" id="tab_content2" aria-labelledby="profile-tab">
                                                                        <div class="form-group">
                                                                            <label class="col-md-3 col-sm-3 col-xs-12 control-label">I can visit pets in their home
                                                                                <br>

                                                                            </label>

                                                                            <div class="col-md-9 col-sm-9 col-xs-12">
                                                                                <div class="checkbox">
                                                                                    <label>
                                                                                        <input type="checkbox" class="flat"> Yes
                                                                                    </label>
                                                                                </div>
                                                                            </div>
                                                                        </div>  
                                                                    </div>
                                                                    <div role="tabpanel" class="tab-pane fade" id="tab_content3" aria-labelledby="profile-tab">
                                                                        <div class="form-group">
                                                                            <label class="col-md-3 col-sm-3 col-xs-12 control-label">I can do sittings in the owner's home
                                                                                <br>

                                                                            </label>

                                                                            <div class="col-md-9 col-sm-9 col-xs-12">
                                                                                <div class="checkbox">
                                                                                    <label>
                                                                                        <input type="checkbox" class="flat"> Yes
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


                                        </form>
                                    </div>
                                </div>
                            </div>
                            <div id="step-4">
                                <h2 class="StepTitle">Step My Home Details</h2>
                                <div class="x_panel">         
                                    <div class="x_content">
                                        <br />

                                        <h4>My Personal Details</h4>

                                        <form class="form-horizontal form-label-left">
                                            <div class="item form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="textarea">Home *</label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <select id="heard" class="form-control" required>
                                                        <option value="">Select type of accommodation</option>
                                                        <option value="press">House</option>
                                                        <option value="net">Flat</option>

                                                    </select>
                                                </div>

                                            </div>

                                            <div class="item form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="textarea">Outside *</label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <select id="heard" class="form-control" required>
                                                        <option value="">Select type of accommodation</option>
                                                        <option value="press">Private garden</option>
                                                        <option value="net">None</option>

                                                    </select>
                                                </div>

                                            </div>

                                            <div class="form-group">
                                                <label class="col-md-3 col-sm-3 col-xs-12 control-label">Window secure balcony *</label>
                                                <div class="col-md-9 col-sm-9 col-xs-12">
                                                    <div class="radio">
                                                        <label>
                                                            <input type="radio" checked="" value="option1" id="optionsRadios1" name="optionsRadios" required="required"> Yes
                                                        </label>
                                                    </div>
                                                    <div class="radio">
                                                        <label>
                                                            <input type="radio" value="option2" id="optionsRadios2" name="optionsRadios" required="required"> No
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="item form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="number">Number of rooms<span class="required"> *</span>
                                                </label>
                                                <div class="col-md-1 col-sm-1 col-xs-12">
                                                    <input type="number" id="number" name="number" required="required" data-validate-minmax="10,100" class="form-control col-md-7 col-xs-12">
                                                </div>
                                            </div>

                                            <div class="item form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="number">Number of rooms the pet can use<span class="required"> *</span>
                                                </label>
                                                <div class="col-md-1 col-sm-1 col-xs-12">
                                                    <input type="number" id="number" name="number" required="required" data-validate-minmax="10,100" class="form-control col-md-7 col-xs-12">
                                                </div>
                                            </div>



                                            <div class="item form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="textarea">Description of your home <span class="required">*</span>
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <textarea id="textarea" required="required" name="textarea" placeholder="75 characters min." class="form-control col-md-7 col-xs-12"></textarea>
                                                </div>
                                            </div>

                                        </form>
                                    </div>
                                </div>
                            </div>
                            <div id="step-5">
                                <h2 class="StepTitle">My Pets</h2>
                                <div class="x_panel">         
                                    <div class="x_content badge badge-secondary">
                                        <br />

                                        <h4>Add the pets you have in your home</h4>


                                        <h1 class="text-center">You haven't added any pets to your profile yet !</h1>
                                        <hr class="my-4">

                                        <button type="button" class="btn btn-lg btn-success">Add a pet</button>

                                        <button type="button" class="btn btn-lg btn-success float-right">Confirm my registration</button>

                                    </div>
                                </div>                
                            </div>
                            <div id="step-6">
                                <h2 class="StepTitle">Confirmation</h2>
                                <div class="x_panel">         
                                    <div class="jumbotron">
                                        <h1 class="display-4 text-center">CONGRATULATIONS!</h1>
                                        <p class="lead text-center">This is a simple hero unit, a simple jumbotron-style component for calling extra attention to featured content or information.</p>
                                        <hr class="my-4">
                                        <p class="text-center">Many thanks for your interest in Bookingpetz !</p>
                                        <a class="btn btn-success btn-lg" href="#" role="button">Go to my dashboard</a>
                                    </div>

                                </div>
                            </div>                
                        </div>
                    </div>
                    <!-- End SmartWizard Content -->


                </div>

            <jsp:include page="dashboardFooter.jsp"></jsp:include>
        </div>
    </div>


    <script src="https://ajax.cloudflare.com/cdn-cgi/scripts/a2bd7673/cloudflare-static/rocket-loader.min.js" data-cf-settings="53fb5546d8872ed72f1ff495-|49" defer=""></script>
    <script src="https://kit.fontawesome.com/3135afb4f3.js"></script>


    <!-- jQuery Smart Wizard -->
    <script src="static/vendors/jQuery-Smart-Wizard/js/jquery.smartWizard.js"></script>
    <!-- jQuery -->
    <script src="static/vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="static/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- FastClick -->
    <script src="static/vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="static/vendors/nprogress/nprogress.js"></script>
    <!-- bootstrap-daterangepicker -->
    <script src="static/vendors/moment/min/moment.min.js"></script>
    <script src="static/vendors/bootstrap-daterangepicker/daterangepicker.js"></script>
    <!-- bootstrap-datetimepicker -->    
    <script src="static/vendors/bootstrap-datetimepicker/build/js/bootstrap-datetimepicker.min.js"></script>
    <!-- Ion.RangeSlider -->
    <script src="static/vendors/ion.rangeSlider/js/ion.rangeSlider.min.js"></script>
    <!-- Bootstrap Colorpicker -->
    <script src="static/vendors/mjolnic-bootstrap-colorpicker/dist/js/bootstrap-colorpicker.min.js"></script>
    <!-- jquery.inputmask -->
    <script src="static/vendors/jquery.inputmask/dist/min/jquery.inputmask.bundle.min.js"></script>
    <!-- jQuery Knob -->
    <script src="static/vendors/jquery-knob/dist/jquery.knob.min.js"></script>
    <!-- Cropper -->
    <script src="static/vendors/cropper/dist/cropper.min.js"></script>
    <!-- Switchery -->
    <script src="static/vendors/switchery/dist/switchery.min.js"></script>

    <!-- Custom Theme Scripts -->
    <script src="static/build/js/custom.min.js"></script>

    <!-- Initialize datetimepicker -->
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

