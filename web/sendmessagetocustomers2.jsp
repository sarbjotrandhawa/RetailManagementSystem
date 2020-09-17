<%-- 
    Document   : sendmessagetocustomers2
    Created on : 8 May, 2014, 12:08:29 PM
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
        <%
            String message = request.getParameter("message");
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Driverloaded successfully");
            Connection com = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/pointofsale", "root", "12345");
            System.out.println("Connection build");
            Statement stmt = com.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            System.out.println("statement created");
            ResultSet rs = stmt.executeQuery("select * from members");
            while(rs.next())
            {
                String phno = rs.getString("mobile");
                new vmm.sender_sms1(phno, message);
            }
            response.sendRedirect("sendmsgtocustomer.jsp?msg=Message Sent to Members.");
            
            %>
            
    </body>
</html>
