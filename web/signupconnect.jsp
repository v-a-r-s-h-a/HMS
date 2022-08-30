
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
            String id = "";

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

                    int x = ps.executeUpdate();
                    if (x > 0) {
                        out.println("You arer done signing up!");
                        response.sendRedirect("login.html");
                    } else {
                        out.println("Signing up Failed!");
                    }

                }
                catch(Exception e){
                out.println(e);
            }
        %>
    </body>
</html>
