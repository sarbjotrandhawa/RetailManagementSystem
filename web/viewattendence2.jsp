

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
           String username = request.getParameter("name"); 
            Class.forName("com.mysql.jdbc.Driver");
    System.out.println("Driverloaded successfully");
    Connection com = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/pointofsale", "root", "12345");
    System.out.println("Connection build");
    Statement stmt = com.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
    System.out.println("statement created");
    ResultSet rs = stmt.executeQuery("select * from  attendence where username='"+username  + "'");
      %>
    <center>
      <h3>ATTENDENCE RECORD</h3>
        <table  class="CSSTableGenerator">
         <tr>
        <td>Date</td>
         
        </tr>
        
        <%while (rs.next()) {
        %>
        <tr>
            <td><%=rs.getString("date_of_attendence")%></td></tr>
        
        <%}
        %>
        </table>
    </center>
    </body>
</html>
z