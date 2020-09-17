

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
            String sectionname = request.getParameter("section_name");
            String description = request.getParameter("description");
            String location = request.getParameter("location");
            String incharge = request.getParameter("incharge");
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Driverloaded successfully");
            Connection com = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/pointofsale", "root", "12345");
            System.out.println("Connection build");
            Statement stmt = com.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            System.out.println("statement created");
            ResultSet rs = stmt.executeQuery("select * from sections where section_name='" + sectionname + "'");  
         if (rs.next()) {
                response.sendRedirect("addsections.jsp?msg = section already exist ");
            } else {
             rs.moveToInsertRow();
                rs.updateString("section_name", sectionname);
                rs.updateString("description", description);
                rs.updateString("location", location);
                rs.updateString("incharge", incharge);
                rs.insertRow();
                response.sendRedirect("adminhome.jsp?msg=section inserted sucessfully");
            }

        %>

    </body>
</html>
