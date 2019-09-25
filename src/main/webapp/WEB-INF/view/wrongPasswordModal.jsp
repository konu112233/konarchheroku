<%-- 
    Document   : wrongPassword
    Created on : Sep 25, 2019, 2:10:18 PM
    Author     : omerfarukoner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- Modal -->
<div class="modal fade" data-keyboard="false" data-backdrop="static" id="wrongPasswordModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <!--Content-->
        <div class="modal-content form-elegant">
            <!--Header-->
            <div class="modal-header text-center">
                <h3 class="modal-title w-100 dark-grey-text font-weight-bold my-3" id="myModalLabel" style="margin-left: 25px;"><strong>Invalid Login</strong></h3>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <!--Body-->
            <div class="modal-body mx-4">
                <!--Body-->
                <div class="md-form mb-5">
                    <p align="center">You have entered an invalid username or password.</p>
                </div>
                <div class="text-center mb-3">
                    <button type="button" data-dismiss="modal" data-toggle="modal"  data-target="#signinForm" class="btn btn-danger btn-block btn-rounded z-depth-1a" style="font-weight: 500; border-radius: 20px;">Try again</button>
                </div>
            </div>
        </div>
        <!--/.Content-->
    </div>
</div>
<!-- Modal -->
