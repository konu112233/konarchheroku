<%-- 
    Document   : mock
    Created on : Jul 7, 2019, 2:19:17 PM
    Author     : burakzengin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en"><head>
        <meta charset="UTF-8">
        <link rel="shortcut icon" type="image/x-icon" href="https://static.codepen.io/assets/favicon/favicon-aec34940fbc1a6e787974dcd360f2c6b63348d4b1f4e06c77743096d55480f33.ico">
        <link rel="mask-icon" type="" href="https://static.codepen.io/assets/favicon/logo-pin-8f3771b1072e3c38bd662872f6b673a722f4b3ca2421637d5596661b4e2132cc.svg" color="#111">
        <title>CodePen - Image Upload with preview</title>

        <link href="static/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="static/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
        <link href="static/vendors/build/css/custom.min.css" rel="stylesheet">

        <!--        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300" rel="stylesheet">
                <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">-->
        <style>
            body {
                background: whitesmoke;
                font-family: 'Open Sans', sans-serif;
            }
            .container {
                max-width: 960px;
                margin: 30px auto;
                padding: 20px;
            }
            h1 {
                font-size: 20px;
                text-align: center;
                margin: 20px 0 20px;
            }
            h1 small {
                display: block;
                font-size: 15px;
                padding-top: 8px;
                color: gray;
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
                top: 10px;
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
                top: 10px;
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
        <script>
            window.console = window.console || function (t) {};
        </script>
        <script>
            if (document.location.search.match(/type=embed/gi)) {
                window.parent.postMessage("resize", "*");
            }
        </script>
    </head>
    <body translate="no">
        <div class="container">
            <h1>jQuery Image Upload
                <small>with preview</small>
            </h1>
            <div class="avatar-upload">
                <div class="avatar-edit">
                    <input type="file" id="imageUpload" accept=".png, .jpg, .jpeg">
                    <label for="imageUpload"></label>
                </div>
                <div class="avatar-preview">
                    <div id="imagePreview" style="background-image: url(http://i.pravatar.cc/500?img=7);">
                    </div>
                </div>
            </div>
        </div>
        <script src="static/vendors/jquery/dist/jquery.min.js" type="53fb5546d8872ed72f1ff495-text/javascript"></script>
        <script src="static/vendors/bootstrap/dist/js/bootstrap.min.js" type="53fb5546d8872ed72f1ff495-text/javascript"></script>
        <script src="static/vendors/build/js/custom.min.js" type="53fb5546d8872ed72f1ff495-text/javascript"></script>
        <script src="https://ajax.cloudflare.com/cdn-cgi/scripts/a2bd7673/cloudflare-static/rocket-loader.min.js" data-cf-settings="53fb5546d8872ed72f1ff495-|49" defer=""></script>
        <script src="https://kit.fontawesome.com/3135afb4f3.js"></script>
        <script id="rendered-js">
            function readURL(input) {
                if (input.files && input.files[0]) {
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        $('#imagePreview').css('background-image', 'url(' + e.target.result + ')');
                        $('#imagePreview').hide();
                        $('#imagePreview').fadeIn(650);
                    };
                    reader.readAsDataURL(input.files[0]);
                }
            }
            $("#imageUpload").change(function () {
                readURL(this);
            });
            //# sourceURL=pen.js
        </script>
    </body>
</html>