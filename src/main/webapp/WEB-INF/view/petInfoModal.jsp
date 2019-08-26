<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- Modal -->
<style>
    #petGender .btn.btn-default,
    #petGender .btn.btn-primary {
        background-color: #8AD144!important;
        border-color: #8AD144!important;
    }

    #petSize .btn.btn-default {
        background-color: #8AD144!important;
        border-color: #8AD144!important;
    }
</style>
<script>


</script>
<div class="modal fade" data-keyboard="false" data-backdrop="static" id="petInfoForm"  tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <!--Content-->
        <div class="modal-content form-elegant">
            <!--Header-->
            <div class="modal-header text-center">
                <h3 class="modal-title w-100 dark-grey-text font-weight-bold my-3" id="myModalLabel" style="margin-left: 30px;"><strong>Pet Information</strong></h3>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <!--Body-->
            <div class="modal-body mx-4">
                <!--Body-->
                <form action="" method="">
                    <br>
                    <select class="browser-default custom-select" >
                        <option selected>Choose your pet type</option>
                        <option value="1">Cat</option>
                        <option value="2">Dog</option>
                        <option value="3">Else</option>
                    </select>

                    <div class="md-form">
                        <input placeholder="Pet Name" type="text" name="name" class="form-control validate">
                        <label data-error="wrong" data-success="right"></label>
                    </div>

                    <div class="md-form">

                    </div>

                    <select class="mdb-select md-form">
                        <option value="" disabled selected>Choose type of pet</option>
                        <option value="1">Dog</option>
                        <option value="2">Cat</option>

                    </select>

                    <div class="md-form">
                        <input placeholder="Breed" type="text" name="breed" class="form-control validate">
                        <label data-error="wrong" data-success="right" ></label>
                    </div>
                    <div class="md-form">
                        <input placeholder="Age" type="text" name="breed" class="form-control validate">
                        <label data-error="wrong" data-success="right" ></label>
                    </div>
                    <div class="md-form">
                        <div class="row">
                            <div class="col-md-4 col-sm-12 col-xs-12">
                                <h5 class="h5-responsive"><strong>Gender</strong></h5>
                            </div>
                            <div class="col-md-8 col-sm-12 col-xs-12" style="margin-top:-12px">

                                <!-- Default inline 1-->
                                <div style="margin-left:25px" class="custom-control custom-radio custom-control-inline">
                                    <input type="radio" class="custom-control-input" id="defaultInline1" name="inlineDefaultRadiosExample">
                                    <label class="custom-control-label" for="defaultInline1">Male</label>
                                </div>

                                <!-- Default inline 2-->
                                <div class="custom-control custom-radio custom-control-inline" style="margin-left: 25px">
                                    <input type="radio" class="custom-control-input" id="defaultInline2" name="inlineDefaultRadiosExample">
                                    <label class="custom-control-label" for="defaultInline2">Female</label>
                                </div>


                            </div>
                        </div>
                    </div>
                    <div class="md-form">
                        <div class="row">
                            <div class="col-md-4 col-sm-12 col-xs-12">
                                <h5 class="h5-responsive"><strong>Vaccination</strong></h5>
                            </div>
                            <div class="col-md-8 col-sm-12 col-xs-12" style="margin-top:-12px">

                                <!-- Material unchecked -->
                                <div class="form-check">
                                    <input type="checkbox" class="form-check-input" id="materialUnchecked">
                                    <label class="form-check-label" for="materialUnchecked">Yes</label>
                                </div>
                            </div> 
                        </div>
                    </div>

                    <div class="md-form mb-5">

                        <div class="row d-flex justify-content-center">

                            <!--Grid column-->
                            <div class="">

                                <h5><strong>Size</strong></h5>

                            </div>
                            <!--Grid column-->

                        </div>
                        <!-- Material inline 1 -->
                        <div class="form-check form-check-inline">
                            <input type="radio" class="form-check-input" id="materialInline1" name="inlineMaterialRadiosExample">
                            <label class="form-check-label" for="materialInline1">5-10 kg</label>
                        </div>

                        <!-- Material inline 2 -->
                        <div class="form-check form-check-inline">
                            <input type="radio" class="form-check-input" id="materialInline2" name="inlineMaterialRadiosExample">
                            <label class="form-check-label" for="materialInline2">10-20 kg</label>
                        </div>

                        <!-- Material inline 3 -->
                        <div class="form-check form-check-inline">
                            <input type="radio" class="form-check-input" id="materialInline3" name="inlineMaterialRadiosExample">
                            <label class="form-check-label" for="materialInline3">20-30 kg</label>
                        </div>

                        <!-- Material inline 3 -->
                        <div class="form-check form-check-inline">
                            <input type="radio" class="form-check-input" id="materialInline4" name="inlineMaterialRadiosExample">
                            <label class="form-check-label" for="materialInline4">40+ kg</label>
                        </div>
                    </div>


                    <div class="text-center mb-3">
                        <button type="button" data-dismiss="modal" data-toggle="modal"  data-target="#verifyMail" class="btn blue-gradient btn-block btn-rounded z-depth-1a" style="font-weight: 500; border-radius: 20px;">Next</button>
                        <button type="button" data-dismiss="modal" data-toggle="modal"  data-target="#signupForBookingForm" class="btn blue-gradient btn-block btn-rounded z-depth-1a" style="opacity:0.6 ;font-weight: 500; border-radius: 20px;">Previous</button>

                    </div>

                </form>

            </div>
            <!--Footer-->
            <div class="modal-footer mx-5 pt-3 mb-1">
                <p class="font-small grey-text d-flex justify-content-end">Do you already have an account? <a href="home" data-dismiss="modal" data-toggle="modal" data-target="#signinForm" class="modelClose blue-text ml-1">
                        Sign In</a></p>
            </div>
        </div>
        <!--/.Content-->
    </div>
</div>
<!-- Modal -->
