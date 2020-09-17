<%-- 
    Document   : addpoducts2
    Created on : 16 Apr, 2014, 12:39:23 PM
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
        <%@page import="vmm.*" %>
        <%
            String savefile = "";
            String pn = (String) session.getAttribute("productname");
            try {
                String absolutepath = getServletContext().getRealPath("/uploads/brands");

                String upname = vmm.FileUploader.savefile(request, absolutepath);
                Class.forName("com.mysql.jdbc.Driver");
                System.out.println("Driverloaded successfully");
                Connection com = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/pointofsale", "root", "12345");
                System.out.println("Connection build");
                Statement stmt = com.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                System.out.println("statement created");
                ResultSet rs = stmt.executeQuery("select * from products where product_name='"+pn+"'");
                if (rs.next()) {
                    rs.updateString("photo", "./uploads/brands/" + upname);
                    rs.updateRow();
                 
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }
            response.sendRedirect("adminhome.jsp?msg= product added successfully");
        %>
        

 
    </body>
</html>
