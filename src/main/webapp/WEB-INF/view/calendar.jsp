<%-- 
    Document   : calendar
    Created on : Jul 19, 2019, 2:33:09 PM
    Author     : burakzengin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
        <link href="static/vendors/nprogress/nprogress.css" rel="stylesheet">
        <link href="static/vendors/fullcalendar/dist/fullcalendar.min.css" rel="stylesheet">
        <link href="static/vendors/fullcalendar/dist/fullcalendar.print.css" rel="stylesheet" media="print">
        <link href="static/vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">
        <link href="static/vendors/build/css/custom.min.css" rel="stylesheet">
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
        <script>

            arr = new Array();
            <c:forEach var="h" items="${resultModals}">
            booking = new Object();
            booking.title = '${h.customerName}';
            booking.end = new Date(${h.endYear}, ${h.endMonth} - 1, ${h.endDay});
            booking.start = new Date(${h.startYear}, ${h.startMonth} - 1, ${h.startDay});
            booking.id = '${h.id}';
            booking.allDay = true;
            booking.customerId = '${h.customerId}';
            booking.descr = '${h.descr}';
            arr.push(booking);
            </c:forEach>

            /* CALENDAR */

            function  init_calendar() {

                if (typeof ($.fn.fullCalendar) === 'undefined') {
                    return;
                }
                console.log('init_calendar');

                var date = new Date(),
                        d = date.getDate(),
                        m = date.getMonth(),
                        y = date.getFullYear(),
                        started,
                        categoryClass;

                var calendar = $('#calendar').fullCalendar({
                    header: {
                        left: 'prev,next today',
                        center: 'title',
                        right: 'month,agendaWeek,agendaDay,listMonth'
                    },
                    selectable: true,
                    selectHelper: true,
                    select: function (start, end, allDay) {
                        $('#fc_create').click();

                        started = start;
                        ended = end;

                        $(".antosubmit").on("click", function () {
                            var title = $("#title").val();
                            if (end) {
                                ended = end;
                            }
                            categoryClass = $("#event_type").val();
                            if (title) {
                                calendar.fullCalendar('renderEvent', {
                                    title: title,
                                    start: started,
                                    end: end,
                                    allDay: allDay
                                },
                                        true // make the event "stick"
                                        );
                            }
                            $('#title').val('');
                            calendar.fullCalendar('unselect');
                            $('.antoclose').click();
                            return false;
                        });
                    },
                    eventClick: function (calEvent, jsEvent, view) {
                        $('#fc_edit').click();
                        $('#title2').val(calEvent.title);
                        $('#descr2').val(calEvent.descr);
                        $('#eventId').val(calEvent.id);

                        categoryClass = $("#event_type").val();
                        calendar.fullCalendar('unselect');
                    },
                    editable: true,
                    events: arr
//                    events: [{
//                            title: 'Click for Google',
//                            start: new Date(y, m, 28),
//                            end: new Date(y, m, 29),
//                            allDay: false,
//                            url: 'http://google.com/'
//                        }]
                });
            }
            ;

