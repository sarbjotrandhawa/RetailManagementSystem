<%-- 
    Document   : deletequantity1
    Created on : 16 Apr, 2014, 3:41:48 PM
    Author     : Hp
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    
    <body>
         <%
            String stockid = request.getParameter("delquid");
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Driverloaded successfully");
            Connection com = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/pointofsale","root","12345");
            System.out.println("Connection build");
            Statement stmt = com.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            System.out.println("statement created");
            ResultSet rs = stmt.executeQuery("select * from addstock where stock_id='"+stockid+"'");
            while(rs.next())
            {
                rs.deleteRow();
                response.sendRedirect("viewstock.jsp?msgeditedDel= quantity deleted successfully");
            }
        %>
    </body>
</html>
