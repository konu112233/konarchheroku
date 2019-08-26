<%-- 
    Document   : resetPasswordModal
    Created on : Jul 7, 2019, 8:23:41 PM
    Author     : burakzengin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- Modal -->
<div class="modal fade" id="resetPasswordForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <!--Content-->
        <div class="modal-content form-elegant">
            <!--Header-->
            <div class="modal-header text-center">
                <h3 class="modal-title w-100 dark-grey-text font-weight-bold my-3" id="myModalLabel" style="margin-left: 25px;"><strong>Forgot Password</strong></h3>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <!--Body-->
            <div class="modal-body mx-4">
                <!--Body-->
                <form action="resetPassword" method="POST">
                    <div class="md-form">
                        <input placeholder="New Password" type="password" name="password" id="Form-pass1" class="form-control validate">
                        <label data-error="wrong" data-success="right" for="Form-pass1" ></label>
                    </div>
                    <div class="md-form">
                        <input placeholder="Confirm New Password" type="password" name="repassword" id="Form-pass1" class="form-control validate">
                        <label data-error="wrong" data-success="right" for="Form-pass1" ></label>
                    </div>
                    <input hidden name="object" value="${object}">
                    <div class="text-center mb-3">
                        <button type="submit" class="btn blue-gradient btn-block btn-rounded z-depth-1a" style="font-weight: 500; border-radius: 20px;">Reset</button>
                    </div>

                </form>
            </div>
        </div>
    </div>
</div>
<!-- Modal -->
