

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>JSP Page</title>
    </head>
    <body>
         <%
            String editedcategory = request.getParameter("catnm");
            String editeddescription = request.getParameter("catdescription");
            String editedsection  = request.getParameter("catsec");
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Driverloaded successfully");
            Connection com = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/pointofsale","root","12345");
            System.out.println("Connection build");
            Statement stmt = com.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            System.out.println("statement created");
            ResultSet rs = stmt.executeQuery("select * from categories where category_name='"+editedcategory+"'");
            if(rs.next())
            {
                rs.updateString("category_name",editedcategory);
                rs.updateString("category_description",editeddescription);
                rs.updateString("category_section",editedsection);
                rs.updateRow();
                response.sendRedirect("ViewCategories.jsp?msgeditedDel= category edited successfully");
            }
       %>
    </body>
</html>
