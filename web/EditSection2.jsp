

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>editsection2</title>
    </head>
    <body>
        <%
            String editedsection = request.getParameter("secnm");
            String editeddescription = request.getParameter("description");
            String editedlocation    = request.getParameter("location");
            String editedincharge   = request.getParameter("incharge");
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Driverloaded successfully");
            Connection com = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/pointofsale","root","12345");
            System.out.println("Connection build");
            Statement stmt = com.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            System.out.println("statement created");
            ResultSet rs = stmt.executeQuery("select * from sections where section_name='"+editedsection+"'");
            if(rs.next())
            {
                rs.updateString("description",editeddescription);
                rs.updateString("location",editedlocation);
                rs.updateString("incharge",editedincharge);
                rs.updateRow();
                response.sendRedirect("ViewSections.jsp?msgsectionedited = section edited successfully");
            }
       %>
    </body>
</html>
