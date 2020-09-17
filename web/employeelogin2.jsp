<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>login2</title>
        <link href="all1.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <%
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            ////////// JDBC CODE ///////////
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Driverloaded successfully");
            Connection com = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/pointofsale", "root", "12345");
            System.out.println("Connection build");
            Statement stmt = com.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            System.out.println("statement created");
            ResultSet rs = stmt.executeQuery("select * from adminlogin where username='" + username + "' and password='" + password + "'");
            if (rs.next()) {
                  session.setAttribute("un", username);
                  session.setAttribute("type", "employee");
                  response.sendRedirect("employeehome.jsp");

            } else {
                response.sendRedirect("employeelogin1.jsp?msg=Invalid username/password");
            }

        %>
            
    </body>
</html>
