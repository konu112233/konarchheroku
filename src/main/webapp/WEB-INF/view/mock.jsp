<%-- 
    Document   : mock
    Created on : Jul 7, 2019, 2:19:17 PM
    Author     : burakzengin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Meta, title, CSS, favicons, etc. -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>Gentelella Alela! | </title>

        <!-- Bootstrap core CSS -->
        <link href="static/aaa/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://kit.fontawesome.com/3135afb4f3.js"></script>
        <!-- Material Design Bootstrap -->
        <link href="static/aaa/css/mdb.min.css" rel="stylesheet">

        <style>
            .form-elegant .font-small {
                font-size: 0.8rem; }

            .form-elegant .z-depth-1a {
                -webkit-box-shadow: 0 2px 5px 0 rgba(55, 161, 255, 0.26), 0 4px 12px 0 rgba(121, 155, 254, 0.25);
                box-shadow: 0 2px 5px 0 rgba(55, 161, 255, 0.26), 0 4px 12px 0 rgba(121, 155, 254, 0.25); 
            }

            .form-elegant .z-depth-1-half,
            .form-elegant .btn:hover {
                -webkit-box-shadow: 0 5px 11px 0 rgba(85, 182, 255, 0.28), 0 4px 15px 0 rgba(36, 133, 255, 0.15);
                box-shadow: 0 5px 11px 0 rgba(85, 182, 255, 0.28), 0 4px 15px 0 rgba(36, 133, 255, 0.15); 
            }

            .form-elegant .modal-header {
                border-bottom: none; 
            }

            .modal-dialog .form-elegant .btn .fab {
                color: #2196f3!important; 
            }
            .form-elegant .modal-body, .form-elegant .modal-footer {
                font-weight: 400; 
            }
        </style>
    </head>

    <body>

        <!-- Modal -->
        <div class="modal fade" id="elegantModalForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <!--Content-->
                <div class="modal-content form-elegant">
                    <!--Header-->
                    <div class="modal-header text-center">
                        <h3 class="modal-title w-100 dark-grey-text font-weight-bold my-3" id="myModalLabel"><strong>Sign in</strong></h3>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <!--Body-->
                    <div class="modal-body mx-4">
                        <!--Body-->
                        <div class="md-form mb-5">
                            <input type="email" id="Form-email1" class="form-control validate">
                            <label data-error="wrong" data-success="right" for="Form-email1">Your email</label>
                        </div>

                        <div class="md-form pb-3">
                            <input type="password" id="Form-pass1" class="form-control validate">
                            <label data-error="wrong" data-success="right" for="Form-pass1">Your password</label>
                            <p class="font-small blue-text d-flex justify-content-end">Forgot <a href="#" class="blue-text ml-1">
                                    Password?</a></p>
                        </div>

                        <div class="text-center mb-3">
                            <button type="button" class="btn blue-gradient btn-block btn-rounded z-depth-1a">Sign in</button>
                        </div>
                        <p class="font-small dark-grey-text text-right d-flex justify-content-center mb-3 pt-2"> or Sign in
                            with:</p>

                        <div class="row my-3 d-flex justify-content-center">
                            <!--Facebook-->
                            <button type="button" class="btn btn-white btn-rounded mr-md-3 z-depth-1a"><i class="fab fa-facebook-f text-center"></i></button>
                            <!--Twitter-->
                            <button type="button" class="btn btn-white btn-rounded mr-md-3 z-depth-1a"><i class="fab fa-twitter"></i></button>
                            <!--Google +-->
                            <button type="button" class="btn btn-white btn-rounded z-depth-1a"><i class="fab fa-google-plus-g"></i></button>
                        </div>
                    </div>
                    <!--Footer-->
                    <div class="modal-footer mx-5 pt-3 mb-1">
                        <p class="font-small grey-text d-flex justify-content-end">Not a member? <a href="#" class="blue-text ml-1">
                                Sign Up</a></p>
                    </div>
                </div>
                <!--/.Content-->
            </div>
        </div>
        <!-- Modal -->

        <div class="text-center">
            <a href="" class="btn btn-default btn-rounded" data-toggle="modal" data-target="#elegantModalForm">Launch
                modal Login Form</a>
        </div>

        <!-- JQuery -->
        <script src="static/aaa/js/jquery-3.4.1.min.js"></script>
        <!-- Bootstrap core JavaScript -->
        <script src="static/aaa/js/bootstrap.min.js"></script>
    </body>
</html>