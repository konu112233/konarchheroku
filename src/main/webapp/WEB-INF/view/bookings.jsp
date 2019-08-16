

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Bookingpetz.com</title>

<link href="static/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="static/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
<link href="static/vendors/build/css/custom.min.css" rel="stylesheet">
<link href="static/vendors/iCheck/skins/flat/green.css" rel="stylesheet">
<link href="static/vendors/nprogress/nprogress.css" rel="stylesheet">

<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>


<style>
    .modal .row {
        margin-left: 15px;
        margin-right: 15px;
    }
    
    
</style>
<script type="text/javascript">

    function demo(a)
    {
        confirm("Are you sure");
        $("#" + a).text("Canceled");

        /*if(confirm = "yes"){
         nesne.innerHTML = "Canceled";
         }
         else{
         button.value = "Cancel";
         }*/
    }
    function cancel(id) {

        document.getElementById("status" + id).innerHTML = "Canceled";
        document.getElementById("btnDelete" + id).disabled = true;
    }
    

</script>

<body class="nav-md">
    <div class="container body">
        <div class="main_container">
            <jsp:include page="dashboardHeader.jsp"></jsp:include>

                <div class="right_col" role="main">

                    <div class="col-md-12 col-sm-12 col-xs-12">

                        <div class="x_panel">
                            <div class="x_title">
                                <h2>Bookings History </h2>


                                <div class="clearfix"></div>
                            </div>
                            <div class="x_content">
                                <div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-hidden="true" style="display: none;">
                                    <div class="modal-dialog modal-lg">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span>
                                                </button>
                                                <h4 class="modal-title" id="myModalLabel" >Cancel Reservation</h4>
                                            </div>
                                            <div class="">
                                                <div class="x_content">
                                                    <br />
                                                    <form id="demo-form2" data-parsley-validate class="form-horizontal form-label-left">

                                                        <div class="row">
                                                            <div class="col-md-4 col-xs-12 col-sm-12">
                                                                <span style="margin-top:15%;padding-left: 40%;font-size: 90px;text-align: center" class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>

                                                            </div>
                                                            <div class="col-md-8 col-xs-12 col-sm-12">
                                                                <h1 ><strong>Are you sure?</strong></h1>
                                                                <h3>You're about to cancel this reservation</h3>
                                                            </div>

                                                        </div>



                                                        <div class="ln_solid"></div>

                                                    </form>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                <button type="button" id="3" onclick="cancel(this.id)" class="btn btn-primary"  data-dismiss="modal">Cancel the reservation</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal fade" id="booking1" tabindex="-1" role="dialog">
                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                      <div class="modal-content">
                                        <div class="modal-header">
                                          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                          </button>
                                          <h2 class="modal-title" id="booking1Title">Reservation for John Blank L at Forever Pet Hotel</h2>                                          
                                        </div>
                                        <div class="modal-body">
                                            <div class="container-fluid">
                                                <div class="row">
                                                    <h2>Booking</h2>
                                                    <span><small>Id: 5678765</small></span>
                                                    <hr>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-4">
                                                        <h2>Check-in</h2>
                                                        <span>May 23, 2014 11:47:56 PM</span>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <h2>Check-out</h2>
                                                        <span>June 5, 2014 08:17:56 PM</span>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <h2>Price</h2>
                                                        <table>
                                                            <tr><span>Boarding : €45</span></tr><br>
                                                            <tr><span>Dog Washing : €10</span></tr><br>
                                                            <tr><span>Fee : €5</span></tr><br>
                                                            <tr><span><strong>Total : €60</strong></span></tr><br>        
                                                        </table>
                                                    </div>
                                                </div>
                                                <br>
                                                <div class="row">
                                                    <div class="wizard_horizontal">
                                                        <ul class="wizard_steps anchor">
                                                            <li>
                                                                <a class="done" isdone="1" rel="1">
                                                                    <span class="step_no">1</span>
                                                                    <span class="step_descr">
                                                                    Booked<br>
                                                                    <!--<small>Reservation confirmed</small>-->
                                                                    </span>
                                                                </a>
                                                            </li>
                                                            <li>
                                                                <a class="done" isdone="1" rel="2">
                                                                    <span class="step_no">2</span>
                                                                    <span class="step_descr">
                                                                    Paid<br>
                                                                    <!--<small>Payment successful</small>-->
                                                                    </span>
                                                                </a>
                                                            </li>
                                                            <li>
                                                                <a class="selected" isdone="1" rel="3">
                                                                    <span class="step_no">3</span>
                                                                    <span class="step_descr">
                                                                    To come<br>
                                                                    <!--<small>Prepare your pet</small>-->
                                                                    </span>
                                                                </a>
                                                            </li>
                                                            <li>
                                                                <a class="disabled" isdone="1" rel="4">
                                                                    <span class="step_no">4</span>
                                                                    <span class="step_descr">
                                                                    Current<br>
                                                                    <!--<small>Your pet is in good hands</small>-->
                                                                    </span>
                                                                </a>
                                                            </li>
                                                            <li>
                                                                <a class="disabled" isdone="1" rel="5">
                                                                    <span class="step_no">5</span>
                                                                    <span class="step_descr">
                                                                    Review<br>
                                                                    <!--<small>Please tell us what you feel</small>-->
                                                                    </span>
                                                                </a>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                                <hr>
                                                <div class="row">
                                                    <h2>Hotel</h2>
                                                    <span><small>Id: 202836</small></span>
                                                    <hr>
                                                </div>
                                                <div class="row">
                                                    <div class="col text-center">
                                                        <a href="property">See hotel details</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                          <button type="button" class="btn btn-primary">Save changes</button>
                                        </div>
                                      </div>
                                    </div>
                                </div>        
                                <p>Manage your bookings</p>
                                <div class="table-responsive">
                                    <table class="table table-striped jambo_table bulk_action">
                                        <thead>
                                            <tr class="headings">
                                                <th>
                                                    <!--  <input type="checkbox" id="check-all" class="flat"> -->
                                                </th>
                                                <th class="column-title">Hotel Name</th>
                                                <th class="column-title">Start Date </th>
                                                <th class="column-title">Due Date </th>
                                                <th class="column-title">Bill to Name </th>
                                                <th class="column-title">Status </th>
                                                <th class="column-title">Amount </th>
                                                <th class="column-title no-link last"><span class="nobr">Action</span></th>
                                                <th class="bulk-actions" colspan="7">
                                                    <a class="antoo" style="color:#fff; font-weight:500;">Bulk Actions ( <span class="action-cnt"> </span> ) <i class="fa fa-chevron-down"></i></a>
                                                </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr class="even pointer">
                                                <td class="a-center ">
                                                    <!--<input type="checkbox" class="flat" name="table_records">-->    
                                                </td>
                                                <td class=" ">Forever Pet Hotel</td>
                                                <td class=" ">May 23, 2014 11:47:56 PM </td>
                                                <td class=" ">June 5, 2014 08:17:56 PM </td>
                                                <td class=" ">John Blank L</td>
                                                <td class=" ">Paid</td>
                                                <td class="a-right a-right ">$7.45</td>
                                                <td class=" last">
                                                    <button href="" type="button" id="booking1Button"  class="btn btn-xs btn-success" data-toggle="modal" data-target="#booking1">
                                                        <i  class="fa fa-external-link"> </i> View 
                                                    </button>
                                                </td>
                                            </tr>
                                            <tr class="odd pointer">
                                                <td class="a-center ">

                                                </td>
                                                <td class=" ">Wellness Pet Hotel</td>
                                                <td class=" ">May 23, 2014 11:30:12 PM</td>
                                                <td class=" ">June 5, 2014 08:17:56 PM </td>
                                                <td class=" ">John Blank L</td>
                                                <td class=" ">Paid</td>
                                                <td class="a-right a-right ">$741.20</td>
                                                <td class=" last" >  <button type="button" id="booking2Button"  class="btn btn-xs btn-success">
                                                        <i  class="fa fa-external-link"> </i> View 
                                                    </button></td>
                                            </tr>
                                            <tr class="even pointer">
                                                <td class="a-center ">

                                                </td>
                                                <td class=" ">Friendly Pet Hotel</td>
                                                <td class=" ">May 24, 2014 10:55:33 PM</td>
                                                <td class=" ">June 5, 2014 08:17:56 PM </td>
                                                <td class=" ">Mike Smith</td>
                                                <td id="status3" class=" ">Current</td>
                                                <td class="a-right a-right ">$432.26</td>
                                                <td class=" last"> 
                                                    <button type="button" id="booking3Button" data-toggle="modal" data-target=".bs-example-modal-lg"  class="btn btn-xs btn-danger">
                                                        <i  class="fa fa-remove"> </i> Cancel
                                                    </button>
                                            </tr>

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

            <jsp:include page="dashboardFooter.jsp"></jsp:include>
        </div>
    </div>  
</head>


<script src="static/vendors/iCheck/icheck.min.js" type="text/javascript"></script>
<script src="static/build/js/custom.min.js" type="text/javascript"></script>
<script src="static/vendors/jquery/dist/jquery.min.js" type="text/javascript"></script>
<script src="static/vendors/bootstrap/dist/js/bootstrap.min.js" type="text/javascript"></script>
<script src="static/vendors/build/js/custom.min.js" type="text/javascript"></script>
<script src="https://ajax.cloudflare.com/cdn-cgi/scripts/a2bd7673/cloudflare-static/rocket-loader.min.js" data-cf-settings="53fb5546d8872ed72f1ff495-|49" defer=""></script></body>
<script src="https://kit.fontawesome.com/3135afb4f3.js"></script>



