<%-- 
    Document   : myPets
    Created on : Jul 10, 2019, 4:37:09 PM
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

        <!-- Bootstrap -->
        <link href="static/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Font Awesome -->
        <link href="static/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
        <!-- NProgress -->
        <link href="static/vendors/nprogress/nprogress.css" rel="stylesheet">
        <!-- Custom Theme Style -->
        <link href="static/vendors/build/css/custom.min.css" rel="stylesheet">
        <!-- Ajax jquery.min.js -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <!-- Cropper.js -->
        <link href="static/vendors/cropper/dist/cropper.min.css" rel="stylesheet">


    </head>
    <style>


        #imgContainer{
            zoom:100%;
        }  

        @media all and (min-width: 960px) {
            #modalDialogAddPet{
                position: relative;
                display: table; /* <-- This makes the trick */
                overflow-y: auto;    
                overflow-x: auto;
                width:750px;


            }
        }
        @media all and (max-width: 959px) and (min-width: 600px) {
            #modalDialogAddPet{
                position: relative;
                display: table; /* <-- This makes the trick */
                overflow-y: auto;    
                overflow-x: auto;
                max-width:750px;


            }
        }
        @media all and (max-width: 599px) and (min-width: 320px) {
            #modalDialogAddPet{
                position: relative;
                display: table; /* <-- This makes the trick */
                overflow-y: auto;    
                overflow-x: auto;
                max-width:400px;


            }
        }

        #deleteConfirmModal #deleteConfirmDialog{
            max-width: 40% !important;
        }
    </style>
    <script type="text/javascript">

        var type = "Dog";
        var name = "Nameless";
        var breed = "#";
        var gender = "female";
        var age = "#";
        var vaccination;
        var microchipNo;
        var allergies;
        var underMedication;
        var eatingRoutine;
        var sleepingPlace;
        var neutered;
        var friendly;
        var getAlongChild;
        var size = "#";
        var petImg = "static/images/user.png";
        var id = 0;


        var petList = new Array();
        $(document).ready(function () {
        <c:forEach var="p" items="${pets}">
            console.log("name222:" + '${p.name}');
            var pet = {
                "id": '${p.id}',
                "name": '${p.name}',
                "petType": '${p.petType}',
                "breed": '${p.breed}',
                "gender": '${p.gender}',
                "age": parseInt('${p.age}'),
                "petSize": '${p.petSize}',
                "microchipNo": '${p.microchipNo}',
                "allergies": '${p.allergies}',
                "underMedication": '${p.underMedication}',
                "eatingRoutine": '${p.eatingRoutine}',
                "sleepingPlace": '${p.sleepingPlace}',
                "neuteredStreilized": '${p.neuteredStreilized}',
                "friendly": '${p.friendly}',
                "getAlongChildren": '${p.getAlongChildren}',
                "vaccination": '${p.vaccination}'
            };
            petList.push(pet);
        </c:forEach>
            var pet = JSON.stringify(petList[0]);
            console.log(pet);
        });

        //Photo crop start-----------------------
        var dataURI;
        //Open photo picker
        function openPhotoPicker() {
            $('#btnSquare').trigger('click');
            $('#modalCropper').modal('show');
            $('#btnUploadClick').trigger('click');
        }
        // Modal
        $(function () {
            var petList = '${pets}';
            if (petList == '[]') {
                console.log("pets::" + petList);
                //  $("#yesPet").css("display", "block");
                //$("#noPet").css("display", "none");
                $('#noPet').show();
                $('#yesPet').hide();
            }
            //Upload image 1 secs after modal opened
            $('#getCroppedCanvasModal').on('show.bs.modal', function () {
                setTimeout(
                        function () {
                            addImage();
                        }, 1);
            });
            // display if image has a src
            $('#image').load(function () {
                var imageObj = $(this);
                if (!(imageObj.width() == 1 && imageObj.height() == 1)) {
                    console.log('Image source changed');
                    var image = $('#image').attr('src');
                    $('#image').attr('src', $('#image').attr('src'));
                }
            });
        });
        //Close modal
        function closeModal() {
            $('#getCroppedCanvasModal').modal('hide');
            $('#modalCropper').modal('hide');
        }
        //Convert data from 64b to Blob and upload
        function b64toBlob(dataURI) {
            var byteString = atob(dataURI.split(',')[1]);
            var ab = new ArrayBuffer(byteString.length);
            var ia = new Uint8Array(ab);
            for (var i = 0; i < byteString.length; i++) {
                ia[i] = byteString.charCodeAt(i);
            }
            return new Blob([ab], {type: 'image/jpeg'});
        }
        // get cropped image 
        function addImage() {
            dataURI = document.getElementById("download").href;
            var imgProfile = $("#myImg").attr("src", dataURI);
            var imgProfile2 = $("#myImg2").attr("src", dataURI);
            imgProfile.attr("width", "250");
            imgProfile.attr("height", "250");
            imgProfile2.attr("width", "250");
            imgProfile2.attr("height", "250");
            console.log("dataUri::" + dataURI);
            $('#getCroppedCanvasModal').modal('hide');
            $('#modalCropper').modal('hide');
            //     $('#getCroppedCanvasModal').css("display", "none");
            //   console.log("src::"+img.src);
            //  javascript:location.reload(true)
            //  var blob = b64toBlob(dataURI);
            // reader.readAsDataURL(blob);
        }
        //Read blob and convert to b64 to put image view
        var reader = new FileReader();
        reader.onload = function () {
            var b64Image = reader.result;
            console.log("img was put to img-1" + b64Image);
        };
        //Photo crop end---------------------

        function clearImage() {
            var imgProfile = $("#myImg").attr("src", "static/images/user.png");
            $('#genderFemale').trigger("click");
            $('#vaccinationNo').trigger("click");
            $('#size0-10kg').trigger("click");
            $('#neuteredStreilizedNo').trigger("click");
            $('#friendlyNo').trigger("click");
            $('#getAlongChildrenNo').trigger("click");
        }
        /*Notification*/
        function myFunction() {
            var txt = document.getElementById('unvan');
            var txt1 = document.getElementById('yetkili');
            if (txt.value === "" || txt1.value === "")
            {
                new PNotify({
                    title: 'Please (*) fill the blank!',
                    type: 'error',
                    styling: 'bootstrap3'
                });
            }
        }


        function whichGender(g) {
            gender = g;
        }
        function whichSize(s) {
            size = s;
        }
        function isVaccinated(v) {
            vaccination = v;
        }
        function isNeutered(n) {
            neutered = n;
        }
        function isFriendly(f) {
            friendly = f;
        }
        function isGetAlongChild(c) {
            getAlongChild = c
        }


        function addPet() {


            name = document.getElementById("name").value;
            type = document.getElementById("type").value;
            breed = document.getElementById("breed").value;
            age = document.getElementById("age").value;
            microchipNo = document.getElementById("microchipNo").value;
            allergies = document.getElementById("allergies").value;
            underMedication = document.getElementById("underMedication").value;
            eatingRoutine = document.getElementById("eatingRoutine").value;
            sleepingPlace = document.getElementById("sleepingPlace").value;
            petImg = dataURI;
            console.log(type + " " + name + " " + breed + " " + gender + " " + age + " " + microchipNo + " " + allergies + " " + underMedication + " " + eatingRoutine + " " + sleepingPlace + " " + vaccination + " " + size + " " + neutered + " " + friendly + " " + getAlongChild);
            var pet = JSON.stringify({
                "name": name,
                "petType": type,
                "breed": breed,
                "gender": gender,
                "age": parseInt(age),
                "petSize": size,
                "microchipNo": microchipNo,
                "allergies": allergies,
                "underMedication": underMedication,
                "eatingRoutine": eatingRoutine,
                "sleepingPlace": sleepingPlace,
                "neuteredStreilized": neutered,
                "friendly": friendly,
                "getAlongChildren": getAlongChild,
                "vaccination": vaccination
            });
            console.log("Test" + pet);
            $('#result').val(pet);
            //$("#addPet").submit();
        }

        var updateId;
        /*EditPet*/
        function editPet(id) {
            updateId = id;
            console.log("ff" + id);
            for (var i = 0; i < petList.length; i++) {

                if (petList[i].id == id) {
                    showBreed2();
                    const petPhoto = "static/images/dog.jpg";
                    const petName = petList[i].name;
                    const petBreed = petList[i].breed;
                    var petSize = petList[i].petSize;
                    petSize = petSize.replace("+", "");
                    console.log("Pet size" + petSize);
                    const petAge = petList[i].age;
                    const petGender = petList[i].gender;
                    const petType = petList[i].petType;
                    const vaccination = petList[i].vaccination;
                    const microchipNo = petList[i].microchipNo;
                    const allergies = petList[i].allergies;
                    const underMedication = petList[i].underMedication;
                    const eatingRoutine = petList[i].eatingRoutine;
                    const sleepingPlace = petList[i].sleepingPlace;
                    const neuteredStreilized = petList[i].neuteredStreilized;
                    const friendly = petList[i].friendly;
                    const getAlongChildren = petList[i].getAlongChildren;
                    document.querySelector('#name1').value = petName;
                    document.querySelector('#type1').value = petType;
                    showBreed2();
                    document.querySelector('#breed1').value = petBreed;

                    document.querySelector('#age1').value = petAge;
                    document.querySelector('#myImg2').src = petPhoto;

                    document.querySelector('#microchipNo1').value = microchipNo;
                    document.querySelector('#allergies1').value = allergies;
                    document.querySelector('#underMedication1').value = underMedication;
                    document.querySelector('#eatingRoutine1').value = eatingRoutine;
                    document.querySelector('#sleepingPlace1').value = sleepingPlace;
                    $('#gender' + petGender + "1").trigger("click");
                    $('#vaccination' + vaccination + "1").trigger("click");
                    $('#size' + petSize + "1").trigger("click");
                    $('#neuteredStreilized' + neuteredStreilized + "1").trigger("click");
                    $('#friendly' + friendly + "1").trigger("click");
                    $('#getAlongChildren' + getAlongChildren + "1").trigger("click");
                    $('#modalEditPet').modal("show");
                }
            }

            //$("#addBtn").css("display", "none");
            //$("#addBtn").attr("onclick", "updatePet();");

        }

        function updatePet() {
            name = document.getElementById("name1").value;
            type = document.getElementById("type1").value;
            breed = document.getElementById("breed1").value;
            age = document.getElementById("age1").value;
            microchipNo = document.getElementById("microchipNo1").value;
            allergies = document.getElementById("allergies1").value;
            underMedication = document.getElementById("underMedication1").value;
            eatingRoutine = document.getElementById("eatingRoutine1").value;
            sleepingPlace = document.getElementById("sleepingPlace1").value;
            petImg = dataURI;
            console.log(type + " " + name + " " + breed + " " + gender + " " + age + " " + microchipNo + " " + allergies + " " + underMedication + " " + eatingRoutine + " " + sleepingPlace + " " + vaccination + " " + size + " " + neutered + " " + friendly + " " + getAlongChild);
            var pet = JSON.stringify({
                "id": updateId,
                "name": name,
                "petType": type,
                "breed": breed,
                "gender": gender,
                "age": parseInt(age),
                "petSize": size,
                "microchipNo": microchipNo,
                "allergies": allergies,
                "underMedication": underMedication,
                "eatingRoutine": eatingRoutine,
                "sleepingPlace": sleepingPlace,
                "neuteredStreilized": neutered,
                "friendly": friendly,
                "getAlongChildren": getAlongChild,
                "vaccination": vaccination
            });
            console.log("Test" + pet);
            $('#resultUpdate').val(pet);
            // $("#updatePet").submit();
        }

        function changeButtonType() {
            $('#deleteBtn').attr('type', 'submit');
            $('#deleteBtn').trigger("click");
        }
        function showBreed() {
            var type = document.getElementById("type").value;
            if (type == 'Dog') {
                document.getElementById("breedCatDog").innerHTML = '<select id="breed" class="form-control"> <option value="Affenpinscher">Affenpinscher</option> <option value="Afghan Hound">Afghan Hound</option> <option value="Airedale Terrier">Airedale Terrier</option> <option value="Akita">Akita</option> <option value="Alaskan Klee Kai">Alaskan Klee Kai</option> <option value="Alaskan Malamute">Alaskan Malamute</option> <option value="American Bulldog">American Bulldog</option> <option value="American English Coonhound">American English Coonhound</option> <option value="American Eskimo Dog">American Eskimo Dog</option> <option value="American Foxhound">American Foxhound</option> <option value="American Pit Bull Terrier">American Pit Bull Terrier</option> <option value="American Staffordshire Terrier">American Staffordshire Terrier</option> <option value="American Water Spaniel">American Water Spaniel</option> <option value="Anatolian Shepherd Dog">Anatolian Shepherd Dog</option> <option value="Appenzeller Sennenhunde">Appenzeller Sennenhunde</option> <option value="Australian Cattle Dog">Australian Cattle Dog</option> <option value="Australian Kelpie">Australian Kelpie</option> <option value="Australian Shepherd">Australian Shepherd</option> <option value="Australian Terrier">Australian Terrier</option> <option value="Azawakh">Azawakh</option> <option value="Barbet">Barbet</option> <option value="Basenji">Basenji</option> <option value="Basset Hound">Basset Hound</option> <option value="Beagle">Beagle</option> <option value="Bearded Collie">Bearded Collie</option> <option value="Bedlington Terrier">Bedlington Terrier</option> <option value="Belgian Malinois">Belgian Malinois</option> <option value="Belgian Sheepdog">Belgian Sheepdog</option> <option value="Belgian Tervuren">Belgian Tervuren</option> <option value="Berger Picard">Berger Picard</option> <option value="Bernedoodle">Bernedoodle</option> <option value="Bernese Mountain Dog">Bernese Mountain Dog</option> <option value="Bichon Frise">Bichon Frise</option> <option value="Black and Tan Coonhound">Black and Tan Coonhound</option> <option value="Black Mouth Cur">Black Mouth Cur</option> <option value="Black Russian Terrier">Black Russian Terrier</option> <option value="Bloodhound">Bloodhound</option> <option value="Blue Lacy">Blue Lacy</option> <option value="Bluetick Coonhound">Bluetick Coonhound</option> <option value="Boerboel">Boerboel</option> <option value="Bolognese">Bolognese</option> <option value="Border Collie">Border Collie</option> <option value="Border Terrier">Border Terrier</option> <option value="Borzoi">Borzoi</option> <option value="Boston Terrier">Boston Terrier</option> <option value="Bouvier des Flandres">Bouvier des Flandres</option> <option value="Boxer">Boxer</option> <option value="Boykin Spaniel">Boykin Spaniel</option> <option value="Bracco Italiano">Bracco Italiano</option> <option value="Briard">Briard</option> <option value="Brittany">Brittany</option> <option value="Brussels Griffon">Brussels Griffon</option> <option value="Bull Terrier">Bull Terrier</option> <option value="Bulldog">Bulldog</option> <option value="Bullmastiff">Bullmastiff</option> <option value="Cairn Terrier">Cairn Terrier</option> <option value="Canaan Dog">Canaan Dog</option> <option value="Cane Corso">Cane Corso</option> <option value="Cardigan Welsh Corgi">Cardigan Welsh Corgi</option> <option value="Catahoula Leopard Dog">Catahoula Leopard Dog</option> <option value="Caucasian Shepherd Dog">Caucasian Shepherd Dog</option> <option value="Cavalier King Charles Spaniel">Cavalier King Charles Spaniel</option> <option value="Cesky Terrier">Cesky Terrier</option> <option value="Chesapeake Bay Retriever">Chesapeake Bay Retriever</option> <option value="Chihuahua">Chihuahua</option> <option value="Chinese Crested">Chinese Crested</option> <option value="Chinese Shar-Pei">Chinese Shar-Pei</option> <option value="Chinook">Chinook</option> <option value="Chow Chow">Chow Chow</option> <option value="Clumber Spaniel">Clumber Spaniel</option> <option value="Cockapoo">Cockapoo</option> <option value="Cocker Spaniel">Cocker Spaniel</option> <option value="Collie">Collie</option> <option value="Coton de Tulear">Coton de Tulear</option> <option value="Curly-Coated Retriever">Curly-Coated Retriever</option> <option value="Dachshund">Dachshund</option> <option value="Dalmatian">Dalmatian</option> <option value="Dandie Dinmont Terrier">Dandie Dinmont Terrier</option> <option value="Doberman Pinscher">Doberman Pinscher</option> <option value="Dogo Argentino">Dogo Argentino</option> <option value="Dogue de Bordeaux">Dogue de Bordeaux</option> <option value="Dutch Shepherd">Dutch Shepherd</option> <option value="English Cocker Spaniel">English Cocker Spaniel</option> <option value="English Foxhound">English Foxhound</option> <option value="English Setter">English Setter</option> <option value="English Springer Spaniel">English Springer Spaniel</option> <option value="English Toy Spaniel">English Toy Spaniel</option> <option value="Entlebucher Mountain Dog">Entlebucher Mountain Dog</option> <option value="Field Spaniel">Field Spaniel</option> <option value="Finnish Lapphund">Finnish Lapphund</option> <option value="Finnish Spitz">Finnish Spitz</option> <option value="Flat-Coated Retriever">Flat-Coated Retriever</option> <option value="Fox Terrier">Fox Terrier</option> <option value="French Bulldog">French Bulldog</option> <option value="German Pinscher">German Pinscher</option> <option value="German Shepherd Dog">German Shepherd Dog</option> <option value="German Shorthaired Pointer">German Shorthaired Pointer</option> <option value="German Wirehaired Pointer">German Wirehaired Pointer</option> <option value="Giant Schnauzer">Giant Schnauzer</option> <option value="Glen of Imaal Terrier">Glen of Imaal Terrier</option> <option value="Goldador">Goldador</option> <option value="Golden Retriever">Golden Retriever</option> <option value="Goldendoodle">Goldendoodle</option> <option value="Gordon Setter">Gordon Setter</option> <option value="Great Dane">Great Dane</option> <option value="Great Pyrenees">Great Pyrenees</option> <option value="Greater Swiss Mountain Dog">Greater Swiss Mountain Dog</option> <option value="Greyhound">Greyhound</option> <option value="Harrier">Harrier</option> <option value="Havanese">Havanese</option> <option value="Ibizan Hound">Ibizan Hound</option> <option value="Icelandic Sheepdog">Icelandic Sheepdog</option> <option value="Irish Red and White Setter">Irish Red and White Setter</option> <option value="Irish Setter">Irish Setter</option> <option value="Irish Terrier">Irish Terrier</option> <option value="Irish Water Spaniel">Irish Water Spaniel</option> <option value="Irish Wolfhound">Irish Wolfhound</option> <option value="Italian Greyhound">Italian Greyhound</option> <option value="Jack Russell Terrier">Jack Russell Terrier</option> <option value="Japanese Chin">Japanese Chin</option> <option value="Japanese Spitz">Japanese Spitz</option> <option value="Karelian Bear Dog">Karelian Bear Dog</option> <option value="Keeshond">Keeshond</option> <option value="Kerry Blue Terrier">Kerry Blue Terrier</option> <option value="Komondor">Komondor</option> <option value="Kooikerhondje">Kooikerhondje</option> <option value="Korean Jindo Dog">Korean Jindo Dog</option> <option value="Kuvasz">Kuvasz</option> <option value="Labradoodle">Labradoodle</option> <option value="Labrador Retriever">Labrador Retriever</option> <option value="Lagotto Romagnolo">Lagotto Romagnolo</option> <option value="Lakeland Terrier">Lakeland Terrier</option> <option value="Lancashire Heeler">Lancashire Heeler</option> <option value="Leonberger">Leonberger</option> <option value="Lhasa Apso">Lhasa Apso</option> <option value="Lowchen">Lowchen</option> <option value="Maltese">Maltese</option> <option value="Maltese Shih Tzu">Maltese Shih Tzu</option> <option value="Maltipoo">Maltipoo</option> <option value="Manchester Terrier">Manchester Terrier</option> <option value="Mastiff">Mastiff</option> <option value="Miniature Pinscher">Miniature Pinscher</option> <option value="Miniature Schnauzer">Miniature Schnauzer</option> <option value="Mudi">Mudi</option> <option value="Mutt">Mutt</option> <option value="Neapolitan Mastiff">Neapolitan Mastiff</option> <option value="Newfoundland">Newfoundland</option> <option value="Norfolk Terrier">Norfolk Terrier</option> <option value="Norwegian Buhund">Norwegian Buhund</option> <option value="Norwegian Elkhound">Norwegian Elkhound</option> <option value="Norwegian Lundehund">Norwegian Lundehund</option> <option value="Norwich Terrier">Norwich Terrier</option> <option value="Nova Scotia Duck Tolling Retriever">Nova Scotia Duck Tolling Retriever</option> <option value="Old English Sheepdog">Old English Sheepdog</option> <option value="Otterhound">Otterhound</option> <option value="Papillon">Papillon</option> <option value="Peekapoo">Peekapoo</option> <option value="Pekingese">Pekingese</option> <option value="Pembroke Welsh Corgi">Pembroke Welsh Corgi</option> <option value="Petit Basset Griffon Vendeen">Petit Basset Griffon Vendeen</option> <option value="Pharaoh Hound">Pharaoh Hound</option> <option value="Plott">Plott</option> <option value="Pocket Beagle">Pocket Beagle</option> <option value="Pointer">Pointer</option> <option value="Polish Lowland Sheepdog">Polish Lowland Sheepdog</option> <option value="Pomeranian">Pomeranian</option> <option value="Pomsky">Pomsky</option> <option value="Poodle">Poodle</option> <option value="Portuguese Water Dog">Portuguese Water Dog</option> <option value="Pug">Pug</option> <option value="Puggle">Puggle</option> <option value="Puli">Puli</option> <option value="Pyrenean Shepherd">Pyrenean Shepherd</option> <option value="Rat Terrier">Rat Terrier</option> <option value="Redbone Coonhound">Redbone Coonhound</option> <option value="Rhodesian Ridgeback">Rhodesian Ridgeback</option> <option value="Rottweiler">Rottweiler</option> <option value="Saint Bernard">Saint Bernard</option> <option value="Saluki">Saluki</option> <option value="Samoyed">Samoyed</option> <option value="Schipperke">Schipperke</option> <option value="Schnoodle">Schnoodle</option> <option value="Scottish Deerhound">Scottish Deerhound</option> <option value="Scottish Terrier">Scottish Terrier</option> <option value="Sealyham Terrier">Sealyham Terrier</option> <option value="Shetland Sheepdog">Shetland Sheepdog</option> <option value="Shiba Inu">Shiba Inu</option> <option value="Shih Tzu">Shih Tzu</option> <option value="Siberian Husky">Siberian Husky</option> <option value="Silken Windhound">Silken Windhound</option> <option value="Silky Terrier">Silky Terrier</option> <option value="Skye Terrier">Skye Terrier</option> <option value="Sloughi">Sloughi</option> <option value="Small Munsterlander Pointer">Small Munsterlander Pointer</option> <option value="Soft Coated Wheaten Terrier">Soft Coated Wheaten Terrier</option> <option value="Stabyhoun">Stabyhoun</option> <option value="Staffordshire Bull Terrier">Staffordshire Bull Terrier</option> <option value="Standard Schnauzer">Standard Schnauzer</option> <option value="Sussex Spaniel">Sussex Spaniel</option> <option value="Swedish Vallhund">Swedish Vallhund</option> <option value="Tibetan Mastiff">Tibetan Mastiff</option> <option value="Tibetan Spaniel">Tibetan Spaniel</option> <option value="Tibetan Terrier">Tibetan Terrier</option> <option value="Toy Fox Terrier">Toy Fox Terrier</option> <option value="Treeing Tennessee Brindle">Treeing Tennessee Brindle</option> <option value="Treeing Walker Coonhound">Treeing Walker Coonhound</option> <option value="Vizsla">Vizsla</option> <option value="Weimaraner">Weimaraner</option> <option value="Welsh Springer Spaniel">Welsh Springer Spaniel</option> <option value="Welsh Terrier">Welsh Terrier</option> <option value="West Highland White Terrier">West Highland White Terrier</option> <option value="Whippet">Whippet</option> <option value="Wirehaired Pointing Griffon">Wirehaired Pointing Griffon</option> <option value="Xoloitzcuintli">Xoloitzcuintli</option> <option value="Yorkipoo">Yorkipoo</option> <option value="Yorkshire Terrier">Yorkshire Terrier</option> </select>';
            } else if (type == 'Cat') {
                document.getElementById("breedCatDog").innerHTML = '<select id="breed" class="form-control"> <option value="Abyssinian">Abyssinian</option> <option value="American Bobtail">American Bobtail</option> <option value="American Curl">American Curl</option> <option value="American Shorthair">American Shorthair</option> <option value="American Wirehair">American Wirehair</option> <option value="Balinese">Balinese</option> <option value="Bengal Cats">Bengal Cats</option> <option value="Birman">Birman</option> <option value="Bombay">Bombay</option> <option value="British Shorthair">British Shorthair</option> <option value="Burmese">Burmese</option> <option value="Burmilla">Burmilla</option> <option value="Chartreux">Chartreux</option> <option value="Chinese Li Hua">Chinese Li Hua</option> <option value="Colorpoint Shorthair">Colorpoint Shorthair</option> <option value="Cornish Rex">Cornish Rex</option> <option value="Cymric">Cymric</option> <option value="Devon Rex">Devon Rex</option> <option value="Egyptian Mau">Egyptian Mau</option> <option value="European Burmese">European Burmese</option> <option value="Exotic">Exotic</option> <option value="Havana Brown">Havana Brown</option> <option value="Himalayan">Himalayan</option> <option value="Japanese Bobtail">Japanese Bobtail</option> <option value="Javanese">Javanese</option> <option value="Korat">Korat</option> <option value="LaPerm">LaPerm</option> <option value="Maine Coon">Maine Coon</option> <option value="Manx">Manx</option> <option value="Nebelung">Nebelung</option> <option value="Norwegian Forest">Norwegian Forest</option> <option value="Ocicat">Ocicat</option> <option value="Oriental">Oriental</option> <option value="Persian">Persian</option> <option value="Pixie-Bob">Pixie-Bob</option> <option value="Ragamuffin">Ragamuffin</option> <option value="Ragdoll Cats">Ragdoll Cats</option> <option value="Russian Blue">Russian Blue</option> <option value="Savannah">Savannah</option> <option value="Scottish Fold">Scottish Fold</option> <option value="Selkirk Rex">Selkirk Rex</option> <option value="Siamese Cat">Siamese Cat</option> <option value="Siberian">Siberian</option> <option value="Singapura">Singapura</option> <option value="Snowshoe">Snowshoe</option> <option value="Somali">Somali</option> <option value="Sphynx">Sphynx</option> <option value="Tonkinese">Tonkinese</option> <option value="Turkish Angora">Turkish Angora</option> <option value="Turkish Van">Turkish Van</option> </select>';
            }
        }
        function showBreed2() {
            var type = document.getElementById("type1").value;
            if (type == 'Dog') {
                document.getElementById("breedCatDog2").innerHTML = '<select id="breed1" class="form-control"> <option value="Affenpinscher">Affenpinscher</option> <option value="Afghan Hound">Afghan Hound</option> <option value="Airedale Terrier">Airedale Terrier</option> <option value="Akita">Akita</option> <option value="Alaskan Klee Kai">Alaskan Klee Kai</option> <option value="Alaskan Malamute">Alaskan Malamute</option> <option value="American Bulldog">American Bulldog</option> <option value="American English Coonhound">American English Coonhound</option> <option value="American Eskimo Dog">American Eskimo Dog</option> <option value="American Foxhound">American Foxhound</option> <option value="American Pit Bull Terrier">American Pit Bull Terrier</option> <option value="American Staffordshire Terrier">American Staffordshire Terrier</option> <option value="American Water Spaniel">American Water Spaniel</option> <option value="Anatolian Shepherd Dog">Anatolian Shepherd Dog</option> <option value="Appenzeller Sennenhunde">Appenzeller Sennenhunde</option> <option value="Australian Cattle Dog">Australian Cattle Dog</option> <option value="Australian Kelpie">Australian Kelpie</option> <option value="Australian Shepherd">Australian Shepherd</option> <option value="Australian Terrier">Australian Terrier</option> <option value="Azawakh">Azawakh</option> <option value="Barbet">Barbet</option> <option value="Basenji">Basenji</option> <option value="Basset Hound">Basset Hound</option> <option value="Beagle">Beagle</option> <option value="Bearded Collie">Bearded Collie</option> <option value="Bedlington Terrier">Bedlington Terrier</option> <option value="Belgian Malinois">Belgian Malinois</option> <option value="Belgian Sheepdog">Belgian Sheepdog</option> <option value="Belgian Tervuren">Belgian Tervuren</option> <option value="Berger Picard">Berger Picard</option> <option value="Bernedoodle">Bernedoodle</option> <option value="Bernese Mountain Dog">Bernese Mountain Dog</option> <option value="Bichon Frise">Bichon Frise</option> <option value="Black and Tan Coonhound">Black and Tan Coonhound</option> <option value="Black Mouth Cur">Black Mouth Cur</option> <option value="Black Russian Terrier">Black Russian Terrier</option> <option value="Bloodhound">Bloodhound</option> <option value="Blue Lacy">Blue Lacy</option> <option value="Bluetick Coonhound">Bluetick Coonhound</option> <option value="Boerboel">Boerboel</option> <option value="Bolognese">Bolognese</option> <option value="Border Collie">Border Collie</option> <option value="Border Terrier">Border Terrier</option> <option value="Borzoi">Borzoi</option> <option value="Boston Terrier">Boston Terrier</option> <option value="Bouvier des Flandres">Bouvier des Flandres</option> <option value="Boxer">Boxer</option> <option value="Boykin Spaniel">Boykin Spaniel</option> <option value="Bracco Italiano">Bracco Italiano</option> <option value="Briard">Briard</option> <option value="Brittany">Brittany</option> <option value="Brussels Griffon">Brussels Griffon</option> <option value="Bull Terrier">Bull Terrier</option> <option value="Bulldog">Bulldog</option> <option value="Bullmastiff">Bullmastiff</option> <option value="Cairn Terrier">Cairn Terrier</option> <option value="Canaan Dog">Canaan Dog</option> <option value="Cane Corso">Cane Corso</option> <option value="Cardigan Welsh Corgi">Cardigan Welsh Corgi</option> <option value="Catahoula Leopard Dog">Catahoula Leopard Dog</option> <option value="Caucasian Shepherd Dog">Caucasian Shepherd Dog</option> <option value="Cavalier King Charles Spaniel">Cavalier King Charles Spaniel</option> <option value="Cesky Terrier">Cesky Terrier</option> <option value="Chesapeake Bay Retriever">Chesapeake Bay Retriever</option> <option value="Chihuahua">Chihuahua</option> <option value="Chinese Crested">Chinese Crested</option> <option value="Chinese Shar-Pei">Chinese Shar-Pei</option> <option value="Chinook">Chinook</option> <option value="Chow Chow">Chow Chow</option> <option value="Clumber Spaniel">Clumber Spaniel</option> <option value="Cockapoo">Cockapoo</option> <option value="Cocker Spaniel">Cocker Spaniel</option> <option value="Collie">Collie</option> <option value="Coton de Tulear">Coton de Tulear</option> <option value="Curly-Coated Retriever">Curly-Coated Retriever</option> <option value="Dachshund">Dachshund</option> <option value="Dalmatian">Dalmatian</option> <option value="Dandie Dinmont Terrier">Dandie Dinmont Terrier</option> <option value="Doberman Pinscher">Doberman Pinscher</option> <option value="Dogo Argentino">Dogo Argentino</option> <option value="Dogue de Bordeaux">Dogue de Bordeaux</option> <option value="Dutch Shepherd">Dutch Shepherd</option> <option value="English Cocker Spaniel">English Cocker Spaniel</option> <option value="English Foxhound">English Foxhound</option> <option value="English Setter">English Setter</option> <option value="English Springer Spaniel">English Springer Spaniel</option> <option value="English Toy Spaniel">English Toy Spaniel</option> <option value="Entlebucher Mountain Dog">Entlebucher Mountain Dog</option> <option value="Field Spaniel">Field Spaniel</option> <option value="Finnish Lapphund">Finnish Lapphund</option> <option value="Finnish Spitz">Finnish Spitz</option> <option value="Flat-Coated Retriever">Flat-Coated Retriever</option> <option value="Fox Terrier">Fox Terrier</option> <option value="French Bulldog">French Bulldog</option> <option value="German Pinscher">German Pinscher</option> <option value="German Shepherd Dog">German Shepherd Dog</option> <option value="German Shorthaired Pointer">German Shorthaired Pointer</option> <option value="German Wirehaired Pointer">German Wirehaired Pointer</option> <option value="Giant Schnauzer">Giant Schnauzer</option> <option value="Glen of Imaal Terrier">Glen of Imaal Terrier</option> <option value="Goldador">Goldador</option> <option value="Golden Retriever">Golden Retriever</option> <option value="Goldendoodle">Goldendoodle</option> <option value="Gordon Setter">Gordon Setter</option> <option value="Great Dane">Great Dane</option> <option value="Great Pyrenees">Great Pyrenees</option> <option value="Greater Swiss Mountain Dog">Greater Swiss Mountain Dog</option> <option value="Greyhound">Greyhound</option> <option value="Harrier">Harrier</option> <option value="Havanese">Havanese</option> <option value="Ibizan Hound">Ibizan Hound</option> <option value="Icelandic Sheepdog">Icelandic Sheepdog</option> <option value="Irish Red and White Setter">Irish Red and White Setter</option> <option value="Irish Setter">Irish Setter</option> <option value="Irish Terrier">Irish Terrier</option> <option value="Irish Water Spaniel">Irish Water Spaniel</option> <option value="Irish Wolfhound">Irish Wolfhound</option> <option value="Italian Greyhound">Italian Greyhound</option> <option value="Jack Russell Terrier">Jack Russell Terrier</option> <option value="Japanese Chin">Japanese Chin</option> <option value="Japanese Spitz">Japanese Spitz</option> <option value="Karelian Bear Dog">Karelian Bear Dog</option> <option value="Keeshond">Keeshond</option> <option value="Kerry Blue Terrier">Kerry Blue Terrier</option> <option value="Komondor">Komondor</option> <option value="Kooikerhondje">Kooikerhondje</option> <option value="Korean Jindo Dog">Korean Jindo Dog</option> <option value="Kuvasz">Kuvasz</option> <option value="Labradoodle">Labradoodle</option> <option value="Labrador Retriever">Labrador Retriever</option> <option value="Lagotto Romagnolo">Lagotto Romagnolo</option> <option value="Lakeland Terrier">Lakeland Terrier</option> <option value="Lancashire Heeler">Lancashire Heeler</option> <option value="Leonberger">Leonberger</option> <option value="Lhasa Apso">Lhasa Apso</option> <option value="Lowchen">Lowchen</option> <option value="Maltese">Maltese</option> <option value="Maltese Shih Tzu">Maltese Shih Tzu</option> <option value="Maltipoo">Maltipoo</option> <option value="Manchester Terrier">Manchester Terrier</option> <option value="Mastiff">Mastiff</option> <option value="Miniature Pinscher">Miniature Pinscher</option> <option value="Miniature Schnauzer">Miniature Schnauzer</option> <option value="Mudi">Mudi</option> <option value="Mutt">Mutt</option> <option value="Neapolitan Mastiff">Neapolitan Mastiff</option> <option value="Newfoundland">Newfoundland</option> <option value="Norfolk Terrier">Norfolk Terrier</option> <option value="Norwegian Buhund">Norwegian Buhund</option> <option value="Norwegian Elkhound">Norwegian Elkhound</option> <option value="Norwegian Lundehund">Norwegian Lundehund</option> <option value="Norwich Terrier">Norwich Terrier</option> <option value="Nova Scotia Duck Tolling Retriever">Nova Scotia Duck Tolling Retriever</option> <option value="Old English Sheepdog">Old English Sheepdog</option> <option value="Otterhound">Otterhound</option> <option value="Papillon">Papillon</option> <option value="Peekapoo">Peekapoo</option> <option value="Pekingese">Pekingese</option> <option value="Pembroke Welsh Corgi">Pembroke Welsh Corgi</option> <option value="Petit Basset Griffon Vendeen">Petit Basset Griffon Vendeen</option> <option value="Pharaoh Hound">Pharaoh Hound</option> <option value="Plott">Plott</option> <option value="Pocket Beagle">Pocket Beagle</option> <option value="Pointer">Pointer</option> <option value="Polish Lowland Sheepdog">Polish Lowland Sheepdog</option> <option value="Pomeranian">Pomeranian</option> <option value="Pomsky">Pomsky</option> <option value="Poodle">Poodle</option> <option value="Portuguese Water Dog">Portuguese Water Dog</option> <option value="Pug">Pug</option> <option value="Puggle">Puggle</option> <option value="Puli">Puli</option> <option value="Pyrenean Shepherd">Pyrenean Shepherd</option> <option value="Rat Terrier">Rat Terrier</option> <option value="Redbone Coonhound">Redbone Coonhound</option> <option value="Rhodesian Ridgeback">Rhodesian Ridgeback</option> <option value="Rottweiler">Rottweiler</option> <option value="Saint Bernard">Saint Bernard</option> <option value="Saluki">Saluki</option> <option value="Samoyed">Samoyed</option> <option value="Schipperke">Schipperke</option> <option value="Schnoodle">Schnoodle</option> <option value="Scottish Deerhound">Scottish Deerhound</option> <option value="Scottish Terrier">Scottish Terrier</option> <option value="Sealyham Terrier">Sealyham Terrier</option> <option value="Shetland Sheepdog">Shetland Sheepdog</option> <option value="Shiba Inu">Shiba Inu</option> <option value="Shih Tzu">Shih Tzu</option> <option value="Siberian Husky">Siberian Husky</option> <option value="Silken Windhound">Silken Windhound</option> <option value="Silky Terrier">Silky Terrier</option> <option value="Skye Terrier">Skye Terrier</option> <option value="Sloughi">Sloughi</option> <option value="Small Munsterlander Pointer">Small Munsterlander Pointer</option> <option value="Soft Coated Wheaten Terrier">Soft Coated Wheaten Terrier</option> <option value="Stabyhoun">Stabyhoun</option> <option value="Staffordshire Bull Terrier">Staffordshire Bull Terrier</option> <option value="Standard Schnauzer">Standard Schnauzer</option> <option value="Sussex Spaniel">Sussex Spaniel</option> <option value="Swedish Vallhund">Swedish Vallhund</option> <option value="Tibetan Mastiff">Tibetan Mastiff</option> <option value="Tibetan Spaniel">Tibetan Spaniel</option> <option value="Tibetan Terrier">Tibetan Terrier</option> <option value="Toy Fox Terrier">Toy Fox Terrier</option> <option value="Treeing Tennessee Brindle">Treeing Tennessee Brindle</option> <option value="Treeing Walker Coonhound">Treeing Walker Coonhound</option> <option value="Vizsla">Vizsla</option> <option value="Weimaraner">Weimaraner</option> <option value="Welsh Springer Spaniel">Welsh Springer Spaniel</option> <option value="Welsh Terrier">Welsh Terrier</option> <option value="West Highland White Terrier">West Highland White Terrier</option> <option value="Whippet">Whippet</option> <option value="Wirehaired Pointing Griffon">Wirehaired Pointing Griffon</option> <option value="Xoloitzcuintli">Xoloitzcuintli</option> <option value="Yorkipoo">Yorkipoo</option> <option value="Yorkshire Terrier">Yorkshire Terrier</option> </select>';
            } else if (type == 'Cat') {
                document.getElementById("breedCatDog2").innerHTML = '<select id="breed1" class="form-control"> <option value="Abyssinian">Abyssinian</option> <option value="American Bobtail">American Bobtail</option> <option value="American Curl">American Curl</option> <option value="American Shorthair">American Shorthair</option> <option value="American Wirehair">American Wirehair</option> <option value="Balinese">Balinese</option> <option value="Bengal Cats">Bengal Cats</option> <option value="Birman">Birman</option> <option value="Bombay">Bombay</option> <option value="British Shorthair">British Shorthair</option> <option value="Burmese">Burmese</option> <option value="Burmilla">Burmilla</option> <option value="Chartreux">Chartreux</option> <option value="Chinese Li Hua">Chinese Li Hua</option> <option value="Colorpoint Shorthair">Colorpoint Shorthair</option> <option value="Cornish Rex">Cornish Rex</option> <option value="Cymric">Cymric</option> <option value="Devon Rex">Devon Rex</option> <option value="Egyptian Mau">Egyptian Mau</option> <option value="European Burmese">European Burmese</option> <option value="Exotic">Exotic</option> <option value="Havana Brown">Havana Brown</option> <option value="Himalayan">Himalayan</option> <option value="Japanese Bobtail">Japanese Bobtail</option> <option value="Javanese">Javanese</option> <option value="Korat">Korat</option> <option value="LaPerm">LaPerm</option> <option value="Maine Coon">Maine Coon</option> <option value="Manx">Manx</option> <option value="Nebelung">Nebelung</option> <option value="Norwegian Forest">Norwegian Forest</option> <option value="Ocicat">Ocicat</option> <option value="Oriental">Oriental</option> <option value="Persian">Persian</option> <option value="Pixie-Bob">Pixie-Bob</option> <option value="Ragamuffin">Ragamuffin</option> <option value="Ragdoll Cats">Ragdoll Cats</option> <option value="Russian Blue">Russian Blue</option> <option value="Savannah">Savannah</option> <option value="Scottish Fold">Scottish Fold</option> <option value="Selkirk Rex">Selkirk Rex</option> <option value="Siamese Cat">Siamese Cat</option> <option value="Siberian">Siberian</option> <option value="Singapura">Singapura</option> <option value="Snowshoe">Snowshoe</option> <option value="Somali">Somali</option> <option value="Sphynx">Sphynx</option> <option value="Tonkinese">Tonkinese</option> <option value="Turkish Angora">Turkish Angora</option> <option value="Turkish Van">Turkish Van</option> </select>';
            }
        }
    </script>
    <body class="nav-md">
        <div class="container body">
            <div class="main_container">
                <jsp:include page="dashboardHeader.jsp"></jsp:include>
                    <div class="right_col" role="main">
                        <div>
                            <div class="page-title">
                                <div class="title_left">
                                    <!-- cropped Canvas -->
                                    <div class="modal fade docs-cropped" id="getCroppedCanvasModal" aria-hidden="true" aria-labelledby="getCroppedCanvasTitle" role="dialog" tabindex="-1">
                                        <div class="modal-dialog"  id="">
                                            <div class="modal-content">
                                                <div class="modal-body" style="display:none">
                                                </div>
                                                <div class="modal-footer" style="display:none">
                                                    <a class="btn btn-primary" data-dismiss-modal="modal2" onclick="addImage();" id="download" href="javascript:void(0);" >Upload</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <h3>My Pets <button id="yesPet" onclick="clearImage()" type="button" data-toggle="modal"  data-target="#modalAddPet" style="margin-left:10px; padding-left: 25px; padding-right: 25px;" class="btn btn-primary"><i class="fa fa-plus-circle" aria-hidden="true"> </i> Add More Pets </button></h3>
                                    <div class="x_content">

                                        <div class="modal fade bs-example-modal" id="modalAddPet" tabindex="-1" role="dialog" aria-hidden="true" style="display: none;">
                                            <div id="modalDialogAddPet" class="modal-dialog modal">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span>
                                                        </button>
                                                        <h4 class="modal-title" id="myModalLabel">Add a Pet</h4>
                                                    </div>
                                                    <div class="">
                                                        <div class="x_content">
                                                            <br />
                                                            <form id="addPet" class="form-horizontal form-label-left" novalidate action="addPet" method="POST">                                              
                                                                <div class="form-group">
                                                                    <div class="col-md-6 col-md-offset-3">
                                                                        <button style="display:none" id="send" type="submit" onclick="addPet()" class="btn btn-success">Submit</button>
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="col-md-2 col-xs-0 col-sm-2">
                                                                    </div>
                                                                    <!-- profil photo -->
                                                                    <div style="" class="col-xs-12 col-sm-4 col-md-4">
                                                                        <div class="col-md-0 col-xs-2">

                                                                        </div>
                                                                        <div class="col-md-12 col-xs-8">
                                                                            <img class="img-thumbnail img-circle" id="myImg" src="static/images/user.png" alt="Avatar" title="Change the avatar">
                                                                            <br>
                                                                            <br>
                                                                            <div class="col text-center">
                                                                                <a  class="buttonPrevious btn btn-success btn-xs" onClick="openPhotoPicker();" ><i style="margin-right: 7px" class="fa fa-upload"></i>Change Photo</a>                                                  
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-md-0  col-xs-2">
                                                                        </div>
                                                                    </div>

                                                                    <div class="col-md-6 col-xs-12 col-sm-6">
                                                                        <div class="item form-group">
                                                                            <label class="control-label col-md-3 col-sm-3 col-xs-12"  for="name">Name *</label>
                                                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                                                <input type="text" id="name" name="name" value="" required="required" class="form-control col-md-7 col-xs-12">
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label  class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name"><span class="required">Type *</span>
                                                                            </label>
                                                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                                                <select onchange="showBreed()" id="type" class="form-control">
                                                                                    <option>Dog</option>
                                                                                    <option>Cat</option>
                                                                                </select>
                                                                            </div>
                                                                        </div>

                                                                        <div class="form-group">
                                                                            <label id="labelBreed" class="control-label col-md-3 col-sm-3 col-xs-12"  for="breed">Breed *</label>

                                                                            <div style="display:block;" id="breedCatDog" class="col-md-6 col-sm-6 col-xs-12">
                                                                                <select id="breed" class="form-control">

                                                                                    <option value="Affenpinscher">Affenpinscher</option>
                                                                                    <option value="Afghan Hound">Afghan Hound</option>
                                                                                    <option value="Airedale Terrier">Airedale Terrier</option>
                                                                                    <option value="Akita">Akita</option>
                                                                                    <option value="Alaskan Klee Kai">Alaskan Klee Kai</option>
                                                                                    <option value="Alaskan Malamute">Alaskan Malamute</option>
                                                                                    <option value="American Bulldog">American Bulldog</option>
                                                                                    <option value="American English Coonhound">American English Coonhound</option>
                                                                                    <option value="American Eskimo Dog">American Eskimo Dog</option>
                                                                                    <option value="American Foxhound">American Foxhound</option>
                                                                                    <option value="American Pit Bull Terrier">American Pit Bull Terrier</option>
                                                                                    <option value="American Staffordshire Terrier">American Staffordshire Terrier</option>
                                                                                    <option value="American Water Spaniel">American Water Spaniel</option>
                                                                                    <option value="Anatolian Shepherd Dog">Anatolian Shepherd Dog</option>
                                                                                    <option value="Appenzeller Sennenhunde">Appenzeller Sennenhunde</option>
                                                                                    <option value="Australian Cattle Dog">Australian Cattle Dog</option>
                                                                                    <option value="Australian Kelpie">Australian Kelpie</option>
                                                                                    <option value="Australian Shepherd">Australian Shepherd</option>
                                                                                    <option value="Australian Terrier">Australian Terrier</option>
                                                                                    <option value="Azawakh">Azawakh</option>
                                                                                    <option value="Barbet">Barbet</option>
                                                                                    <option value="Basenji">Basenji</option>
                                                                                    <option value="Basset Hound">Basset Hound</option>
                                                                                    <option value="Beagle">Beagle</option>
                                                                                    <option value="Bearded Collie">Bearded Collie</option>
                                                                                    <option value="Bedlington Terrier">Bedlington Terrier</option>
                                                                                    <option value="Belgian Malinois">Belgian Malinois</option>
                                                                                    <option value="Belgian Sheepdog">Belgian Sheepdog</option>
                                                                                    <option value="Belgian Tervuren">Belgian Tervuren</option>
                                                                                    <option value="Berger Picard">Berger Picard</option>
                                                                                    <option value="Bernedoodle">Bernedoodle</option>
                                                                                    <option value="Bernese Mountain Dog">Bernese Mountain Dog</option>
                                                                                    <option value="Bichon Frise">Bichon Frise</option>
                                                                                    <option value="Black and Tan Coonhound">Black and Tan Coonhound</option>
                                                                                    <option value="Black Mouth Cur">Black Mouth Cur</option>
                                                                                    <option value="Black Russian Terrier">Black Russian Terrier</option>
                                                                                    <option value="Bloodhound">Bloodhound</option>
                                                                                    <option value="Blue Lacy">Blue Lacy</option>
                                                                                    <option value="Bluetick Coonhound">Bluetick Coonhound</option>
                                                                                    <option value="Boerboel">Boerboel</option>
                                                                                    <option value="Bolognese">Bolognese</option>
                                                                                    <option value="Border Collie">Border Collie</option>
                                                                                    <option value="Border Terrier">Border Terrier</option>
                                                                                    <option value="Borzoi">Borzoi</option>
                                                                                    <option value="Boston Terrier">Boston Terrier</option>
                                                                                    <option value="Bouvier des Flandres">Bouvier des Flandres</option>
                                                                                    <option value="Boxer">Boxer</option>
                                                                                    <option value="Boykin Spaniel">Boykin Spaniel</option>
                                                                                    <option value="Bracco Italiano">Bracco Italiano</option>
                                                                                    <option value="Briard">Briard</option>
                                                                                    <option value="Brittany">Brittany</option>
                                                                                    <option value="Brussels Griffon">Brussels Griffon</option>
                                                                                    <option value="Bull Terrier">Bull Terrier</option>
                                                                                    <option value="Bulldog">Bulldog</option>
                                                                                    <option value="Bullmastiff">Bullmastiff</option>
                                                                                    <option value="Cairn Terrier">Cairn Terrier</option>
                                                                                    <option value="Canaan Dog">Canaan Dog</option>
                                                                                    <option value="Cane Corso">Cane Corso</option>
                                                                                    <option value="Cardigan Welsh Corgi">Cardigan Welsh Corgi</option>
                                                                                    <option value="Catahoula Leopard Dog">Catahoula Leopard Dog</option>
                                                                                    <option value="Caucasian Shepherd Dog">Caucasian Shepherd Dog</option>
                                                                                    <option value="Cavalier King Charles Spaniel">Cavalier King Charles Spaniel</option>
                                                                                    <option value="Cesky Terrier">Cesky Terrier</option>
                                                                                    <option value="Chesapeake Bay Retriever">Chesapeake Bay Retriever</option>
                                                                                    <option value="Chihuahua">Chihuahua</option>
                                                                                    <option value="Chinese Crested">Chinese Crested</option>
                                                                                    <option value="Chinese Shar-Pei">Chinese Shar-Pei</option>
                                                                                    <option value="Chinook">Chinook</option>
                                                                                    <option value="Chow Chow">Chow Chow</option>
                                                                                    <option value="Clumber Spaniel">Clumber Spaniel</option>
                                                                                    <option value="Cockapoo">Cockapoo</option>
                                                                                    <option value="Cocker Spaniel">Cocker Spaniel</option>
                                                                                    <option value="Collie">Collie</option>
                                                                                    <option value="Coton de Tulear">Coton de Tulear</option>
                                                                                    <option value="Curly-Coated Retriever">Curly-Coated Retriever</option>
                                                                                    <option value="Dachshund">Dachshund</option>
                                                                                    <option value="Dalmatian">Dalmatian</option>
                                                                                    <option value="Dandie Dinmont Terrier">Dandie Dinmont Terrier</option>
                                                                                    <option value="Doberman Pinscher">Doberman Pinscher</option>
                                                                                    <option value="Dogo Argentino">Dogo Argentino</option>
                                                                                    <option value="Dogue de Bordeaux">Dogue de Bordeaux</option>
                                                                                    <option value="Dutch Shepherd">Dutch Shepherd</option>
                                                                                    <option value="English Cocker Spaniel">English Cocker Spaniel</option>
                                                                                    <option value="English Foxhound">English Foxhound</option>
                                                                                    <option value="English Setter">English Setter</option>
                                                                                    <option value="English Springer Spaniel">English Springer Spaniel</option>
                                                                                    <option value="English Toy Spaniel">English Toy Spaniel</option>
                                                                                    <option value="Entlebucher Mountain Dog">Entlebucher Mountain Dog</option>
                                                                                    <option value="Field Spaniel">Field Spaniel</option>
                                                                                    <option value="Finnish Lapphund">Finnish Lapphund</option>
                                                                                    <option value="Finnish Spitz">Finnish Spitz</option>
                                                                                    <option value="Flat-Coated Retriever">Flat-Coated Retriever</option>
                                                                                    <option value="Fox Terrier">Fox Terrier</option>
                                                                                    <option value="French Bulldog">French Bulldog</option>
                                                                                    <option value="German Pinscher">German Pinscher</option>
                                                                                    <option value="German Shepherd Dog">German Shepherd Dog</option>
                                                                                    <option value="German Shorthaired Pointer">German Shorthaired Pointer</option>
                                                                                    <option value="German Wirehaired Pointer">German Wirehaired Pointer</option>
                                                                                    <option value="Giant Schnauzer">Giant Schnauzer</option>
                                                                                    <option value="Glen of Imaal Terrier">Glen of Imaal Terrier</option>
                                                                                    <option value="Goldador">Goldador</option>
                                                                                    <option value="Golden Retriever">Golden Retriever</option>
                                                                                    <option value="Goldendoodle">Goldendoodle</option>
                                                                                    <option value="Gordon Setter">Gordon Setter</option>
                                                                                    <option value="Great Dane">Great Dane</option>
                                                                                    <option value="Great Pyrenees">Great Pyrenees</option>
                                                                                    <option value="Greater Swiss Mountain Dog">Greater Swiss Mountain Dog</option>
                                                                                    <option value="Greyhound">Greyhound</option>
                                                                                    <option value="Harrier">Harrier</option>
                                                                                    <option value="Havanese">Havanese</option>
                                                                                    <option value="Ibizan Hound">Ibizan Hound</option>
                                                                                    <option value="Icelandic Sheepdog">Icelandic Sheepdog</option>
                                                                                    <option value="Irish Red and White Setter">Irish Red and White Setter</option>
                                                                                    <option value="Irish Setter">Irish Setter</option>
                                                                                    <option value="Irish Terrier">Irish Terrier</option>
                                                                                    <option value="Irish Water Spaniel">Irish Water Spaniel</option>
                                                                                    <option value="Irish Wolfhound">Irish Wolfhound</option>
                                                                                    <option value="Italian Greyhound">Italian Greyhound</option>
                                                                                    <option value="Jack Russell Terrier">Jack Russell Terrier</option>
                                                                                    <option value="Japanese Chin">Japanese Chin</option>
                                                                                    <option value="Japanese Spitz">Japanese Spitz</option>
                                                                                    <option value="Karelian Bear Dog">Karelian Bear Dog</option>
                                                                                    <option value="Keeshond">Keeshond</option>
                                                                                    <option value="Kerry Blue Terrier">Kerry Blue Terrier</option>
                                                                                    <option value="Komondor">Komondor</option>
                                                                                    <option value="Kooikerhondje">Kooikerhondje</option>
                                                                                    <option value="Korean Jindo Dog">Korean Jindo Dog</option>
                                                                                    <option value="Kuvasz">Kuvasz</option>
                                                                                    <option value="Labradoodle">Labradoodle</option>
                                                                                    <option value="Labrador Retriever">Labrador Retriever</option>
                                                                                    <option value="Lagotto Romagnolo">Lagotto Romagnolo</option>
                                                                                    <option value="Lakeland Terrier">Lakeland Terrier</option>
                                                                                    <option value="Lancashire Heeler">Lancashire Heeler</option>
                                                                                    <option value="Leonberger">Leonberger</option>
                                                                                    <option value="Lhasa Apso">Lhasa Apso</option>
                                                                                    <option value="Lowchen">Lowchen</option>
                                                                                    <option value="Maltese">Maltese</option>
                                                                                    <option value="Maltese Shih Tzu">Maltese Shih Tzu</option>
                                                                                    <option value="Maltipoo">Maltipoo</option>
                                                                                    <option value="Manchester Terrier">Manchester Terrier</option>
                                                                                    <option value="Mastiff">Mastiff</option>
                                                                                    <option value="Miniature Pinscher">Miniature Pinscher</option>
                                                                                    <option value="Miniature Schnauzer">Miniature Schnauzer</option>
                                                                                    <option value="Mudi">Mudi</option>
                                                                                    <option value="Mutt">Mutt</option>
                                                                                    <option value="Neapolitan Mastiff">Neapolitan Mastiff</option>
                                                                                    <option value="Newfoundland">Newfoundland</option>
                                                                                    <option value="Norfolk Terrier">Norfolk Terrier</option>
                                                                                    <option value="Norwegian Buhund">Norwegian Buhund</option>
                                                                                    <option value="Norwegian Elkhound">Norwegian Elkhound</option>
                                                                                    <option value="Norwegian Lundehund">Norwegian Lundehund</option>
                                                                                    <option value="Norwich Terrier">Norwich Terrier</option>
                                                                                    <option value="Nova Scotia Duck Tolling Retriever">Nova Scotia Duck Tolling Retriever</option>
                                                                                    <option value="Old English Sheepdog">Old English Sheepdog</option>
                                                                                    <option value="Otterhound">Otterhound</option>
                                                                                    <option value="Papillon">Papillon</option>
                                                                                    <option value="Peekapoo">Peekapoo</option>
                                                                                    <option value="Pekingese">Pekingese</option>
                                                                                    <option value="Pembroke Welsh Corgi">Pembroke Welsh Corgi</option>
                                                                                    <option value="Petit Basset Griffon Vendeen">Petit Basset Griffon Vendeen</option>
                                                                                    <option value="Pharaoh Hound">Pharaoh Hound</option>
                                                                                    <option value="Plott">Plott</option>
                                                                                    <option value="Pocket Beagle">Pocket Beagle</option>
                                                                                    <option value="Pointer">Pointer</option>
                                                                                    <option value="Polish Lowland Sheepdog">Polish Lowland Sheepdog</option>
                                                                                    <option value="Pomeranian">Pomeranian</option>
                                                                                    <option value="Pomsky">Pomsky</option>
                                                                                    <option value="Poodle">Poodle</option>
                                                                                    <option value="Portuguese Water Dog">Portuguese Water Dog</option>
                                                                                    <option value="Pug">Pug</option>
                                                                                    <option value="Puggle">Puggle</option>
                                                                                    <option value="Puli">Puli</option>
                                                                                    <option value="Pyrenean Shepherd">Pyrenean Shepherd</option>
                                                                                    <option value="Rat Terrier">Rat Terrier</option>
                                                                                    <option value="Redbone Coonhound">Redbone Coonhound</option>
                                                                                    <option value="Rhodesian Ridgeback">Rhodesian Ridgeback</option>
                                                                                    <option value="Rottweiler">Rottweiler</option>
                                                                                    <option value="Saint Bernard">Saint Bernard</option>
                                                                                    <option value="Saluki">Saluki</option>
                                                                                    <option value="Samoyed">Samoyed</option>
                                                                                    <option value="Schipperke">Schipperke</option>
                                                                                    <option value="Schnoodle">Schnoodle</option>
                                                                                    <option value="Scottish Deerhound">Scottish Deerhound</option>
                                                                                    <option value="Scottish Terrier">Scottish Terrier</option>
                                                                                    <option value="Sealyham Terrier">Sealyham Terrier</option>
                                                                                    <option value="Shetland Sheepdog">Shetland Sheepdog</option>
                                                                                    <option value="Shiba Inu">Shiba Inu</option>
                                                                                    <option value="Shih Tzu">Shih Tzu</option>
                                                                                    <option value="Siberian Husky">Siberian Husky</option>
                                                                                    <option value="Silken Windhound">Silken Windhound</option>
                                                                                    <option value="Silky Terrier">Silky Terrier</option>
                                                                                    <option value="Skye Terrier">Skye Terrier</option>
                                                                                    <option value="Sloughi">Sloughi</option>
                                                                                    <option value="Small Munsterlander Pointer">Small Munsterlander Pointer</option>
                                                                                    <option value="Soft Coated Wheaten Terrier">Soft Coated Wheaten Terrier</option>
                                                                                    <option value="Stabyhoun">Stabyhoun</option>
                                                                                    <option value="Staffordshire Bull Terrier">Staffordshire Bull Terrier</option>
                                                                                    <option value="Standard Schnauzer">Standard Schnauzer</option>
                                                                                    <option value="Sussex Spaniel">Sussex Spaniel</option>
                                                                                    <option value="Swedish Vallhund">Swedish Vallhund</option>
                                                                                    <option value="Tibetan Mastiff">Tibetan Mastiff</option>
                                                                                    <option value="Tibetan Spaniel">Tibetan Spaniel</option>
                                                                                    <option value="Tibetan Terrier">Tibetan Terrier</option>
                                                                                    <option value="Toy Fox Terrier">Toy Fox Terrier</option>
                                                                                    <option value="Treeing Tennessee Brindle">Treeing Tennessee Brindle</option>
                                                                                    <option value="Treeing Walker Coonhound">Treeing Walker Coonhound</option>
                                                                                    <option value="Vizsla">Vizsla</option>
                                                                                    <option value="Weimaraner">Weimaraner</option>
                                                                                    <option value="Welsh Springer Spaniel">Welsh Springer Spaniel</option>
                                                                                    <option value="Welsh Terrier">Welsh Terrier</option>
                                                                                    <option value="West Highland White Terrier">West Highland White Terrier</option>
                                                                                    <option value="Whippet">Whippet</option>
                                                                                    <option value="Wirehaired Pointing Griffon">Wirehaired Pointing Griffon</option>
                                                                                    <option value="Xoloitzcuintli">Xoloitzcuintli</option>
                                                                                    <option value="Yorkipoo">Yorkipoo</option>
                                                                                    <option value="Yorkshire Terrier">Yorkshire Terrier</option>


                                                                                </select>
                                                                            </div>


                                                                        </div>


                                                                        <div class="item form-group">
                                                                            <label class="control-label col-md-3 col-sm-3 col-xs-12"  for="age">Age *</label>
                                                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                                                <input type="number" id="age" name="age" required="required" class="form-control col-md-7 col-xs-12">
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label class="control-label col-md-4 col-sm-3 col-xs-12" for="friendly">Gender *</label>
                                                                            <div id="" class="btn-group" data-toggle="buttons" >
                                                                                <label class="btn btn-default" data-toggle-class="btn-primary" id="genderMale" onClick="whichGender('Male')" data-toggle-passive-class="btn-default">
                                                                                    <input type="radio" name="gender"  value="Yes" > &nbsp;Male&nbsp;
                                                                                </label>
                                                                                <label class="btn btn-default" data-toggle-class="btn-primary"  id="genderFemale"  onClick="whichGender('Female')" data-toggle-passive-class="btn-default">
                                                                                    <input type="radio" name="gender" value="No" >Female
                                                                                </label>
                                                                            </div>
                                                                        </div>

                                                                        <div class="form-group">
                                                                            <label class="control-label col-md-4 col-sm-3 col-xs-12" for="last-name">Vaccination *</label>
                                                                            <div id="" class="btn-group" data-toggle="buttons">
                                                                                <label class="btn btn-default" data-toggle-class="btn-primary" id="vaccinationYes" onClick="isVaccinated('Yes')" data-toggle-passive-class="btn-default">
                                                                                    <input type="radio" name="gender" value="Yes" > Yes
                                                                                </label>
                                                                                <label class="btn btn-default" data-toggle-class="btn-primary" id="vaccinationNo" onClick="isVaccinated('No')" data-toggle-passive-class="btn-default">
                                                                                    <input type="radio" name="gender" value="No" >  &nbsp;No&nbsp;
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-xs-0 col-sm-2 col-md-2"></div>

                                                                </div>
                                                                <br>
                                                                <div class="col-md-12 col-sm-12 col-xm-12">
                                                                    <div class="form-group">
                                                                        <label class="control-label col-md-4 col-sm-3 col-xs-12" for="last-name" style="margin-top:9px">Size *</label>
                                                                        <div id="" class="btn-group" data-toggle="buttons">

                                                                            <label id="size0-10kg" onClick="whichSize('0-10kg')" style="margin-top:9px" class="btn btn-default" data-toggle-class="btn-primary"  data-toggle-passive-class="btn-default">
                                                                                <input type="radio" name="gender" style="font-size: 55px" value="Yes" > 0 - 10kg</label>

                                                                            <label id="size10-20kg" onClick="whichSize('10-20kg')"  style="margin-top:9px" class="btn btn-default" data-toggle-class="btn-primary"   data-toggle-passive-class="btn-default">
                                                                                <input type="radio" name="gender" value="No" >  10 - 20kg</label>

                                                                            <label id="size20-30kg" onClick="whichSize('20-30kg')" style="margin-top:9px" class="btn btn-default" data-toggle-class="btn-primary"   data-toggle-passive-class="btn-default">
                                                                                <input type="radio" name="gender" value="No" >  20-30kg</label>

                                                                            <label id="size40kg" onClick="whichSize('40kg+')" style="margin-top:9px" class="btn btn-default" data-toggle-class="btn-primary"   data-toggle-passive-class="btn-default">
                                                                                <input type="radio" name="gender" value="No" >  40kg+</label>

                                                                        </div>
                                                                    </div>
                                                                    <br>
                                                                    <div class="x_panel">
                                                                        <div class="x_title">
                                                                            <h2>Additional Informations</h2>
                                                                            <ul class="nav navbar-right panel_toolbox">
                                                                                <li class="dropdown">
                                                                                    <a href="#" class="" data-toggle="dropdown" role="button" aria-expanded="false"><i class=""></i></a>
                                                                                </li>
                                                                                <li><a class=""><i class=""></i></a>
                                                                                </li>
                                                                                <li><a class="collapse-link"><i class="fa fa-chevron-down"></i></a>
                                                                                </li>
                                                                            </ul>
                                                                            <div class="clearfix"></div>
                                                                        </div>
                                                                        <div class="x_content" style="display:none">
                                                                            <div class="col-md-12" style=" margin-top:15px;">
                                                                                <div class="col-md-1 col-sm-1 col-xs-0"></div>
                                                                                <div class="col-md-9 col-sm-9 col-xs-12">


                                                                                    <div class="form-group" style="margin-top:15px;">
                                                                                        <label class="control-label col-md-3 col-sm-6 col-xs-12"  for="microchipNo">Microchip No</label>
                                                                                        <div id="" class="btn-group col-md-9 col-sm-6 col-xs-12" data-toggle="buttons">
                                                                                            <input type="text" id="microchipNo" name="microchipNo" required="required" class="form-control">
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="form-group" style="margin-top:15px;">
                                                                                        <label class="control-label col-md-3 col-sm-6 col-xs-12" for="allergies">Allergies</label>
                                                                                        <div id="" class="btn-group col-md-9 col-sm-6 col-xs-12" data-toggle="buttons">
                                                                                            <input  type="text" id="allergies" name="allergies" required="required" class="form-control">
                                                                                        </div>
                                                                                    </div>

                                                                                    <div class="form-group" style="margin-top:15px;">
                                                                                        <label class="control-label col-md-3 col-sm-6 col-xs-12"  for="underMedication">Under medication</label>
                                                                                        <div id="" class="btn-group col-md-9 col-sm-6 col-xs-12" data-toggle="buttons">
                                                                                            <input type="text" id="underMedication" name="underMedication" required="required" class="form-control">
                                                                                        </div>
                                                                                    </div>

                                                                                    <div class="form-group" style="margin-top:15px;">
                                                                                        <label class="control-label col-md-3 col-sm-6 col-xs-12"  for="eatingRoutine">Eating routine</label>
                                                                                        <div id="" class="btn-group col-md-9 col-sm-6 col-xs-12" data-toggle="buttons">
                                                                                            <input type="text" id="eatingRoutine" name="eatingRoutine" required="required" class="form-control">
                                                                                        </div>
                                                                                    </div>

                                                                                    <div class="form-group" style="margin-top:15px;">
                                                                                        <label class="control-label col-md-3 col-sm-6 col-xs-12"  for="sleepingPlace">Sleeping place</label>
                                                                                        <div id="" class="btn-group col-md-9 col-sm-6 col-xs-12" data-toggle="buttons">
                                                                                            <input type="text" id="sleepingPlace" name="sleepingPlace" required="required" class="form-control">
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="form-group">
                                                                                        <label class="control-label col-md-6 col-sm-3 col-xs-12" for="last-name">Neutered sterilized</label>
                                                                                        <div id="" class="btn-group" data-toggle="buttons">
                                                                                            <label class="btn btn-default" data-toggle-class="btn-primary" id="neuteredStreilizedYes" onClick="isNeutered('Yes')" data-toggle-passive-class="btn-default">
                                                                                                <input type="radio" name="gender" value="Yes" > Yes
                                                                                            </label>
                                                                                            <label class="btn btn-default" data-toggle-class="btn-primary" id="neuteredStreilizedNo" onClick="isNeutered('No')" data-toggle-passive-class="btn-default">
                                                                                                <input type="radio" name="gender" value="No" >  &nbsp;No&nbsp;
                                                                                            </label>
                                                                                        </div>
                                                                                    </div>

                                                                                    <div class="form-group">
                                                                                        <label class="control-label col-md-6 col-sm-3 col-xs-12" for="friendly">Friendly</label>
                                                                                        <div id="" class="btn-group" data-toggle="buttons">
                                                                                            <label class="btn btn-default" data-toggle-class="btn-primary" id="friendlyYes"  onClick="isFriendly('Yes')" data-toggle-passive-class="btn-default">
                                                                                                <input type="radio" name="gender" value="Yes" > Yes
                                                                                            </label>
                                                                                            <label class="btn btn-default" data-toggle-class="btn-primary" id="friendlyNo" onClick="isFriendly('No')" data-toggle-passive-class="btn-default">
                                                                                                <input type="radio" name="gender" value="No" >  &nbsp;No&nbsp;
                                                                                            </label>
                                                                                        </div>
                                                                                    </div>

                                                                                    <div class="form-group">
                                                                                        <label class="control-label col-md-6 col-sm-3 col-xs-12" for="last-name">Get along children</label>
                                                                                        <div id="" class="btn-group" data-toggle="buttons">
                                                                                            <label class="btn btn-default" data-toggle-class="btn-primary" id="getAlongChildrenYes" onClick="isGetAlongChild('Yes')" data-toggle-passive-class="btn-default">
                                                                                                <input type="radio" name="gender" value="Yes" > Yes
                                                                                            </label>
                                                                                            <label class="btn btn-default" data-toggle-class="btn-primary" id="getAlongChildrenNo"  onClick="isGetAlongChild('No')" data-toggle-passive-class="btn-default">
                                                                                                <input type="radio" name="gender" value="No" >  &nbsp;No&nbsp;
                                                                                            </label>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="col-md-1  col-sm-1 col-xs-0"></div>

                                                                            </div>
                                                                        </div>
                                                                    </div>

                                                                </div>
                                                                <input hidden id="result" name="result" value="">
                                                            </form>


                                                            <br />
                                                            <form id="demo-form2" data-parsley-validate class="form-horizontal form-label-left">

                                                        </div>
                                                        <form id="addPet" action="addPet" method="POST">
                                                            <input hidden id="result" name="result" value="">
                                                        </form>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                            <button  id="addBtn" type="button" onClick="$('#send').trigger('click');" class="btn btn-primary"  >Save</button>

                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                        <div class="modal fade bs-example-modal" id="modalEditPet" tabindex="-1" role="dialog" aria-hidden="true" style="display: none;">
                                            <div id="modalDialogAddPet" class="modal-dialog modal">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span>
                                                        </button>
                                                        <h4 class="modal-title" id="myModalLabel">Edit Pet</h4>
                                                    </div>
                                                    <div class="">
                                                        <div class="x_content">
                                                            <br />

                                                            <form id="updatePet" action="updatePet"  class="form-horizontal form-label-left" novalidate  method="POST">                                              
                                                                <div class="form-group">
                                                                    <div class="col-md-6 col-md-offset-3">
                                                                        <button style="display:none" id="sendUpdate" type="submit" onclick="updatePet()" class="btn btn-success">Submit</button>
                                                                    </div>
                                                                </div>
                                                                <div class="row">

                                                                    <div class="col-md-2 col-xs-0 col-sm-2">
                                                                    </div>
                                                                    <!-- profil photo -->
                                                                    <div style="" class="col-xs-12 col-sm-4 col-md-4">
                                                                        <div class="col-md-0 col-xs-2">

                                                                        </div>
                                                                        <div class="col-md-12 col-xs-8">
                                                                            <img class="img-thumbnail img-circle" id="myImg2" src="static/images/user.png" alt="Avatar" title="Change the avatar">
                                                                            <br>
                                                                            <br>
                                                                            <div class="col text-center">
                                                                                <a  class="buttonPrevious btn btn-success btn-xs" onClick="openPhotoPicker();" ><i style="margin-right: 7px" class="fa fa-upload"></i>Change Photo</a>                                                  

                                                                            </div>


                                                                        </div>
                                                                        <div class="col-md-0  col-xs-2">

                                                                        </div>

                                                                    </div>

                                                                    <div class="col-md-6 col-xs-12 col-sm-6">
                                                                        <div class="item form-group">
                                                                            <label class="control-label col-md-3 col-sm-3 col-xs-12"  for="name">Name *</label>
                                                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                                                <input type="text" id="name1" name="name" value="" required="required" class="form-control col-md-7 col-xs-12">
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label  class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name"><span class="required">Type *</span>
                                                                            </label>
                                                                            <div onchange="showBreed2()" class="col-md-6 col-sm-6 col-xs-12">
                                                                                <select id="type1" class="form-control">

                                                                                    <option>Dog</option>
                                                                                    <option>Cat</option>


                                                                                </select>
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label class="control-label col-md-3 col-sm-3 col-xs-12"  for="breed">Breed *</label>
                                                                            <div style="display:block;" id="breedCatDog2" class="col-md-6 col-sm-6 col-xs-12">
                                                                                <select id="breed1" class="form-control">

                                                                                    <option value="Affenpinscher">Affenpinscher</option>
                                                                                    <option value="Afghan Hound">Afghan Hound</option>
                                                                                    <option value="Airedale Terrier">Airedale Terrier</option>
                                                                                    <option value="Akita">Akita</option>
                                                                                    <option value="Alaskan Klee Kai">Alaskan Klee Kai</option>
                                                                                    <option value="Alaskan Malamute">Alaskan Malamute</option>
                                                                                    <option value="American Bulldog">American Bulldog</option>
                                                                                    <option value="American English Coonhound">American English Coonhound</option>
                                                                                    <option value="American Eskimo Dog">American Eskimo Dog</option>
                                                                                    <option value="American Foxhound">American Foxhound</option>
                                                                                    <option value="American Pit Bull Terrier">American Pit Bull Terrier</option>
                                                                                    <option value="American Staffordshire Terrier">American Staffordshire Terrier</option>
                                                                                    <option value="American Water Spaniel">American Water Spaniel</option>
                                                                                    <option value="Anatolian Shepherd Dog">Anatolian Shepherd Dog</option>
                                                                                    <option value="Appenzeller Sennenhunde">Appenzeller Sennenhunde</option>
                                                                                    <option value="Australian Cattle Dog">Australian Cattle Dog</option>
                                                                                    <option value="Australian Kelpie">Australian Kelpie</option>
                                                                                    <option value="Australian Shepherd">Australian Shepherd</option>
                                                                                    <option value="Australian Terrier">Australian Terrier</option>
                                                                                    <option value="Azawakh">Azawakh</option>
                                                                                    <option value="Barbet">Barbet</option>
                                                                                    <option value="Basenji">Basenji</option>
                                                                                    <option value="Basset Hound">Basset Hound</option>
                                                                                    <option value="Beagle">Beagle</option>
                                                                                    <option value="Bearded Collie">Bearded Collie</option>
                                                                                    <option value="Bedlington Terrier">Bedlington Terrier</option>
                                                                                    <option value="Belgian Malinois">Belgian Malinois</option>
                                                                                    <option value="Belgian Sheepdog">Belgian Sheepdog</option>
                                                                                    <option value="Belgian Tervuren">Belgian Tervuren</option>
                                                                                    <option value="Berger Picard">Berger Picard</option>
                                                                                    <option value="Bernedoodle">Bernedoodle</option>
                                                                                    <option value="Bernese Mountain Dog">Bernese Mountain Dog</option>
                                                                                    <option value="Bichon Frise">Bichon Frise</option>
                                                                                    <option value="Black and Tan Coonhound">Black and Tan Coonhound</option>
                                                                                    <option value="Black Mouth Cur">Black Mouth Cur</option>
                                                                                    <option value="Black Russian Terrier">Black Russian Terrier</option>
                                                                                    <option value="Bloodhound">Bloodhound</option>
                                                                                    <option value="Blue Lacy">Blue Lacy</option>
                                                                                    <option value="Bluetick Coonhound">Bluetick Coonhound</option>
                                                                                    <option value="Boerboel">Boerboel</option>
                                                                                    <option value="Bolognese">Bolognese</option>
                                                                                    <option value="Border Collie">Border Collie</option>
                                                                                    <option value="Border Terrier">Border Terrier</option>
                                                                                    <option value="Borzoi">Borzoi</option>
                                                                                    <option value="Boston Terrier">Boston Terrier</option>
                                                                                    <option value="Bouvier des Flandres">Bouvier des Flandres</option>
                                                                                    <option value="Boxer">Boxer</option>
                                                                                    <option value="Boykin Spaniel">Boykin Spaniel</option>
                                                                                    <option value="Bracco Italiano">Bracco Italiano</option>
                                                                                    <option value="Briard">Briard</option>
                                                                                    <option value="Brittany">Brittany</option>
                                                                                    <option value="Brussels Griffon">Brussels Griffon</option>
                                                                                    <option value="Bull Terrier">Bull Terrier</option>
                                                                                    <option value="Bulldog">Bulldog</option>
                                                                                    <option value="Bullmastiff">Bullmastiff</option>
                                                                                    <option value="Cairn Terrier">Cairn Terrier</option>
                                                                                    <option value="Canaan Dog">Canaan Dog</option>
                                                                                    <option value="Cane Corso">Cane Corso</option>
                                                                                    <option value="Cardigan Welsh Corgi">Cardigan Welsh Corgi</option>
                                                                                    <option value="Catahoula Leopard Dog">Catahoula Leopard Dog</option>
                                                                                    <option value="Caucasian Shepherd Dog">Caucasian Shepherd Dog</option>
                                                                                    <option value="Cavalier King Charles Spaniel">Cavalier King Charles Spaniel</option>
                                                                                    <option value="Cesky Terrier">Cesky Terrier</option>
                                                                                    <option value="Chesapeake Bay Retriever">Chesapeake Bay Retriever</option>
                                                                                    <option value="Chihuahua">Chihuahua</option>
                                                                                    <option value="Chinese Crested">Chinese Crested</option>
                                                                                    <option value="Chinese Shar-Pei">Chinese Shar-Pei</option>
                                                                                    <option value="Chinook">Chinook</option>
                                                                                    <option value="Chow Chow">Chow Chow</option>
                                                                                    <option value="Clumber Spaniel">Clumber Spaniel</option>
                                                                                    <option value="Cockapoo">Cockapoo</option>
                                                                                    <option value="Cocker Spaniel">Cocker Spaniel</option>
                                                                                    <option value="Collie">Collie</option>
                                                                                    <option value="Coton de Tulear">Coton de Tulear</option>
                                                                                    <option value="Curly-Coated Retriever">Curly-Coated Retriever</option>
                                                                                    <option value="Dachshund">Dachshund</option>
                                                                                    <option value="Dalmatian">Dalmatian</option>
                                                                                    <option value="Dandie Dinmont Terrier">Dandie Dinmont Terrier</option>
                                                                                    <option value="Doberman Pinscher">Doberman Pinscher</option>
                                                                                    <option value="Dogo Argentino">Dogo Argentino</option>
                                                                                    <option value="Dogue de Bordeaux">Dogue de Bordeaux</option>
                                                                                    <option value="Dutch Shepherd">Dutch Shepherd</option>
                                                                                    <option value="English Cocker Spaniel">English Cocker Spaniel</option>
                                                                                    <option value="English Foxhound">English Foxhound</option>
                                                                                    <option value="English Setter">English Setter</option>
                                                                                    <option value="English Springer Spaniel">English Springer Spaniel</option>
                                                                                    <option value="English Toy Spaniel">English Toy Spaniel</option>
                                                                                    <option value="Entlebucher Mountain Dog">Entlebucher Mountain Dog</option>
                                                                                    <option value="Field Spaniel">Field Spaniel</option>
                                                                                    <option value="Finnish Lapphund">Finnish Lapphund</option>
                                                                                    <option value="Finnish Spitz">Finnish Spitz</option>
                                                                                    <option value="Flat-Coated Retriever">Flat-Coated Retriever</option>
                                                                                    <option value="Fox Terrier">Fox Terrier</option>
                                                                                    <option value="French Bulldog">French Bulldog</option>
                                                                                    <option value="German Pinscher">German Pinscher</option>
                                                                                    <option value="German Shepherd Dog">German Shepherd Dog</option>
                                                                                    <option value="German Shorthaired Pointer">German Shorthaired Pointer</option>
                                                                                    <option value="German Wirehaired Pointer">German Wirehaired Pointer</option>
                                                                                    <option value="Giant Schnauzer">Giant Schnauzer</option>
                                                                                    <option value="Glen of Imaal Terrier">Glen of Imaal Terrier</option>
                                                                                    <option value="Goldador">Goldador</option>
                                                                                    <option value="Golden Retriever">Golden Retriever</option>
                                                                                    <option value="Goldendoodle">Goldendoodle</option>
                                                                                    <option value="Gordon Setter">Gordon Setter</option>
                                                                                    <option value="Great Dane">Great Dane</option>
                                                                                    <option value="Great Pyrenees">Great Pyrenees</option>
                                                                                    <option value="Greater Swiss Mountain Dog">Greater Swiss Mountain Dog</option>
                                                                                    <option value="Greyhound">Greyhound</option>
                                                                                    <option value="Harrier">Harrier</option>
                                                                                    <option value="Havanese">Havanese</option>
                                                                                    <option value="Ibizan Hound">Ibizan Hound</option>
                                                                                    <option value="Icelandic Sheepdog">Icelandic Sheepdog</option>
                                                                                    <option value="Irish Red and White Setter">Irish Red and White Setter</option>
                                                                                    <option value="Irish Setter">Irish Setter</option>
                                                                                    <option value="Irish Terrier">Irish Terrier</option>
                                                                                    <option value="Irish Water Spaniel">Irish Water Spaniel</option>
                                                                                    <option value="Irish Wolfhound">Irish Wolfhound</option>
                                                                                    <option value="Italian Greyhound">Italian Greyhound</option>
                                                                                    <option value="Jack Russell Terrier">Jack Russell Terrier</option>
                                                                                    <option value="Japanese Chin">Japanese Chin</option>
                                                                                    <option value="Japanese Spitz">Japanese Spitz</option>
                                                                                    <option value="Karelian Bear Dog">Karelian Bear Dog</option>
                                                                                    <option value="Keeshond">Keeshond</option>
                                                                                    <option value="Kerry Blue Terrier">Kerry Blue Terrier</option>
                                                                                    <option value="Komondor">Komondor</option>
                                                                                    <option value="Kooikerhondje">Kooikerhondje</option>
                                                                                    <option value="Korean Jindo Dog">Korean Jindo Dog</option>
                                                                                    <option value="Kuvasz">Kuvasz</option>
                                                                                    <option value="Labradoodle">Labradoodle</option>
                                                                                    <option value="Labrador Retriever">Labrador Retriever</option>
                                                                                    <option value="Lagotto Romagnolo">Lagotto Romagnolo</option>
                                                                                    <option value="Lakeland Terrier">Lakeland Terrier</option>
                                                                                    <option value="Lancashire Heeler">Lancashire Heeler</option>
                                                                                    <option value="Leonberger">Leonberger</option>
                                                                                    <option value="Lhasa Apso">Lhasa Apso</option>
                                                                                    <option value="Lowchen">Lowchen</option>
                                                                                    <option value="Maltese">Maltese</option>
                                                                                    <option value="Maltese Shih Tzu">Maltese Shih Tzu</option>
                                                                                    <option value="Maltipoo">Maltipoo</option>
                                                                                    <option value="Manchester Terrier">Manchester Terrier</option>
                                                                                    <option value="Mastiff">Mastiff</option>
                                                                                    <option value="Miniature Pinscher">Miniature Pinscher</option>
                                                                                    <option value="Miniature Schnauzer">Miniature Schnauzer</option>
                                                                                    <option value="Mudi">Mudi</option>
                                                                                    <option value="Mutt">Mutt</option>
                                                                                    <option value="Neapolitan Mastiff">Neapolitan Mastiff</option>
                                                                                    <option value="Newfoundland">Newfoundland</option>
                                                                                    <option value="Norfolk Terrier">Norfolk Terrier</option>
                                                                                    <option value="Norwegian Buhund">Norwegian Buhund</option>
                                                                                    <option value="Norwegian Elkhound">Norwegian Elkhound</option>
                                                                                    <option value="Norwegian Lundehund">Norwegian Lundehund</option>
                                                                                    <option value="Norwich Terrier">Norwich Terrier</option>
                                                                                    <option value="Nova Scotia Duck Tolling Retriever">Nova Scotia Duck Tolling Retriever</option>
                                                                                    <option value="Old English Sheepdog">Old English Sheepdog</option>
                                                                                    <option value="Otterhound">Otterhound</option>
                                                                                    <option value="Papillon">Papillon</option>
                                                                                    <option value="Peekapoo">Peekapoo</option>
                                                                                    <option value="Pekingese">Pekingese</option>
                                                                                    <option value="Pembroke Welsh Corgi">Pembroke Welsh Corgi</option>
                                                                                    <option value="Petit Basset Griffon Vendeen">Petit Basset Griffon Vendeen</option>
                                                                                    <option value="Pharaoh Hound">Pharaoh Hound</option>
                                                                                    <option value="Plott">Plott</option>
                                                                                    <option value="Pocket Beagle">Pocket Beagle</option>
                                                                                    <option value="Pointer">Pointer</option>
                                                                                    <option value="Polish Lowland Sheepdog">Polish Lowland Sheepdog</option>
                                                                                    <option value="Pomeranian">Pomeranian</option>
                                                                                    <option value="Pomsky">Pomsky</option>
                                                                                    <option value="Poodle">Poodle</option>
                                                                                    <option value="Portuguese Water Dog">Portuguese Water Dog</option>
                                                                                    <option value="Pug">Pug</option>
                                                                                    <option value="Puggle">Puggle</option>
                                                                                    <option value="Puli">Puli</option>
                                                                                    <option value="Pyrenean Shepherd">Pyrenean Shepherd</option>
                                                                                    <option value="Rat Terrier">Rat Terrier</option>
                                                                                    <option value="Redbone Coonhound">Redbone Coonhound</option>
                                                                                    <option value="Rhodesian Ridgeback">Rhodesian Ridgeback</option>
                                                                                    <option value="Rottweiler">Rottweiler</option>
                                                                                    <option value="Saint Bernard">Saint Bernard</option>
                                                                                    <option value="Saluki">Saluki</option>
                                                                                    <option value="Samoyed">Samoyed</option>
                                                                                    <option value="Schipperke">Schipperke</option>
                                                                                    <option value="Schnoodle">Schnoodle</option>
                                                                                    <option value="Scottish Deerhound">Scottish Deerhound</option>
                                                                                    <option value="Scottish Terrier">Scottish Terrier</option>
                                                                                    <option value="Sealyham Terrier">Sealyham Terrier</option>
                                                                                    <option value="Shetland Sheepdog">Shetland Sheepdog</option>
                                                                                    <option value="Shiba Inu">Shiba Inu</option>
                                                                                    <option value="Shih Tzu">Shih Tzu</option>
                                                                                    <option value="Siberian Husky">Siberian Husky</option>
                                                                                    <option value="Silken Windhound">Silken Windhound</option>
                                                                                    <option value="Silky Terrier">Silky Terrier</option>
                                                                                    <option value="Skye Terrier">Skye Terrier</option>
                                                                                    <option value="Sloughi">Sloughi</option>
                                                                                    <option value="Small Munsterlander Pointer">Small Munsterlander Pointer</option>
                                                                                    <option value="Soft Coated Wheaten Terrier">Soft Coated Wheaten Terrier</option>
                                                                                    <option value="Stabyhoun">Stabyhoun</option>
                                                                                    <option value="Staffordshire Bull Terrier">Staffordshire Bull Terrier</option>
                                                                                    <option value="Standard Schnauzer">Standard Schnauzer</option>
                                                                                    <option value="Sussex Spaniel">Sussex Spaniel</option>
                                                                                    <option value="Swedish Vallhund">Swedish Vallhund</option>
                                                                                    <option value="Tibetan Mastiff">Tibetan Mastiff</option>
                                                                                    <option value="Tibetan Spaniel">Tibetan Spaniel</option>
                                                                                    <option value="Tibetan Terrier">Tibetan Terrier</option>
                                                                                    <option value="Toy Fox Terrier">Toy Fox Terrier</option>
                                                                                    <option value="Treeing Tennessee Brindle">Treeing Tennessee Brindle</option>
                                                                                    <option value="Treeing Walker Coonhound">Treeing Walker Coonhound</option>
                                                                                    <option value="Vizsla">Vizsla</option>
                                                                                    <option value="Weimaraner">Weimaraner</option>
                                                                                    <option value="Welsh Springer Spaniel">Welsh Springer Spaniel</option>
                                                                                    <option value="Welsh Terrier">Welsh Terrier</option>
                                                                                    <option value="West Highland White Terrier">West Highland White Terrier</option>
                                                                                    <option value="Whippet">Whippet</option>
                                                                                    <option value="Wirehaired Pointing Griffon">Wirehaired Pointing Griffon</option>
                                                                                    <option value="Xoloitzcuintli">Xoloitzcuintli</option>
                                                                                    <option value="Yorkipoo">Yorkipoo</option>
                                                                                    <option value="Yorkshire Terrier">Yorkshire Terrier</option>


                                                                                </select>
                                                                            </div>
                                                                        </div>
                                                                        <div class="item form-group">
                                                                            <label class="control-label col-md-3 col-sm-3 col-xs-12"  for="age">Age *</label>
                                                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                                                <input type="number" id="age1" name="age" required="required" class="form-control col-md-7 col-xs-12">
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label class="control-label col-md-4 col-sm-3 col-xs-12" for="friendly">Gender *</label>
                                                                            <div id="" class="btn-group" data-toggle="buttons" >
                                                                                <label class="btn btn-default" data-toggle-class="btn-primary" id="genderMale1" onClick="whichGender('Male')" data-toggle-passive-class="btn-default">
                                                                                    <input type="radio" name="gender"  value="Yes" > &nbsp;Male&nbsp;
                                                                                </label>
                                                                                <label class="btn btn-default" data-toggle-class="btn-primary"  id="genderFemale1"  onClick="whichGender('Female')" data-toggle-passive-class="btn-default">
                                                                                    <input type="radio" name="gender" value="No" >Female
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label class="control-label col-md-4 col-sm-3 col-xs-12" for="last-name">Vaccination *</label>
                                                                            <div id="" class="btn-group" data-toggle="buttons">
                                                                                <label class="btn btn-default" data-toggle-class="btn-primary" id="vaccinationYes1" onClick="isVaccinated('Yes')" data-toggle-passive-class="btn-default">
                                                                                    <input type="radio" name="gender" value="Yes" > Yes
                                                                                </label>
                                                                                <label class="btn btn-default" data-toggle-class="btn-primary" id="vaccinationNo1" onClick="isVaccinated('No')" data-toggle-passive-class="btn-default">
                                                                                    <input type="radio" name="gender" value="No" >  &nbsp;No&nbsp;
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-xs-0 col-sm-2 col-md-2"></div>

                                                                </div>
                                                                <br>
                                                                <div class="col-md-12 col-sm-12 col-xm-12">
                                                                    <div class="form-group">
                                                                        <label class="control-label col-md-4 col-sm-3 col-xs-12" for="last-name" style="margin-top:9px">Size *</label>
                                                                        <div id="" class="btn-group" data-toggle="buttons">

                                                                            <label id="size0-10kg1" onClick="whichSize('0-10kg')" style="margin-top:9px" class="btn btn-default" data-toggle-class="btn-primary"  data-toggle-passive-class="btn-default">
                                                                                <input type="radio" name="gender" style="font-size: 55px" value="Yes" > 0 - 10kg</label>

                                                                            <label id="size10-20kg1" onClick="whichSize('10-20kg')"  style="margin-top:9px" class="btn btn-default" data-toggle-class="btn-primary"   data-toggle-passive-class="btn-default">
                                                                                <input type="radio" name="gender" value="No" >  10 - 20kg</label>

                                                                            <label id="size20-30kg1" onClick="whichSize('20-30kg')" style="margin-top:9px" class="btn btn-default" data-toggle-class="btn-primary"   data-toggle-passive-class="btn-default">
                                                                                <input type="radio" name="gender" value="No" >  20-30kg</label>

                                                                            <label id="size40kg1" onClick="whichSize('40kg+')" style="margin-top:9px" class="btn btn-default" data-toggle-class="btn-primary"   data-toggle-passive-class="btn-default">
                                                                                <input type="radio" name="gender" value="No" >  40kg+</label>

                                                                        </div>
                                                                    </div>
                                                                    <br>
                                                                    <div class="x_panel">
                                                                        <div class="x_title">
                                                                            <h2>Additional Informations</h2>
                                                                            <ul class="nav navbar-right panel_toolbox">
                                                                                <li class="dropdown">
                                                                                    <a href="#" class="" data-toggle="dropdown" role="button" aria-expanded="false"><i class=""></i></a>
                                                                                </li>
                                                                                <li><a class=""><i class=""></i></a>
                                                                                </li>
                                                                                <li><a class="collapse-link"><i class="fa fa-chevron-down"></i></a>
                                                                                </li>
                                                                            </ul>
                                                                            <div class="clearfix"></div>
                                                                        </div>
                                                                        <div class="x_content" style="display:none">
                                                                            <div class="col-md-12" style=" margin-top:15px;">
                                                                                <div class="col-md-1 col-sm-1 col-xs-0"></div>
                                                                                <div class="col-md-9 col-sm-9 col-xs-12">


                                                                                    <div class="form-group" style="margin-top:15px;">
                                                                                        <label class="control-label col-md-3 col-sm-6 col-xs-12"  for="microchipNo">Microchip No</label>
                                                                                        <div id="" class="btn-group col-md-9 col-sm-6 col-xs-12" data-toggle="buttons">
                                                                                            <input type="text" id="microchipNo1" name="microchipNo" required="required" class="form-control">
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="form-group" style="margin-top:15px;">
                                                                                        <label class="control-label col-md-3 col-sm-6 col-xs-12" for="allergies">Allergies</label>
                                                                                        <div id="" class="btn-group col-md-9 col-sm-6 col-xs-12" data-toggle="buttons">
                                                                                            <input  type="text" id="allergies1" name="allergies" required="required" class="form-control">
                                                                                        </div>
                                                                                    </div>

                                                                                    <div class="form-group" style="margin-top:15px;">
                                                                                        <label class="control-label col-md-3 col-sm-6 col-xs-12"  for="underMedication">Under medication</label>
                                                                                        <div id="" class="btn-group col-md-9 col-sm-6 col-xs-12" data-toggle="buttons">
                                                                                            <input type="text" id="underMedication1" name="underMedication" required="required" class="form-control">
                                                                                        </div>
                                                                                    </div>

                                                                                    <div class="form-group" style="margin-top:15px;">
                                                                                        <label class="control-label col-md-3 col-sm-6 col-xs-12"  for="eatingRoutine">Eating routine</label>
                                                                                        <div id="" class="btn-group col-md-9 col-sm-6 col-xs-12" data-toggle="buttons">
                                                                                            <input type="text" id="eatingRoutine1" name="eatingRoutine" required="required" class="form-control">
                                                                                        </div>
                                                                                    </div>

                                                                                    <div class="form-group" style="margin-top:15px;">
                                                                                        <label class="control-label col-md-3 col-sm-6 col-xs-12"  for="sleepingPlace">Sleeping place</label>
                                                                                        <div id="" class="btn-group col-md-9 col-sm-6 col-xs-12" data-toggle="buttons">
                                                                                            <input type="text" id="sleepingPlace1" name="sleepingPlace" required="required" class="form-control">
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="form-group">
                                                                                        <label class="control-label col-md-6 col-sm-3 col-xs-12" for="last-name">Neutered sterilized</label>
                                                                                        <div id="" class="btn-group" data-toggle="buttons">
                                                                                            <label class="btn btn-default" data-toggle-class="btn-primary" id="neuteredStreilizedYes1" onClick="isNeutered('Yes')" data-toggle-passive-class="btn-default">
                                                                                                <input type="radio" name="gender" value="Yes" > Yes
                                                                                            </label>
                                                                                            <label class="btn btn-default" data-toggle-class="btn-primary" id="neuteredStreilizedNo1" onClick="isNeutered('No')" data-toggle-passive-class="btn-default">
                                                                                                <input type="radio" name="gender" value="No" >  &nbsp;No&nbsp;
                                                                                            </label>
                                                                                        </div>
                                                                                    </div>

                                                                                    <div class="form-group">
                                                                                        <label class="control-label col-md-6 col-sm-3 col-xs-12" for="friendly">Friendly</label>
                                                                                        <div id="" class="btn-group" data-toggle="buttons">
                                                                                            <label class="btn btn-default" data-toggle-class="btn-primary" id="friendlyYes1"  onClick="isFriendly('Yes')" data-toggle-passive-class="btn-default">
                                                                                                <input type="radio" name="gender" value="Yes" > Yes
                                                                                            </label>
                                                                                            <label class="btn btn-default" data-toggle-class="btn-primary" id="friendlyNo1" onClick="isFriendly('No')" data-toggle-passive-class="btn-default">
                                                                                                <input type="radio" name="gender" value="No" >  &nbsp;No&nbsp;
                                                                                            </label>
                                                                                        </div>
                                                                                    </div>

                                                                                    <div class="form-group">
                                                                                        <label class="control-label col-md-6 col-sm-3 col-xs-12" for="last-name">Get along children</label>
                                                                                        <div id="" class="btn-group" data-toggle="buttons">
                                                                                            <label class="btn btn-default" data-toggle-class="btn-primary" id="getAlongChildrenYes1" onClick="isGetAlongChild('Yes')" data-toggle-passive-class="btn-default">
                                                                                                <input type="radio" name="gender" value="Yes" > Yes
                                                                                            </label>
                                                                                            <label class="btn btn-default" data-toggle-class="btn-primary" id="getAlongChildrenNo1"  onClick="isGetAlongChild('No')" data-toggle-passive-class="btn-default">
                                                                                                <input type="radio" name="gender" value="No" >  &nbsp;No&nbsp;
                                                                                            </label>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="col-md-1  col-sm-1 col-xs-0"></div>

                                                                            </div>
                                                                        </div>
                                                                    </div>

                                                                </div>
                                                                <input hidden id="resultUpdate" name="resultUpdate" value="">
                                                            </form>
                                                        </div>

                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                            <button  id="addBtn" type="button" onClick="$('#sendUpdate').trigger('click');" class="btn btn-primary"  data-dismiss="" >Save Changes</button>

                                                        </div>
                                                    </div>
                                                </div>
                                            </div>


                                        </div>

                                        <div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-hidden="true" id="modalCropper">
                                            <div class="modal-dialog modal-lg">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" onClick="closeModal()" aria-label="Close"><span aria-hidden="true">×</span>
                                                        </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <div class="container cropper" >
                                                            <div id="imgContainer" class="row">
                                                                <div  class="img-container" >
                                                                    <img id="image" src="" alt="Picture">
                                                                </div>
                                                            </div>
                                                        </div>   
                                                    </div>
                                                    <div class="modal-footer">
                                                        <div class="row" id="imgButtons" style="display:flex;justify-content: flex-end">
                                                            <div class="docs-buttons">
                                                                <div class="btn-group">
                                                                    <button type="button" class="btn btn-primary" data-method="zoom" data-option="0.1" title="Zoom In">
                                                                        <span class="docs-tooltip" data-toggle="tooltip" title="Zoom In">
                                                                            <span class="fa fa-search-plus"></span>
                                                                        </span>
                                                                    </button>
                                                                    <button type="button" class="btn btn-primary" data-method="zoom" data-option="-0.1" title="Zoom Out">
                                                                        <span class="docs-tooltip" data-toggle="tooltip" title="Zoom Out">
                                                                            <span class="fa fa-search-minus"></span>
                                                                        </span>
                                                                    </button>
                                                                </div>
                                                                <div class="btn-group">
                                                                    <button type="button" class="btn btn-primary" data-method="move" data-option="-10" data-second-option="0" title="Move Left">
                                                                        <span class="docs-tooltip" data-toggle="tooltip" title="Move Left">
                                                                            <span class="fa fa-arrow-left"></span>
                                                                        </span>
                                                                    </button>
                                                                    <button type="button" class="btn btn-primary" data-method="move" data-option="10" data-second-option="0" title="Move Right">
                                                                        <span class="docs-tooltip" data-toggle="tooltip" title="Move Right">
                                                                            <span class="fa fa-arrow-right"></span>
                                                                        </span>
                                                                    </button>
                                                                    <button type="button" class="btn btn-primary" data-method="move" data-option="0" data-second-option="-10" title="Move Up">
                                                                        <span class="docs-tooltip" data-toggle="tooltip" title="Move Up">
                                                                            <span class="fa fa-arrow-up"></span>
                                                                        </span>
                                                                    </button>
                                                                    <button type="button" class="btn btn-primary" data-method="move" data-option="0" data-second-option="10" title="Move Down">
                                                                        <span class="docs-tooltip" data-toggle="tooltip" title="Move Down">
                                                                            <span class="fa fa-arrow-down"></span>
                                                                        </span>
                                                                    </button>
                                                                </div>
                                                                <div class="btn-group">
                                                                    <button type="button" class="btn btn-primary" data-method="rotate" data-option="-45" title="Rotate Left">
                                                                        <span class="docs-tooltip" data-toggle="tooltip" title="Rotate Left">
                                                                            <span class="fa fa-rotate-left"></span>
                                                                        </span>
                                                                    </button>
                                                                    <button type="button" class="btn btn-primary" data-method="rotate" data-option="45" title="Rotate Right">
                                                                        <span class="docs-tooltip" data-toggle="tooltip" title="Rotate Right">
                                                                            <span class="fa fa-rotate-right"></span>
                                                                        </span>
                                                                    </button>
                                                                </div>
                                                                <div class="btn-group">
                                                                    <button type="button" class="btn btn-primary" data-method="reset" title="Reset">
                                                                        <span class="docs-tooltip" data-toggle="tooltip" title="Reset">
                                                                            <span class="fa fa-refresh"></span>
                                                                        </span>
                                                                    </button>
                                                                    <label  id="btnUploadClick" class="btn btn-primary btn-upload" for="inputImage" title="Upload image file">
                                                                        <input type="file" class="sr-only" id="inputImage" name="file" accept="image/*">
                                                                        <span class="docs-tooltip" data-toggle="tooltip" title="Upload image file">
                                                                            <span class="fa fa-upload"></span>
                                                                        </span>
                                                                    </label>
                                                                </div>
                                                                <div class="btn-group">
                                                                    <button type="button"  class="btn btn-success" data-method="getCroppedCanvas" >
                                                                        <span  class="docs-tooltip" data-toggle="tooltip" >
                                                                            Crop
                                                                        </span>
                                                                    </button>
                                                                </div>
                                                                <div style="display:none"  class="col-md-3 docs-toggles">
                                                                    <!-- <h3 class="page-header">Toggles:</h3> -->
                                                                    <div class="btn-group btn-group-justified" data-toggle="buttons">

                                                                        <label id="btnSquare" class="btn btn-primary">
                                                                            <input type="radio" class="sr-only" id="aspectRatio2" name="aspectRatio" value="1">
                                                                            <span class="docs-tooltip" data-toggle="tooltip" title="aspectRatio: 1 / 1">
                                                                                1:1
                                                                            </span>
                                                                        </label>
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
                                <div class="clearfix"></div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="x_panel">
                                            <div id="noPet" hidden class="col text-center">
                                                <h2>You have no pet to display <button type="button" data-toggle="modal" onclick="clearImage()" data-target="#modalAddPet" style="margin-left:10px; padding-left: 25px; padding-right: 25px;" class="btn btn-primary"><i class="fa fa-plus-circle" aria-hidden="true"> </i> Add a Pet </button></h2>
                                            </div>


                                            <div class="x_content">
                                                <div id="pets" class="row">
                                                    <div class="clearfix"></div>
                                                    <div id="newPet" >
                                                    </div>
                                                <c:forEach var="p" items="${pets}">
                                                    <div id="pet1-comp" class="col-md-4 col-sm-4 col-xs-12 profile_details">
                                                        <div class="well profile_view">
                                                            <div class="col-sm-12">
                                                                <h4 class="brief"><i>${p.petType}</i></h4>
                                                                <div class="row">
                                                                    <div class="left col-xs-6 col-md-6 col-sm-6 ">
                                                                        <h3 id="pet1-name"><strong>${p.name}</strong></h3>
                                                                        <p id ="pet1-breed"><strong>Breed: </strong>${p.breed} </p>
                                                                        <p id="pet1-size"><strong>Size (Kg) :     </strong>${p.petSize} </p>
                                                                        <p id="pet1-gender"><strong>Gender: </strong>${p.gender} </p>
                                                                        <p id="pet1-age"><strong>Age: </strong>${p.age} years </p>
                                                                        <p id="pet1-vaccination"><strong>Vaccination: </strong>${p.vaccination}</p>
                                                                    </div>
                                                                    <div class="right col-xs-6 col-md-6 col-sm-6 right ">
                                                                        <img src="static/images/dog.jpg" alt="" class="img-circle img-responsive" />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-xs-12 bottom text-center">
                                                                <div class="col-xs-12 col-sm-12 emphasis">
                                                                    <form id="removePet" action="removePet" method="POST">
                                                                        <input hidden id="petId" name="petId" value="${p.id}">
                                                                        <button id="deleteBtn" type="button" data-toggle="modal" data-target="#deleteConfirmModal" class="btn btn-danger btn-xs">
                                                                            <i class="fa fa-minus-circle"> </i> Delete
                                                                        </button>
                                                                    </form>
                                                                    <button id="${p.id}" onclick="editPet(this.id)"  type="button" class="btn btn-warning btn-xs">
                                                                        <i class="fa fa-edit"> </i> Edit Pet
                                                                    </button>
                                                                    <button type="button" class="btn btn-success btn-xs">
                                                                        <i class="fa fa-search"> </i> Find a Pet Hotel
                                                                    </button>
                                                                </div>
                                                            </div>
                                                            <div id="deleteConfirmModal" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-hidden="true">
                                                                <div id="deleteConfirmDialog"  class="modal-dialog modal-lg">
                                                                    <div class="modal-content">

                                                                        <div class="modal-header">
                                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span>
                                                                            </button>
                                                                            <h4 class="modal-title" id="myModalLabel2">Delete the Pet</h4>
                                                                        </div>
                                                                        <div class="modal-body">
                                                                            <br />
                                                                            <form id="demo-form2" data-parsley-validate class="form-horizontal form-label-left">
                                                                                <div class="row" >
                                                                                    <div style="" >
                                                                                        <div class="col-md-5 col-xs-12 col-sm-12" >
                                                                                            <span style="margin-top:15%;padding-left: 40%;font-size: 90px;text-align: center" class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
                                                                                        </div>
                                                                                        <div class="col-md-6 col-xs-12 col-sm-12" style="margin-top:25px">
                                                                                            <h1 ><strong>Are you sure?</strong></h1>
                                                                                            <h3>You're about to delete your pet!</h3>
                                                                                        </div>
                                                                                    </div>

                                                                                </div>
                                                                            </form>
                                                                        </div>
                                                                        <div class="modal-footer">
                                                                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                                            <button type="button" class="btn btn-primary" onclick="changeButtonType()">Delete</button>
                                                                        </div>

                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <!-- /modals -->
                                                        </div>
                                                    </div>
                                                </c:forEach>

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
        <!-- Cropper -->
        <script src="static/vendors/cropper/dist/cropper.min.js" type="text/javascript"></script>
        <script src="https://kit.fontawesome.com/3135afb4f3.js"></script>
        <script src="static/vendors/validator/validator.js"></script>
    </body>
</html>
