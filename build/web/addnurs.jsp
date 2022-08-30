<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <%@page import="java.sql.*" %>
        <%
            String firstname = request.getParameter("firstname");
            String lastname = request.getParameter("lastname");
            String userid = request.getParameter("userid");
            String bloodgrp = request.getParameter("bloodgrp");
            String email = request.getParameter("email");
            String contactnumber = request.getParameter("contactnumber");
            String dob = request.getParameter("dob");
            String gender = request.getParameter("gender");
            String dojoin = request.getParameter("dojoin");
            String address = request.getParameter("address");

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hms?allowPublicKeyRetrival=true&useSSL=false", "root", "root@v");

                PreparedStatement ps = con.prepareStatement("insert into nurse(userid,firstname,lastname,email,contactnumber,gender,address,dojoin,dob,bloodgrp) values(?,?,?,?,?,?,?,?,?,?)");
                ps.setString(1, userid);
                ps.setString(2, firstname);
                ps.setString(3, lastname);
                ps.setString(4, email);
                ps.setString(5, contactnumber);
                ps.setString(6, gender);
                ps.setString(7, address);
                ps.setString(8, dojoin);
                ps.setString(9, dob);
                ps.setString(10, bloodgrp);

                int x = ps.executeUpdate();
                if (x > 0) {
                    out.println("A new entry was successfully made!");
                } else {
                    out.println("A new entry could not be made!");
                }

            } catch (Exception e) {
                out.println(e);
            }
        %>
    </body>
</html>
