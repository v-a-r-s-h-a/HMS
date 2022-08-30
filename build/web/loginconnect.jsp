
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@page import="java.sql.*, java.util.*" %>
        <%
            String uname=request.getParameter("userid");
            String password=request.getParameter("password");
            out.print(uname);
            out.print(password);
            
            if(uname.equals("admin") && password.equals("123"))
            {
                session.setAttribute("uname",uname);
                response.sendRedirect("adminprofile.jsp");   
            }
            else
            {
                out.print("User ID and password do not match");
            }
        %>
    </body>
</html>
