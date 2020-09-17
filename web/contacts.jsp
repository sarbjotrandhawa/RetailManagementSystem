<%-- 
    Document   : contacts
    Created on : 26 May, 2014, 11:21:23 PM
    Author     : Hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
          <link href="all1.css" rel="stylesheet" type="text/css">
    </head>
    <body>
         <div id="all">
          <%@include file="header.jsp" %>
           <%@include file="index_3.html" %>
           <div id="main" style="margin-left: 0px" >
                 <%@include file="index_4.html" %>
                 <center>
        <table border="0" >
            <tr><td><h style="font-size:50px; color: #674700">Name: Sarbjot Singh</h></td></tr>
            <tr><td><h style="font-size:50px; color: #674700">Email: Sarbjotrandhawa@gmail.com</h></td></tr>
            <tr><td><h style="font-size:50px; color: #674700">Contact number: 4379748765</h></td></tr>
            </tr>
        </table>
                 </center>
  
      </div>
            <%@include file="footer.jsp" %>
        </div>  
   
    </body>
</html>
