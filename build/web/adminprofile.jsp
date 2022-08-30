
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <title>Admin</title>
        <meta charset="UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link  rel="stylesheet" type="text/css" href="css/adminprofilecss.css"> 
    </head>
    <body>
        <nav>
            <div class="logo">
                Be-Well
            </div>
            <ul class="menu-icons">    
                <li> <a href="home.html" target="_self" >Home</a></li> 
                <li> 
                    <div class="menu">
                        <a href="#" >Doctor</a>
                        <div class="ddmenu">
                            <a href="adddoctor.html" > Add Doctor </a>
                            <a href="doclist.jsp" > Doctor List </a>              
                        </div>
                    </div>
                </li>              
                <li> 
                    <div class="menu">
                        <a href="#" >Nurse</a>
                        <div class="ddmenu">
                            <a href="addnurse.html" > Add Nurse </a>
                            <a href="nurselist.jsp" > Nurse List </a>              
                        </div>
                    </div>
                </li>
                <li> 
                    <div class="menu">
                        <a href="#" >Patient</a>
                        <div class="ddmenu">
                            <a href="addpatient.html" > Add Patient </a>
                            <a href="patientlist.jsp" > Patient List </a>              
                        </div>
                    </div>
                </li>      
                <li> <a href="bookappt.html" target="_blank">Book Appointment</a></li>   
                <li> <a href="feedback.html" target="_blank">Contact Us</a></li>                                   
            </ul>
        </nav>
        
        
        <h2>Profile</h2>
        <div class="content">            
            <div class="row">
                <div class="cols">Full Name </div>
                <div class="cols">:</div>
                <div class="cols">RS</div>
            </div>
            <div class="row">
                <div class="cols">Email</div>
                <div class="cols">:</div>
                <div class="cols">riya123@gmail.com</div>
            </div>
            
            <div class="row">
                <div class="cols">Contact Number</div>
                <div class="cols">:</div>
                <div class="cols">1234567891</div>
            </div>
            <div class="row">
                <div class="cols">User Type</div>
                <div class="cols">:</div>
                <div class="cols">Doctor</div>
            </div>
            <div class="row">
                <div class="cols">Gender</div>
                <div class="cols">:</div>
                <div class="cols">Female</div>
            </div>
            <div class="row">
                <div class="cols">Address</div>
                <div class="cols">:</div>
                <div class="cols">123 ABCMNO XYZ</div>
            </div>
            <div class="row">
                <div class="cols">Blood Type</div>
                <div class="cols">:</div>
                <div class="cols">O+</div>
            </div>
        </div>
        
        <footer>
        <ul class="social-icons">
            <li><a href="#"><ion-icon name="logo-facebook"></ion-icon></a></li>
            <li><a href="#"><ion-icon name="logo-instagram"></ion-icon></a></li>
            <li><a href="#"><ion-icon name="logo-linkedin"></ion-icon></a></li>
            <li><a href="#"><ion-icon name="logo-twitter"></ion-icon></a></li>
        </ul>
        <ul class="menu">
            <li><a href="#">Home |</a></li>
            <li><a href="#">About |</a></li>
            <li><a href="#">Contact Us</a></li>
        </ul>
        <p>@2022 Be-Well Management system | All Rights Reserved</p>
    </footer>
    <!-- footer section ends  -->
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    <script>
        var slideImg = document.getElementById("slideImg");
        var images = new Array(
                "images/slider/1.jpg",
                "images/slider/5.jpg"
                );
        var len = images.length;
        var i = 0;
        function slider() {
            if (i > len - 1) {
                i = 0;
            }
            slideImg.src = images[i];
            i++;
            setTimeout('slider()', 3000);
        }


    </script>
    </body>
</html>

