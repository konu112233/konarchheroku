<%-- 
    Document   : myPets
    Created on : Jul 12, 2019, 12:32:51 PM
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
        <link href="static/vendors/nprogress/nprogress.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    </head>
    <style>

        .modal-dialog{
            position: relative;
            display: table; /* <-- This makes the trick */
            overflow-y: auto;    
            overflow-x: auto;
            width: auto;
            min-width: 300px;   
        }



        .avatar-upload {
            position: relative;
            max-width: 205px;
            margin: 50px auto;
        }
        .avatar-upload .avatar-edit {
            position: absolute;
            right: 12px;
            z-index: 1;

        }
        .avatar-upload .avatar-edit input {
            display: none;
        }
        .avatar-upload .avatar-edit input + label {
            display: inline-block;
            width: 34px;
            height: 34px;
            margin-bottom: 0;
            border-radius: 100%;
            background: #FFFFFF;
            border: 1px solid transparent;
            box-shadow: 0px 2px 4px 0px rgba(0, 0, 0, 0.12);
            cursor: pointer;
            font-weight: normal;
            transition: all 0.2s ease-in-out;
        }
        .avatar-upload .avatar-edit input + label:hover {
            background: #f1f1f1;
            border-color: #d6d6d6;
        }
        .avatar-upload .avatar-edit input + label:after {
            content: "\f040";
            font-family: 'FontAwesome';
            color: #757575;
            position: absolute;
            left: 0;
            right: 0;
            text-align: center;
            margin: auto;
        }
        .avatar-upload .avatar-preview {
            width: 192px;
            height: 192px;
            position: relative;
            border-radius: 100%;
            border: 6px solid #F8F8F8;
            box-shadow: 0px 2px 4px 0px rgba(0, 0, 0, 0.1);
        }
        .avatar-upload .avatar-preview > div {
            width: 100%;
            height: 100%;
            border-radius: 100%;
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center;
        }

    </style>
    <script type="text/javascript">
        var name = "Nameless";
        var breed = "#";
        var gender = "female";
        var age = "#";
        var size = "#";
        var petImg = "static/images/placeholder.png";

        function whichGender(g) {
            gender = g;
        }

        function whichSize(s) {
            size = s;
        }


        function addPet() {

            /*      var petImg=document.getElementById("myImg").value;
             var name=document.getElementById("petName").value ;
             var breed=document.getElementById("petBreed").value;
             var gender=document.getElementById("petGender").value ;
             var age=document.getElementById("petAge").value;
             var size=document.getElementById("petSize").value;*/

            name = document.getElementById("petName").value;
            breed = document.getElementById("petBreed").value;
            age = document.getElementById("petAge").value;
            petImg = document.getElementById("myImg").src;

            //age = document.getElementById("petAge").value;
            //size = document.getElementById("petSize").value;

            alert(name + " " + breed + " " + gender + " " + age + " " + size);
            var div = '<div class="col-md-4 col-sm-4 col-xs-12 profile_details"> <div class="well profile_view"> <div class="col-sm-12"> <h4 class="brief"><i>Dog</i></h4> <div class="left row"> <div class="col-xs-6 col-sm-6"> <h3><strong>' + name + '</strong></h3> <p><strong>Breed: </strong>' + breed + '</p> <p><strong>Size (Kg) : </strong>' + size + '</p> <p><strong>Gender: </strong>' + gender + '</p> <p><strong>Age: </strong>' + age + '</p> </div> <div class="col-xs-6 col-sm-6 right"> <img src="  ' + petImg + ' " alt="" class="img-circle img-responsive" /> </div> </div> </div> <div class="col-xs-12 bottom text-center"> <div class="col-xs-12 col-sm-12 emphasis"> <button type="button" class="btn btn-danger btn-xs"> <i class="fa fa-minus-circle"> </i> Delete </button><button type="button" class="btn btn-warning btn-xs"> <i class="fa fa-edit"> </i> Edit Pet </button> <button type="button" class="btn btn-success btn-xs"> <i class="fa fa-search"> </i> Find a Pet Hotel </button> </div> </div> </div> </div>';
            document.getElementById("pets").innerHTML = document.getElementById("pets").innerHTML + div;
        }
        /*Add pet*/
        /* function addPet() {
         System.out.println("xD");
         document.getElementById("pets").innerHTML = document.getElementById("pets").innerHTML +
         ('<input type="button" onClick="alert("' + document.getElementById("add").value + '")"
         value = "'+document.getElementById("add").value+'" > <br>');
         }
         /* The uploader form */
        $(function () {
            $(":file").change(function () {
                if (this.files && this.files[0]) {
                    var reader = new FileReader();
                    reader.onload = imageIsLoaded;
                    reader.readAsDataURL(this.files[0]);
                }
            });
        });
        function imageIsLoaded(e) {
            $('#myImg').attr('src', e.target.result);
            console.log("aa");
            $('#yourImage').attr('src', e.target.result);
            $('#myImg').css('background-image', 'url(' + e.target.result + ')');
        }
        ;

    </script>
    <body class="nav-md">
        <div class="container body">

            <div class="main_container">
                <jsp:include page="dashboardHeader.jsp"></jsp:include>

                    <div class="right_col" role="main">
                        <div class="">
                            <div class="page-title">
                                <div class="title_left">
                                    <h3 >My Pets <button type="button"  data-toggle="modal" data-target=".bs-example-modal-lg" style="margin-left:10px; padding-left: 25px; padding-right: 25px;" class="btn btn-primary"><i class="fa fa-plus-circle"> </i> Add More Pets </button></h3>
                                    <div class="x_content">
                                        <div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-hidden="true" style="display: none;">
                                            <div class="modal-dialog modal-lg">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                        <h4 class="modal-title" id="myModalLabel">Add a Pet</h4>
                                                    </div>
                                                    <div class="">
                                                        <div class="x_content">
                                                            <br />
                                                            <form id="demo-form2" data-parsley-validate class="form-horizontal form-label-left">

                                                                <div class="row">

                                                                    <div class="col-sm-12">
                                                                        <div class="col-sm-12">
                                                                            <!-- space-->
                                                                            <div class="col-xs-2 col-sm-2 col-md-4"></div>
                                                                            <!-- profil photo -->
                                                                            <div style="" class="left col-xs-10 col-sm-10 col-md-8">
                                                                                <div class="row">
                                                                                    <div class="col-md-6" style="">
                                                                                        <div class="row">
                                                                                            <div class="">
                                                                                                <div class="avatar-upload">
                                                                                                    <div class="avatar-edit">
                                                                                                        <input type='file' id="imageUpload" accept=".png, .jpg, .jpeg" />
                                                                                                        <label for="imageUpload"></label>
                                                                                                    </div>
                                                                                                    <div class="avatar-preview">
                                                                                                        <img src="static/images/placeholder.png" id="myImg" alt="" class="img-circle img-responsive" />
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-xs-2 col-sm-2 col-md-4"></div>
                                                                        </div>

                                                                        <div class="row col-md-12">
                                                                            <!-- space-->
                                                                            <div  class="col-xs-0 col-sm-0 col-md-3"></div>
                                                                            <!-- informations -->
                                                                            <div  class="col-xs-12 col-sm-12 col-md-9">
                                                                                <div class="form-group">
                                                                                    <label  class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Type of Pet <span class="required">*</span>
                                                                                    </label>
                                                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                                                        <button id="petType" data-toggle="dropdown" class="btn btn-default dropdown-toggle" type="button"> Dog <span class="caret"></span> </button>
                                                                                        <ul class="dropdown-menu">
                                                                                            <li><a href="#">Dog</a>
                                                                                            </li>
                                                                                            <li><a href="#">Cat</a>
                                                                                            </li>
                                                                                            <li><a href="#">Rabbit</a>
                                                                                            </li>
                                                                                            <li><a href="#">Guinea Pig</a>
                                                                                            </li>
                                                                                            <li><a href="#">Ferret</a>
                                                                                            </li>
                                                                                            <li><a href="#">Bird</a>
                                                                                            </li>
                                                                                            <li><a href="#">Reptile</a>
                                                                                            </li>
                                                                                            <li><a href="#">Others</a>
                                                                                            </li>
                                                                                        </ul>
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
                                                                                            <label class="btn btn-primary" data-toggle-class="btn-primary" onClick="whichGender('female')" data-toggle-passive-class="btn-default">
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
                                                                                    <label class="control-label col-md-3 col-sm-3 col-md-1">Size<span class="required">*</span>
                                                                                    </label>
                                                                                    <div id="petSize" class="col-md-11 col-sm-3 col-xs-3 btn-group" style="padding-bottom: 15px;">
                                                                                        <button class="btn btn-default" type="button" onClick="whichSize('5-10kg')"> 5-10kg</button>
                                                                                        <button class="btn btn-default" type="button" onClick="whichSize('10-20kg')" >10-20kg</button>
                                                                                        <button class="btn btn-default" type="button" onClick="whichSize('20-40kg')">20-40kg</button>
                                                                                        <button class="btn btn-default" type="button" onClick="whichSize('40kg+')">40+kg</button>                                                                                                                                                                      </div>
                                                                                </div>
                                                                            </div>
                                                                            <!-- space-->
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="ln_solid"></div>
                                                            </form>
                                                        </div>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                        <button type="button" onClick="addPet()" class="btn btn-primary"  data-dismiss="modal">Save changes</button>
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
                                                <div id="newPet" ></div>
                                                <div class="col-md-4 col-sm-12 col-xs-12 profile_details">
                                                    <div class="well profile_view">
                                                        <div class="col-sm-12">
                                                            <h4 class="brief"><i>Dog</i></h4>
                                                            <div class="left row" style="margin-bottom: 10px;">
                                                                <div class="col-md-1 col-xs-1 col-sm-0"></div>
                                                                <div class="col-md-5 col-xs-6 col-sm-6">
                                                                    <h3><strong>Arthur</strong></h3>
                                                                    <p><strong>Breed: </strong>Dogo Argentino </p>
                                                                    <p><strong>Size (Kg) : </strong>40+ kg </p>
                                                                    <p><strong>Gender: </strong>Male </p>
                                                                    <p><strong>Age: </strong>2 years </p>
                                                                </div>
                                                                <div class="col-md-1 col-xs-1 col-sm-0"></div>
                                                                <div class="col-md-5 col-xs-6 col-sm-6 ">
                                                                    <img src="static/images/dog.jpg" alt="" class="img-circle img-responsive" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-xs-12 bottom text-center">
                                                            <div class="col-xs-12 col-sm-12 emphasis">
                                                                <button type="button" class="btn btn-danger btn-xs">
                                                                    <i class="fa fa-minus-circle"> </i> Delete
                                                                </button><button type="button" class="btn btn-warning btn-xs">
                                                                    <i class="fa fa-edit"> </i> Edit Pet
                                                                </button>
                                                                <button type="button" class="btn btn-success btn-xs">
                                                                    <i class="fa fa-search"> </i> Find a Pet Hotel
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4 col-sm-12 col-xs-12 profile_details">
                                                    <div class="well profile_view">
                                                        <div class="col-sm-12">
                                                            <h4 class="brief"><i>Dog</i></h4>
                                                            <div class="left row" style="margin-bottom: 10px;">
                                                                <div class="col-md-1 col-xs-1 col-sm-1"></div>
                                                                <div class="col-md-5 col-xs-6 col-sm-6">
                                                                    <h3><strong>Arthur</strong></h3>
                                                                    <p><strong>Breed: </strong>Dogo Argentino </p>
                                                                    <p><strong>Size (Kg) : </strong>40+ kg </p>
                                                                    <p><strong>Gender: </strong>Male </p>
                                                                    <p><strong>Age: </strong>2 years </p>
                                                                </div>
                                                                <div class="col-md-1 col-xs-1 col-sm-1"></div>
                                                                <div class="col-md-5 col-xs-6 col-sm-6 ">
                                                                    <img src="static/images/dog.jpg" alt="" class="img-circle img-responsive" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-xs-12 bottom text-center">
                                                            <div class="col-xs-12 col-sm-12 emphasis">
                                                                <button type="button" class="btn btn-danger btn-xs">
                                                                    <i class="fa fa-minus-circle"> </i> Delete
                                                                </button><button type="button" class="btn btn-warning btn-xs">
                                                                    <i class="fa fa-edit"> </i> Edit Pet
                                                                </button>
                                                                <button type="button" class="btn btn-success btn-xs">
                                                                    <i class="fa fa-search"> </i> Find a Pet Hotel
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4 col-sm-12 col-xs-12 profile_details">
                                                    <div class="well profile_view">
                                                        <div class="col-sm-12">
                                                            <h4 class="brief"><i>Dog</i></h4>
                                                            <div class="left row" style="margin-bottom: 10px;">
                                                                <div class="col-md-1 col-xs-0 col-sm-0"></div>
                                                                <div class="col-md-5 col-xs-6 col-sm-6">
                                                                    <h3><strong>Arthur</strong></h3>
                                                                    <p><strong>Breed: </strong>Dogo Argentino </p>
                                                                    <p><strong>Size (Kg) : </strong>40+ kg </p>
                                                                    <p><strong>Gender: </strong>Male </p>
                                                                    <p><strong>Age: </strong>2 years </p>
                                                                </div>
                                                                <div class="col-md-1 col-xs-0 col-sm-0"></div>
                                                                <div class="col-md-5 col-xs-6 col-sm-6 ">
                                                                    <img src="static/images/dog.jpg" alt="" class="img-circle img-responsive" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-xs-12 bottom text-center">
                                                            <div class="col-xs-12 col-sm-12 emphasis">
                                                                <button type="button" class="btn btn-danger btn-xs">
                                                                    <i class="fa fa-minus-circle"> </i> Delete
                                                                </button><button type="button" class="btn btn-warning btn-xs">
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

            <script src="static/vendors/jquery/dist/jquery.min.js" type="53fb5546d8872ed72f1ff495-text/javascript"></script>
            <script src="static/vendors/bootstrap/dist/js/bootstrap.min.js" type="53fb5546d8872ed72f1ff495-text/javascript"></script>
            <script src="static/vendors/build/js/custom.min.js" type="53fb5546d8872ed72f1ff495-text/javascript"></script>
            <script src="https://ajax.cloudflare.com/cdn-cgi/scripts/a2bd7673/cloudflare-static/rocket-loader.min.js" data-cf-settings="53fb5546d8872ed72f1ff495-|49" defer=""></script>
            <script src="https://kit.fontawesome.com/3135afb4f3.js"></script>
            <script src="static/vendors/fastclick/lib/fastclick.js" type="e9f4c75d3b1f1f908f54c815-text/javascript"></script> 
            <script src="static/vendors/nprogress/nprogress.js" type="e9f4c75d3b1f1f908f54c815-text/javascript"></script>

            <script type="e9f4c75d3b1f1f908f54c815-text/javascript">
                (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
                (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
                m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
                })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

                ga('create', 'UA-23581568-13', 'auto');
                ga('send', 'pageview');
            </script>
            <script src="https://ajax.cloudflare.com/cdn-cgi/scripts/a2bd7673/cloudflare-static/rocket-loader.min.js" data-cf-settings="e9f4c75d3b1f1f908f54c815-|49" defer=""></script>
    </body>
</html>
