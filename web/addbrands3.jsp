

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@page import="vmm.*" %>
        <%
            String savefile = "";
            String bn = (String) session.getAttribute("brandname");
            try {
                String absolutepath = getServletContext().getRealPath("/uploads/brands");

                String upname = vmm.FileUploader.savefile(request, absolutepath);
                Class.forName("com.mysql.jdbc.Driver");
                System.out.println("Driverloaded successfully");
                Connection com = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/pointofsale", "root", "12345");
                System.out.println("Connection build");
                Statement stmt = com.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                System.out.println("statement created");
                ResultSet rs = stmt.executeQuery("select * from brands where brand_name='" + bn+"'");
                if (rs.next()) {
                    rs.updateString("brand_pic", "./uploads/brands/" + upname);
                    rs.updateRow();
                 
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }
            response.sendRedirect("adminhome.jsp?msg= brand added successfully");
        %>
        

    </body>
</html>