//            $(document).ready(function () {
//                document.getElementById("bookings").value = book;
//                book.forEach(function (element) {
//                    console.log(element);
//                });
//            });
        </script>
    </head>
    <body class="nav-md">
        <div class="container body">
            <div class="main_container">
                <jsp:include page="dashboardHeader.jsp"></jsp:include>

                    <div class="right_col" role="main">
                        <div class="">
                            <div class="clearfix"></div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="x_panel">
                                        <div class="x_title">
                                            <h2>Calendar</h2>
                                            <div class="clearfix"></div>
                                        </div>
                                        <div class="x_content">
                                            <div id='calendar'></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                <jsp:include page="dashboardFooter.jsp"></jsp:include>
            </div>
        </div>
        <div id="CalenderModalNew" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h4 class="modal-title" id="myModalLabel">New Calendar Entry</h4>
                    </div>
                    <form id="antoform" action="calendarInsert" method="POST" class="form-horizontal calender">
                        <div class="modal-body">
                            <div id="testmodal" style="padding: 5px 20px;">
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">Summary</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="summary" name="summary">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">Start Time</label>
                                    <div class="col-sm-3">
                                        <input type="text" class="form-control text-center" id="single_cal2" name="startDate" placeholder="Date" aria-describedby="inputSuccess2Status2">
                                    </div>
                                    <div class="col-sm-3">
                                        <select class="form-control" name="startTime">
                                            <option value="12:00:00">12:00am</option>
                                            <option value="12:30:00">12:30am</option>
                                            <option value="01:00:00">1:00am</option>
                                            <option value="01:30:00">1:30am</option>
                                            <option value="02:00:00">2:00am</option>
                                            <option value="02:30:00">2:30am</option>
                                            <option value="03:00:00">3:00am</option>
                                            <option value="03:30:00">3:30am</option>
                                            <option value="04:00:00">4:00am</option>
                                            <option value="04:30:00">4:30am</option>
                                            <option>5:00am</option>
                                            <option>5:30am</option>
                                            <option>6:00am</option>
                                            <option>6:30am</option>
                                            <option>7:00am</option>
                                            <option>7:30am</option>
                                            <option>8:00am</option>
                                            <option>8:30am</option>
                                            <option>9:00am</option>
                                            <option>9:30am</option>
                                            <option>10:00am</option>
                                            <option>10:30am</option>
                                            <option>11:00am</option>
                                            <option>11:30am</option>
                                            <option>12:00am</option>
                                            <option>12:30am</option>
                                            <option>1:00pm</option>
                                            <option>1:30pm</option>
                                            <option>2:00pm</option>
                                            <option>2:30pm</option>
                                            <option>3:00pm</option>
                                            <option>3:30pm</option>
                                            <option>4:00pm</option>
                                            <option>4:30pm</option>
                                            <option>5:00pm</option>
                                            <option>5:30pm</option>
                                            <option>6:00pm</option>
                                            <option>6:30pm</option>
                                            <option>7:00pm</option>
                                            <option>7:30pm</option>
                                            <option>8:00pm</option>
                                            <option>8:30pm</option>
                                            <option>9:00pm</option>
                                            <option>9:30pm</option>
                                            <option>10:00pm</option>
                                            <option>10:30pm</option>
                                            <option>11:00pm</option>
                                            <option>11:30pm</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">End Time</label>
                                    <div class="col-sm-3">
                                        <input type="text" class="form-control text-center" id="single_cal3" name="endDate" placeholder="Date" aria-describedby="inputSuccess2Status2">
                                    </div>
                                    <div class="col-sm-3">
                                        <select class="form-control" name="endTime">
                                            <option value="12:00:00">12:00am</option>
                                            <option value="12:30:00">12:30am</option>
                                            <option value="01:00:00">1:00am</option>
                                            <option value="01:30:00">1:30am</option>
                                            <option value="02:00:00">2:00am</option>
                                            <option value="02:30:00">2:30am</option>
                                            <option value="03:00:00">3:00am</option>
                                            <option value="03:30:00">3:30am</option>
                                            <option value="04:00:00">4:00am</option>
                                            <option value="04:30:00">4:30am</option>
                                            <option>5:00am</option>
                                            <option>5:30am</option>
                                            <option>6:00am</option>
                                            <option>6:30am</option>
                                            <option>7:00am</option>
                                            <option>7:30am</option>
                                            <option>8:00am</option>
                                            <option>8:30am</option>
                                            <option>9:00am</option>
                                            <option>9:30am</option>
                                            <option>10:00am</option>
                                            <option>10:30am</option>
                                            <option>11:00am</option>
                                            <option>11:30am</option>
                                            <option>12:00am</option>
                                            <option>12:30am</option>
                                            <option>1:00pm</option>
                                            <option>1:30pm</option>
                                            <option>2:00pm</option>
                                            <option>2:30pm</option>
                                            <option>3:00pm</option>
                                            <option>3:30pm</option>
                                            <option>4:00pm</option>
                                            <option>4:30pm</option>
                                            <option>5:00pm</option>
                                            <option>5:30pm</option>
                                            <option>6:00pm</option>
                                            <option>6:30pm</option>
                                            <option>7:00pm</option>
                                            <option>7:30pm</option>
                                            <option>8:00pm</option>
                                            <option>8:30pm</option>
                                            <option>9:00pm</option>
                                            <option>9:30pm</option>
                                            <option>10:00pm</option>
                                            <option>10:30pm</option>
                                            <option>11:00pm</option>
                                            <option>11:30pm</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">Description</label>
                                    <div class="col-sm-9">
                                        <textarea class="form-control" style="height:55px;" id="descr" name="descr"></textarea>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default antoclose" data-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary">Save changes</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div id="CalenderModalEdit" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h4 class="modal-title" id="myModalLabel2">Edit Calendar Entry</h4>
                    </div>
                    <form id="antoform2" action="removeEvent" method="POST" class="form-horizontal calender" >
                        <input hidden name="eventId" id="eventId">
                        <div class="modal-body">
                            <div id="testmodal2" style="padding: 5px 20px;">

                                <div class="form-group">
                                    <label class="col-sm-3 control-label">Title</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="title2" name="title2">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">Description</label>
                                    <div class="col-sm-9">
                                        <textarea class="form-control" style="height:55px;" id="descr2" name="descr2"></textarea>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default antoclose2" data-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-danger ">Delete Event</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div id="fc_create" data-toggle="modal" data-target="#CalenderModalNew"></div>
        <div id="fc_edit" data-toggle="modal" data-target="#CalenderModalEdit"></div>

        <script src="static/vendors/jquery/dist/jquery.min.js" type="c3000d06f3045955315705eb-text/javascript"></script>
        <script src="static/vendors/build/js/custom.min.js" type="c3000d06f3045955315705eb-text/javascript"></script>
        <script src="https://ajax.cloudflare.com/cdn-cgi/scripts/95c75768/cloudflare-static/rocket-loader.min.js" data-cf-settings="c3000d06f3045955315705eb-|49" defer=""></script>
        <script src="static/vendors/bootstrap/dist/js/bootstrap.min.js" type="02baebf0fafcd1e832ab36b0-text/javascript"></script>
        <script src="static/vendors/moment/min/moment.min.js" type="02baebf0fafcd1e832ab36b0-text/javascript"></script>
        <script src="static/vendors/bootstrap-daterangepicker/daterangepicker.js" type="02baebf0fafcd1e832ab36b0-text/javascript"></script>
        <script src="static/vendors/build/js/custom.js" type="02baebf0fafcd1e832ab36b0-text/javascript"></script>
        <script src="static/vendors/fullcalendar/dist/fullcalendar.min.js" type="c3000d06f3045955315705eb-text/javascript"></script>
        <script src="https://ajax.cloudflare.com/cdn-cgi/scripts/95c75768/cloudflare-static/rocket-loader.min.js" data-cf-settings="02baebf0fafcd1e832ab36b0-|49" defer=""></script>
        <script src="https://kit.fontawesome.com/3135afb4f3.js"></script>
    </body>
</html>

