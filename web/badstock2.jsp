<%-- 
    Document   : badstock2
    Created on : 17 Apr, 2014, 2:28:37 PM
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
            String quantity = request.getParameter("quantity");
            String superviser = request.getParameter("superviser");
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Driverloaded successfully");
            Connection com = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/pointofsale", "root", "12345");
            System.out.println("Connection build");
            Statement stmt = com.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            System.out.println("statement created");
            ResultSet rs = stmt.executeQuery("select * from badstock");
               rs.moveToInsertRow();
                rs.updateString("stock_id",stockid);
                rs.updateInt("quantity", Integer.parseInt(quantity));
                rs.updateString("supervisedby", superviser);
                rs.insertRow();
                response.sendRedirect("adminhome.jsp?msg=BADSTOCK INSERTED SUCCESSFULLY");
                
            
         
            %>
    </body>
</html>
