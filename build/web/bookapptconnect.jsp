
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
            String firstname=request.getParameter("firstname");
            String lastname=request.getParameter("lastname");
            String email=request.getParameter("email");
            String doctorname=request.getParameter("doctorname");
            String contactnumber=request.getParameter("contactnumber");
            String date=request.getParameter("dat");
            
            try{
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hms?allowPublicKeyRetrival=true&useSSL=false","root","root@v");
                PreparedStatement ps=con.prepareStatement("insert into bookapp(firstname,lastname,email,contactnumber,date,doctorname) values(?,?,?,?,?,?)");
                ps.setString(1, firstname);
                ps.setString(2, lastname);
                ps.setString(3, email);
                ps.setString(4, contactnumber);
                ps.setString(5, date);
                ps.setString(6, doctorname);
                                
                int x=ps.executeUpdate();
                if(x>0)
                    out.println("Appointment made!");
                else
                    out.println("The appointment could not be made!");
                
            }   
            
            catch(Exception e){
                out.println(e);
            }
        %>
    </body>
</html>
