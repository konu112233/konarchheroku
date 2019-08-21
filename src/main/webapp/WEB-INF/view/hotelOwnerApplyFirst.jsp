-------------  PETSITTER.JSP PAGE ----------------------



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


    </head>
    <style>
        @media all and (min-width: 960px) {
            #text1
            {
                font-size:3em;
            }
        }

        @media all and (max-width: 959px) and (min-width: 600px) {
            #text1
            {
                font-size:3em;
            }
        }

        @media all and (max-width: 599px) and (min-width: 320px) {
            #text1
            {
                font-size:2em;
            }

        }

    </style>
    <body class="nav-md">
        <div class="container body">
            <div class="main_container">
                <jsp:include page="dashboardHeader.jsp"></jsp:include>

                    <div class="right_col" role="main">

                        <div class="x_panel">
                            <div class="x_title">
                                <h1>Do you want to become our partner?</h1>
                                <div class="clearfix"></div>
                            </div>
                            <div class="x_content col-md-12">

                                <div class="col-md-12 col-sm-12 col-xs-12 bs-example" data-example-id="simple-jumbotron">
                                    <div class="jumbotron">
                                        <div class="row" style="">

                                            <div class="col-md-6 col-sm-12 col-xs-12">

                                                <h3 style="font-size: 3em;"><strong>Hotel Owner, list your <span style="color:#004085">pet hotel</span> on </strong></h3>
                                                <h3 id="text1"  ><strong><span style="color:#0C9A4E">Bookingpetz.com</span></strong></h3>
                                                <p style="font-size: 1.5em">Registration can take as little as 15 minutes to complete – get started today</p>
                                                <div class="row" style="text-align: center">
                                                    <a href="hotelOwnerApply" <button class="btn btn-success btn btn-lg" type="button">Let's Start</button> </a>
                                                </div>
                                                <br>
                                            </div>

                                            <div  class="col-md-6  col-sm-12 col-xs-12">
                                                <!--                                                                                                <div  class="image view view-first" style="display: block; margin: 0 auto;">
                                                                                                                                                    <img class="img-thumbnail" style="" style="" width="400" height="215" src="static/images/petHotel.jpg" alt="image" />
                                                                                                                                                </div>-->
                                                <div class="image view view-first" style="display: flex; justify-content: center;"> 


                                                    <img  class="img-thumbnail" style="margin-left:45px" width="400" height="215" src="static/images/petHotel.jpg" alt="image" />

                                                    <br>
                                                </div>
                                            </div>

                                        </div>
                                    </div>

                                </div>
                                <div class="col-md-0"></div>

                            </div>

                        </div>

                    <jsp:include page="dashboardFooter.jsp"></jsp:include>
                </div>
            </div>

            <script src="static/vendors/jquery/dist/jquery.min.js" type="53fb5546d8872ed72f1ff495-text/javascript"></script>
            <script src="static/vendors/bootstrap/dist/js/bootstrap.min.js" type="53fb5546d8872ed72f1ff495-text/javascript"></script>
            <script src="static/vendors/build/js/custom.min.js" type="53fb5546d8872ed72f1ff495-text/javascript"></script>
            <script src="https://ajax.cloudflare.com/cdn-cgi/scripts/a2bd7673/cloudflare-static/rocket-loader.min.js" data-cf-settings="53fb5546d8872ed72f1ff495-|49" defer=""></script></body>
    <script src="https://kit.fontawesome.com/3135afb4f3.js"></script>
</html>
