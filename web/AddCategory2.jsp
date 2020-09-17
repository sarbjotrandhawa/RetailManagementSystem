

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>ADDSECTION2</title>
    </head>
    <body>
        <%
           
            String categoryname = request.getParameter("catname");
            String description = request.getParameter("catdes");
            String categorysection = request.getParameter("section");
           
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Driverloaded successfully");
            Connection com = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/pointofsale", "root", "12345");
            System.out.println("Connection build");
            Statement stmt = com.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            System.out.println("statement created");
            ResultSet rs = stmt.executeQuery("select * from categories where category_name='" + categoryname+ "'");  
         if (rs.next()) {
               response.sendRedirect("AddCategory.jsp?msg = CATEGORY ALREADY EXIST ");
            } else {
             rs.moveToInsertRow();
                rs.updateString("category_name",categoryname);
                rs.updateString("category_description", description);
                rs.updateString("category_section", categorysection);
                rs.insertRow();
                response.sendRedirect("adminhome.jsp?msg=CATEGORY INSERTED SUCCESSFULLY");
         }
        %>
    </body>
</html>
