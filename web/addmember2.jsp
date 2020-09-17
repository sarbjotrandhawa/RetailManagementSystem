

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
     <link href="all1.css" rel="stylesheet" type="text/css">
    <body>
        <h3>hello</h3>
       <%
            String member_name = request.getParameter("mname");
            String email = request.getParameter("email");
            String phno = request.getParameter("mno");
            String dateofbirth = request.getParameter("bdate");
            String gender = request.getParameter("gender");
            String merital = request.getParameter("mstatus");
            String anniversary = request.getParameter("adate");
            ////////// JDBC CODE ///////////
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Driverloaded successfully");
            Connection com = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/pointofsale", "root", "12345");
            System.out.println("Connection build");
            Statement stmt = com.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            System.out.println("statement created");
            ResultSet rs = stmt.executeQuery("select * from members");
            
                rs.moveToInsertRow();
                rs.updateString("name", member_name);
                rs.updateString("email",email);
                rs.updateString("mobile", phno);
                rs.updateString("dateofbirth",dateofbirth);
                rs.updateString("gender",gender);
                rs.updateString("marital_status",merital);
                rs.updateString("anniversary_date",anniversary);
                rs.insertRow();  
                response.sendRedirect("adminhome.jsp?msg=member added");
         

        %>
    </body>
</html>
