<%-- 
    Document   : hotelOwnerStatus
    Created on : Jul 10, 2019, 4:37:09 PM
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

    </head>
    <body class="nav-md">
        <div class="container body">
            <div class="main_container">
                <jsp:include page="dashboardHeader.jsp"></jsp:include>
                    <div class="right_col" role="main">
                        <div class="x_panel">
                            <div class="x_content" style="padding:10px">
                                <div class="row">
                                    <div class="bs-example row" data-example-id="simple-jumbotron">
                                        <div class="jumbotron " >
                                            <div class="row" style="">
                                                <div class="col-md-8 col-sm-12 col-xs-12">
                                                    <h1 >Congratulations!</h1>
                                                    <br>
                                                    <h3 style="font-size: 30px"><strong>Application Status</strong></h3>
                                                    <p style="font-size: 26px">Our team is currently reviewing your information before your application can be approved.</p>
                                                </div>
                                                <div class="col-md-4 col-sm-12 col-xs-12">
                                                    <img src="static/images/underReview.png" class="img-responsive" height="235" width="428" />  
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
        <script src="https://kit.fontawesome.com/3135afb4f3.js"></script>
    </body>
</html>
