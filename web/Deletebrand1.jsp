

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        <title>delete brand</title>
    </head>
    <body>
        <%
            String deletedbrand = request.getParameter("delbrandnm");
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Driverloaded successfully");
            Connection com = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/pointofsale","root","12345");
            System.out.println("Connection build");
            Statement stmt = com.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            System.out.println("statement created");
            ResultSet rs = stmt.executeQuery("select * from brands where brand_name='"+deletedbrand+"'");
            while(rs.next())
            {
                rs.deleteRow();
                response.sendRedirect("viewbrands.jsp?msgeditedDel= brand deleted successfully");
            }
        %>
    </body>
</html>
