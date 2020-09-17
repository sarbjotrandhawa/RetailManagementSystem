
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String username = (String)session.getAttribute("un");
            String oldpass = request.getParameter("oldpassword");
            String newpass = request.getParameter("newpassword");
            
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Driverloaded successfully");
            Connection com = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/pointofsale","root","12345");
            System.out.println("Connection build");
            Statement stmt = com.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            System.out.println("statement created");
            ResultSet rs = stmt.executeQuery("select * from adminlogin where username='"+username+"' and password='"+oldpass+"'");
            if(rs.next())
            {
                rs.updateString("password",newpass);
                rs.updateRow();
                response.sendRedirect("adminhome.jsp?msgchange = passward changed successfully");
            }
            else
            {
                response.sendRedirect("changepassword.jsp?q=Username and Password doesnot match");
            }
        %>
        
    </body>
</html>
