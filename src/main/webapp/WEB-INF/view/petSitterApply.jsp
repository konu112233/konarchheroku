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

        <link href="static/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="static/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
        <link href="static/vendors/build/css/custom.min.css" rel="stylesheet">
        <link href="static/vendors/iCheck/skins/flat/green.css" rel="stylesheet">
        <link href="static/vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">


        <!-- NProgress -->
        <link href="static/vendors/nprogress/nprogress.css" rel="stylesheet">
        <!-- Switchery -->
        <link href="static/vendors/switchery/dist/switchery.min.css" rel="stylesheet">

    </head>
    <style>
        ul { padding:0 } 
    </style>
    <body class="nav-md">
        <div class="container body">
            <div class="main_container">
                <jsp:include page="dashboardHeader.jsp"></jsp:include>

                    <div class="right_col" role="main">

                        <div class="">

                            <div class="clearfix"></div>
                            <div class="row">
                                <div class="col-md-12 col-sm-12 col-xs-12">
                                    <div class="x_panel">
                                        <div class="x_title">
                                            <h3><strong>Become a Petsitter</strong> <small></small></h3>

                                            <div class="clearfix"></div>
                                        </div>
                                        <div class="x_content">
                                            <p>This is a basic form wizard example that inherits the colors from the selected scheme.</p>
                                            <div id="wizard" class="form_wizard wizard_horizontal">
                                                <ul class="wizard_steps">
                                                    <li>
                                                        <a href="#step-1">
                                                            <span class="step_no">1</span>
                                                            <span class="step_descr">
                                                                Account<br />
                                                                <!--         <small>Create your pet sitter account</small>  --> 
                                                            </span>
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="#step-2">
                                                            <span class="step_no">2</span>
                                                            <span class="step_descr">
                                                                Details<br />
                                                                <!--        <small>My personal details</small>  --> 
                                                            </span>
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="#step-3">
                                                            <span class="step_no">3</span>
                                                            <span class="step_descr">
                                                                Services<br />
                                                                <!--            <small>My services</small>  --> 
                                                            </span>
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="#step-4">
                                                            <span class="step_no">4</span>
                                                            <span class="step_descr">
                                                                My home<br />
                                                                <!--             <small>Home details</small>  --> 
                                                            </span>
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="#step-5">
                                                            <span class="step_no">5</span>
                                                            <span class="step_descr">
                                                                Confirmation<br />
                                                                <!--             <small>Home details</small>  --> 
                                                            </span>
                                                        </a>
                                                    </li>


                                                </ul>
                                                <div id="step-1">
                                                    <div class="x_panel">         
                                                        <div class="x_content">
                                                            <br />
                                                            <form class="form-horizontal form-label-left">
                                                                <div class="form-group">
                                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Address <span class="required">*</span>
                                                                    </label>
                                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                                        <input type="text" id="first-name2" required="required" class="form-control col-md-7 col-xs-12">
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label  col-md-3 col-sm-3 col-xs-12" for="first-name">Post code <span class="required">*</span>
                                                                    </label>
                                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                                        <input type="text" id="first-name2" required="required" class="form-control col-md-7 col-xs-12">
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label  col-md-3 col-sm-3 col-xs-12" for="first-name">City <span class="required">*</span>
                                                                    </label>
                                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                                        <input type="text" id="first-name2" required="required" class="form-control col-md-7 col-xs-12">
                                                                    </div>
                                                                </div>

                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div id="step-2">
                                                    <div class="x_panel">         
                                                        <div class="x_content">
                                                            <form class="form-horizontal form-label-left">
                                                                <div class="form-group">
                                                                    <label class="control-label  col-md-3 col-sm-3 col-xs-12" for="first-name">Title of your profile <span class="required">*</span>
                                                                    </label>
                                                                    <div class=" col-md-6 col-sm-6 col-xs-12">
                                                                        <input type="text" id="first-name2" required="required" class="form-control col-md-7 col-xs-12">
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12">Date of Birth</label>
                                                                    <div class="col-md-6 col-sm-6 col-xs-12">
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
                                                                                <input type="radio" class="flat" checked name="iCheck"> Yes
                                                                            </label>
                                                                        </div>
                                                                        <div class="radio">
                                                                            <label>
                                                                                <input type="radio" class="flat" name="iCheck"> No
                                                                            </label>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </form>
                                                        </div>
                                                    </div>

                                                </div>
                                                <div id="step-3">
                                                    <div class="x_panel">         
                                                        <div class="x_content">


                                                            <form class="form-horizontal form-label-left">


                                                                <div class="col-md-12 col-sm-12 col-xs-12">

                                                                    <div class="col-md-3 "></div>
                                                                    <div class=" col-md-6">
                                                                        <div class="" role="tabpanel" data-example-id="togglable-tabs">
                                                                            <ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
                                                                                <li role="presentation" class="active"><a href="#tab_content1" id="home-tab" role="tab" data-toggle="tab" aria-expanded="true">In my home</a>
                                                                                </li>
                                                                                <li role="presentation" class=""><a href="#tab_content2" role="tab" id="profile-tab" data-toggle="tab" aria-expanded="false">Visits or walk</a>
                                                                                </li>
                                                                                <li role="presentation" class=""><a href="#tab_content3" role="tab" id="profile-tab2" data-toggle="tab" aria-expanded="false">In the owner's home</a>
                                                                                </li>
                                                                            </ul>
                                                                            <div id="myTabContent" class="tab-content">
                                                                                <div role="tabpanel" class="tab-pane fade active in" id="tab_content1" aria-labelledby="home-tab">
                                                                                    <div class="form-group">
                                                                                        <label  style="text-align:left;" class="col-md-8 col-sm-3 col-xs-12 control-label">I can board pets in my home
                                                                                            <br>

                                                                                        </label>

                                                                                        <div class="col-md-4 col-sm-9 col-xs-12">
                                                                                            <div class="checkbox">
                                                                                                <label>
                                                                                                    <input type="checkbox" class="flat"> Yes
                                                                                                </label>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="form-group">
                                                                                        <label style="text-align:left;" class="col-md-8 col-sm-3 col-xs-12 control-label">I can pick up and drop off the pet at the owner's home
                                                                                            <br>

                                                                                        </label>

                                                                                        <div class="col-md-4 col-sm-9 col-xs-12">
                                                                                            <div class="checkbox">
                                                                                                <label>
                                                                                                    <input type="checkbox" class="flat"> Yes
                                                                                                </label>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="form-group">
                                                                                        <label style="text-align:left;" class="col-md-8 col-sm-3 col-xs-12 control-label">I agree to sit only one pet at a time if requested by the owner(additional payment of €15)
                                                                                            <br>

                                                                                        </label>

                                                                                        <div class="col-md-4 col-sm-9 col-xs-12">
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
                                                                                        <label style="text-align:left;" class="col-md-8 col-sm-3 col-xs-12 control-label">I can visit pets in their home
                                                                                            <br>
                                                                                        </label>
                                                                                        <div class="col-md-4 col-sm-9 col-xs-12">
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
                                                                                        <label style="text-align:left;" class="col-md-8 col-sm-3 col-xs-12 control-label">I can do sittings in the owner's home
                                                                                            <br>

                                                                                        </label>

                                                                                        <div class="col-md-4 col-sm-9 col-xs-12">
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
                                                                    <div class="col-md-3"></div>

                                                                </div>


                                                            </form>
                                                        </div>
                                                    </div>


                                                </div>
                                                <div id="step-4">
                                                    <div class="x_panel">         
                                                        <div class="x_content">

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
                                                                                <input type="radio" class="flat" checked name="iCheck"> Yes
                                                                            </label>
                                                                        </div>
                                                                        <div class="radio">
                                                                            <label>
                                                                                <input type="radio" class="flat" name="iCheck"> No
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
                                                    <h2 class="StepTitle">Confirmation</h2>
                                                    <div class="x_panel">         
                                                        <div class="jumbotron">
                                                            <h1 class="display-4 text-center">CONGRATULATIONS!</h1>
                                                            <p class="lead text-center">This is a simple hero unit, a simple jumbotron-style component for calling extra attention to featured content or information.</p>
                                                            <hr class="my-4">
                                                            <p class="text-center">Many thanks for your interest in Bookingpetz !</p>
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
        <!-- validator -->
        <script src="static/vendors/validator/validator.js"></script>
        <!-- jQuery Smart Wizard -->
        <script src="static/vendors/jQuery-Smart-Wizard/js/jquery.smartWizard.js"></script>
        <!-- Custom Theme Scripts -->
        <script src="static/vendors/build/js/custom.min.js"></script>
        <!-- iCheck -->
        <script src="static/vendors/iCheck/icheck.min.js"></script>
        <script src="https://kit.fontawesome.com/3135afb4f3.js"></script>
    </body>
</html>
