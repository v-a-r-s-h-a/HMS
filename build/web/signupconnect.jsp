
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
            String email = request.getParameter("email");
            String contactnumber = request.getParameter("contactnumber");
            String usertype = request.getParameter("usertype");
            String gender = request.getParameter("gender");
            String address = request.getParameter("address");
            String password = request.getParameter("password");
            String bloodgrp = request.getParameter("bloodgrp");
            String dob = request.getParameter("dob");
            String id = "";

            id="U111";
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hms?allowPublicKeyRetrival=true&useSSL=false", "root", "root@v");

                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("SELECT id FROM signup ORDER BY id DESC LIMIT 1");
                while (rs.next()) {
                    String uid = rs.getString("id");
                    int i = Integer.parseInt(uid.substring(1));
                    i++;
                    id = "U" + Integer.toString(i);
                }
                PreparedStatement ps = con.prepareStatement("insert into signup(id,firstname,lastname,email,contactnumber,usertype,gender,address,password) values(?,?,?,?,?,?,?,?,?)");
                ps.setString(1, id);
                ps.setString(2, firstname);
                ps.setString(3, lastname);
                ps.setString(4, email);
                ps.setString(5, contactnumber);
                ps.setString(6, usertype);
                ps.setString(7, gender);
                ps.setString(8, address);
                ps.setString(9, password);

                PreparedStatement ps2 = con.prepareStatement("insert into patient(userid,firstname,lastname,email,contactnumber,gender,address,bloodgrp,dob) values(?,?,?,?,?,?,?,?,?)");
                ps2.setString(1, id);
                ps2.setString(2, firstname);
                ps2.setString(3, lastname);
                ps2.setString(4, email);
                ps2.setString(5, contactnumber);
                ps2.setString(6, gender);
                ps2.setString(7, address);
                ps2.setString(8, bloodgrp);
                ps2.setString(9, dob);

                int x = ps.executeUpdate();
                if (x > 0) {
                    out.print("<script type=\"text/javascript\">");
                    out.print("alert('You are done signing up!');");
                    out.print("location='login.html';");
                    out.print("</script>");
                } else {
                    out.print("<script type=\"text/javascript\">");
                    out.print("alert('Signing up Failed!');");
                    out.print("location='signup.html';");
                    out.print("</script>");
                }

            } catch (Exception e) {
                out.println(e);
            }
        %>
    </body>
</html>
