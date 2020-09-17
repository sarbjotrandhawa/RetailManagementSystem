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
            String bn = (String) session.getAttribute("brandname");
            System.out.println(bn);
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
            response.sendRedirect("viewbrands.jsp?msgeditDel= logo edited successfully");
        %>
        
    </body>
</html>
