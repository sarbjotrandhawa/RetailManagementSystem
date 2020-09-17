
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        <title>delete category 1</title>
    </head>
    <body>
          <%
            String deletedcat = request.getParameter("delcatnm");
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Driverloaded successfully");
            Connection com = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/pointofsale","root","12345");
            System.out.println("Connection build");
            Statement stmt = com.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            System.out.println("statement created");
            ResultSet rs = stmt.executeQuery("select * from categories where category_name='"+deletedcat+"'");
            while(rs.next())
            {
                rs.deleteRow();
                response.sendRedirect("ViewCategories.jsp?msgeditedDel= category deleted successfully");
            }
        %>
        
    </body>
</html>
