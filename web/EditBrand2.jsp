
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
      
        <title>edit brand 2</title>
    </head>
    <body>
          <%
            String editedbrand = request.getParameter("brandnm");
            String editeddescription = request.getParameter("description");
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Driverloaded successfully");
            Connection com = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/pointofsale","root","12345");
            System.out.println("Connection build");
            Statement stmt = com.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            System.out.println("statement created");
            ResultSet rs = stmt.executeQuery("select * from brands where brand_name='"+editedbrand+"'");
            if(rs.next())
            {
                rs.updateString("brand_description",editeddescription);
                rs.updateRow();
                response.sendRedirect("viewbrands.jsp?msgeditedDel= brand edited successfully");
            }
            %>
    </body>
</html>
