
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
            String contactnumber=request.getParameter("contactnumber");
            String message=request.getParameter("message");
            
            try{
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hms?allowPublicKeyRetrival=true&useSSL=false","root","root@v");
                PreparedStatement ps=con.prepareStatement("insert into feedback(firstname,lastname,email,contactnumber,message) values(?,?,?,?,?)");
                ps.setString(1, firstname);
                ps.setString(2, lastname);
                ps.setString(3, email);
                ps.setString(4, contactnumber);
                ps.setString(5, message);
                                
                int x=ps.executeUpdate();
                if(x>0)
                    out.println("Thank you for your feedback!");
                else
                    out.println("The feedback could not be sent!");
                
            }   
            
            catch(Exception e){
                out.println(e);
            }
        %>
    </body>
</html>
