
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
            String[] s = request.getParameterValues("cb");
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Driverloaded successfully");
            Connection com = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/pointofsale", "root", "12345");
            System.out.println("Connection build");
            System.out.println("statement created");
            String s1 = "";
            boolean flag = false;
            for (int i = 0; i < s.length; i++) {
                System.out.println(s[i]);
                s[i] = s[i].replaceAll("%20", " ");
                Statement stmt = com.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                ResultSet rs = stmt.executeQuery("select * from pointofsale.attendence where username='" + s[i] + "' and date(date_of_attendence) = CURDATE()");
                if (rs.next()) {
                    s1 = s1 + s[i] + "<br>";
                    flag = true;
                } else {
                    Statement stmt1 = com.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                ResultSet rs1 = stmt1.executeQuery("select * from pointofsale.attendence ");
                
                    rs1.moveToInsertRow();
                    rs1.updateString("username", s[i]);
                    rs1.insertRow();
                }
            }
            if (flag) {
                response.sendRedirect("adminhome.jsp?msg= attendence added successfully except <br>" + s1);
            } else {
                response.sendRedirect("adminhome.jsp?msg= attendence added successfully");
            }
        %> 
    </body>
</html>
