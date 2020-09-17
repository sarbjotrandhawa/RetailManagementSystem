<%-- 
    Document   : addpoint3
    Created on : 6 May, 2014, 2:42:40 PM
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
            int points = Integer.parseInt(request.getParameter("p"));
            int currentpoints = Integer.parseInt(request.getParameter("currentp"));
            int newpoints = Integer.parseInt(request.getParameter("newp"));
            int mid = Integer.parseInt(request.getParameter("mid"));
            int bid = Integer.parseInt(request.getParameter("bid"));
            Connection com = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/pointofsale", "root", "12345");
            System.out.println("Connection build");
            Statement stmt = com.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            System.out.println("statement created");
            ResultSet rs1 = stmt.executeQuery("select * from points where mid='" + mid + "'");
            if (rs1.next()) {
                rs1.updateInt("points", (currentpoints - points)+newpoints);
                rs1.updateRow();
                response.sendRedirect("printbill.jsp?points="+points+"&bid="+bid);
            }
        %>
    </body>
</html>
