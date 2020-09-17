

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>DELETE SECTION</title>
    </head>
    <body>
        <%
            String deletedsec = request.getParameter("delsecnm");
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Driverloaded successfully");
            Connection com = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/pointofsale","root","12345");
            System.out.println("Connection build");
            Statement stmt = com.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            System.out.println("statement created");
            ResultSet rs = stmt.executeQuery("select * from sections where section_name='"+deletedsec+"'");
            while(rs.next())
            {
                rs.deleteRow();
                response.sendRedirect("ViewSections.jsp?msgsectiondeleted= section deleted successfully");
            }
        %>
        
    </body>
</html>
