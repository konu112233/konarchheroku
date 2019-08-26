<%-- signupVerifymail
    Document   : verifymail
    Created on : Aug 18, 2019, 3:13:31 PM
    Author     : burakzengin
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- Modal -->
<div class="modal fade" data-keyboard="false" data-backdrop="static" id="signupVerifymail" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <!--Content-->
        <div class="modal-content form-elegant">
            <!--Header-->
            <div class="modal-header text-center">
                <h3 class="modal-title w-100 dark-grey-text font-weight-bold my-3" id="myModalLabel" style="margin-left: 25px;"><strong>Mail Confirmation</strong></h3>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <!--Body-->
            <div class="modal-body mx-4">
                <!--Body-->
                <form action="" method="">
                    <div class="md-form mb-5">
                        <p align="center">We have sent you <strong>a verification code</strong>, please enter the code.</p>
                        <br>
                        <input placeholder="#9999" type="text" name="name" class="form-control validate">
                        <label data-error="wrong" data-success="right"></label>
                    </div>
                    <div class="text-center mb-3">
                        <button  type="button" data-dismiss="modal" data-toggle="modal"  data-target="#verifiedmail" class="btn blue-gradient btn-block btn-rounded z-depth-1a" style="font-weight: 500; border-radius: 20px;">Verify</button>

                    </div>

                </form>

            </div>
            <!--Footer-->

        </div>
        <!--/.Content-->
    </div>
</div>
<!-- Modal -->
