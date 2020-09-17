<%-- 
    Document   : editquantity2
    Created on : 17 Apr, 2014, 12:19:03 PM
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
            String stockid = request.getParameter("stockid");
            String productid = request.getParameter("proid");
            String quantity = request.getParameter("quantity");
            String date = request.getParameter("date");
           
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Driverloaded successfully");
            Connection com = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/pointofsale", "root", "12345");
            System.out.println("Connection build");
            Statement stmt = com.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            System.out.println("statement created");
            ResultSet rs = stmt.executeQuery("select * from  addstock where stock_id='"+stockid+"'");  
             if(rs.next())
             {
                rs.updateString("product_id",productid);
                rs.updateInt("quantity", Integer.parseInt(quantity));
                rs.updateString("date_of_stockadd", date);
                rs.updateRow();
                response.sendRedirect("viewstock.jsp?msgeditedDel=STOCK EDITED SUCCESSFULLY");
             }
        %>
    </body>
</html>
