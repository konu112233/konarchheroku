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

        <link href="static/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="static/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
        <link href="static/vendors/build/css/custom.min.css" rel="stylesheet">
        <script>
            window.onload = () => {
                const user_info = document.querySelector('#user_info');
                const name = document.querySelector('#name');
                const address = document.querySelector('#address');
                const mail = document.querySelector('#mail');
                const telephone = document.querySelector('#telephone');
                const bod = document.querySelector('#bod'); //bod = BirthofDate
                const gender = document.querySelector('#gender');

                user_info.addEventListener('submit', (e) => {

                    localStorage.clear();
                    localStorage.setItem('user', JSON.stringify({
                        name: name.textContent.trim(),
                        address: address.textContent.trim(),
                        telephone: telephone.textContent.trim(),
                        mail: mail.textContent.trim(),
                        bod: bod.textContent.trim(),
                        gender: gender.textContent.trim()
                    }));
                });
            }
        </script>

    </head>
    <body class="nav-md">
        <div class="container body">
            <div class="main_container">
                <jsp:include page="dashboardHeader.jsp"></jsp:include>

                    <div class="right_col" role="main" style="min-height: 2202px;">
                        <div class="">
                            <div class="page-title">
                                <div class="title_left">
                                    <h3>User Profile</h3>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                            <div class="row">
                                <div class="col-md-12 col-sm-12 col-xs-12">
                                    <div class="x_panel">
                                        <div class="x_content">

                                            <div class="col-md-3 col-sm-3 col-xs-12 profile_left">
                                                <form action="editProfile" id="user_info">
                                                    <div class="profile_img">
                                                        <div id="crop-avatar">

                                                            <img class="img-responsive avatar-view img-circle" src="static/images/profil_photo_220x220.jpeg" alt="Avatar" title="Change the avatar">
                                                        </div>
                                                    </div>
                                                    <h3 id = "name">${user.name} ${user.surname}</h3>
                                                <ul class="list-unstyled user_data">
                                                    <li id="address"><i class="fa fa-map-marker user-profile-icon"></i> ${user.address}
                                                    </li>
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
                                                <button type="submit" class="btn btn-success"><i class="fa fa-edit m-right-xs"></i>Edit Profile</button>

                                                <br>
                                            </form>
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

        <script src="static/vendors/jquery/dist/jquery.min.js" type="53fb5546d8872ed72f1ff495-text/javascript"></script>
        <script src="static/vendors/bootstrap/dist/js/bootstrap.min.js" type="53fb5546d8872ed72f1ff495-text/javascript"></script>
        <script src="static/vendors/build/js/custom.min.js" type="53fb5546d8872ed72f1ff495-text/javascript"></script>
        <script src="https://ajax.cloudflare.com/cdn-cgi/scripts/a2bd7673/cloudflare-static/rocket-loader.min.js" data-cf-settings="53fb5546d8872ed72f1ff495-|49" defer=""></script>
        <script src="https://kit.fontawesome.com/3135afb4f3.js"></script>
    </body>
</html>

