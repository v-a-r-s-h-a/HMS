<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@page import="java.sql.*" %>
        <%
            String firstname = request.getParameter("firstname");
            String lastname = request.getParameter("lastname");
            String email = request.getParameter("email");
            String contactnumber = request.getParameter("contactnumber");
            String gender = request.getParameter("gender");
            String address = request.getParameter("address");            
            String userid = "";
            String bloodgrp = request.getParameter("bloodgrp");
            String dob = request.getParameter("dob");

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hms?allowPublicKeyRetrival=true&useSSL=false", "root", "root@v");
                
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("SELECT id FROM signup ORDER BY id DESC LIMIT 1");
                while (rs.next()) {
                    String uid = rs.getString("id");
                    int i = Integer.parseInt(uid.substring(1));
                    out.print(i);
                    i++;
                    userid = "U" + Integer.toString(i);
                    out.print(userid);
                }
                
                PreparedStatement ps = con.prepareStatement("insert into patient(userid,firstname,lastname,email,contactnumber,gender,address,bloodgrp,dob) values(?,?,?,?,?,?,?,?,?)");
                ps.setString(1, userid);
                ps.setString(2, firstname);
                ps.setString(3, lastname);
                ps.setString(4, email);
                ps.setString(5, contactnumber);
                ps.setString(6, gender);
                ps.setString(7, address);
                ps.setString(8, bloodgrp);
                ps.setString(9, dob);
                
                String usertype="patient";
                String password="123";
                
                PreparedStatement ps3 = con.prepareStatement("insert into signup(id,firstname,lastname,email,contactnumber,usertype,gender,address,password) values(?,?,?,?,?,?,?,?,?)");
                ps3.setString(1, userid);
                ps3.setString(2, firstname);
                ps3.setString(3, lastname);
                ps3.setString(4, email);
                ps3.setString(5, contactnumber);
                ps3.setString(6, usertype);
                ps3.setString(7, gender);
                ps3.setString(8, address);
                ps3.setString(9, password);

                int x = ps.executeUpdate();
                if (x > 0) {
                    out.println("A new entry was successfully made!");
                } else {
                    out.println("A new entry could not be made!");
                }
                
                int x2 = ps3.executeUpdate();
                if (x2 > 0) {
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
