
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Doctor List</title>
        <link  rel="stylesheet" type="text/css" href="css/doctorlistcss.css"> 
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


        <%@page import="java.sql.*, java.util.*" %>
        <h2>Doctor List</h2>
        <%
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hms?allowPublicKeyRetrival=true&useSSL=false", "root", "root@v");
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("select * from doctor");

        %>
        <table border=1>
            <%  while (rs.next()) {
                    String userid = rs.getString("userid");
                    String firstname = rs.getString("firstname");
                    String lastname = rs.getString("lastname");
                    String email = rs.getString("email");
                    String contactnumber = rs.getString("contactnumber");
                    String  gender= rs.getString("gender");
                    String  address= rs.getString("address");
                    String  specialization= rs.getString("specialization");
                    String  dojoin= rs.getString("dojoin");
                    String dob = rs.getString("dob");
                    String bloodgrp = rs.getString("bloodgrp");
                    
            %>
            <tr>
                <td><%out.println(userid);%></td>
                <td><%out.println(firstname);%></td>
                <td><%out.println(lastname);%></td>
                <td><%out.println(email);%></td>
                <td><%out.println(contactnumber);%></td>
                <td><%out.println(gender);%></td>
                <td><%out.println(address);%></td>
                <td><%out.println(specialization);%></td>
                <td><%out.println(dojoin);%></td>
                <td><%out.println(dob);%></td>
                <td><%out.println(bloodgrp);%></td>               
            </tr>
            <%}%>

        </table>
        <%

            } catch (Exception e) {
                out.println(e);
            }


        %>


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
