<%-- 
    Document   : addstock2
    Created on : 16 Apr, 2014, 2:57:50 PM
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
           
            String productid = request.getParameter("stockproid");
            String quantity = request.getParameter("quantity");
            String date = request.getParameter("date");
           
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Driverloaded successfully");
            Connection com = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/pointofsale", "root", "12345");
            System.out.println("Connection build");
            Statement stmt = com.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            System.out.println("statement created");
            ResultSet rs = stmt.executeQuery("select * from  addstock ");  
              rs.moveToInsertRow();
                rs.updateString("product_id",productid);
                rs.updateInt("quantity", Integer.parseInt(quantity));
                rs.updateString("date_of_stockadd", date);
                rs.insertRow();
                response.sendRedirect("adminhome.jsp?msg=STOCK INSERTED SUCCESSFULLY");
        %>
    </body>
</html>
