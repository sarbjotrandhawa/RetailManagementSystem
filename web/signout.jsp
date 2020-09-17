<%-- 
    Document   : signout
    Created on : 10 May, 2014, 2:56:48 PM
    Author     : Hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
       <%
           session.setAttribute("un", "null");
           response.sendRedirect("retailhome.jsp");
       %>
    </body>
</html>
