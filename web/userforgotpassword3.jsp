

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <title> detail</title>
        
        <link href="all1.css" rel="stylesheet" type="text/css">
    </head>
   
    <body>
         
         <div id="all">
         <%@include file="header.jsp" %>
         <div id="main"  >
        <%
            String username = request.getParameter("username");
            //String security_question=request.getParameter("security_question");
            String security_answer = request.getParameter("sec_ans");
            Class.forName("com.mysql.jdbc.Driver");
             Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/pointofsale", "root", "12345");
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("select * from adminlogin where username='" + username + "'and sec_ans='" + security_answer + "'");
            if (rs.next()) {
              
        %>
        <center>
        <h class="heading"> Your Detail </h>
       <table  style="margin-top: 30px">
            <tr>
          <td><img src = "<%=rs.getString("photo")%>" width="70" height="80"/></td>
          <td></td>
            </tr>
            <tr>
                <td>name</td>
                <td><%=rs.getString("username")%></td>
            </tr>
              <tr>
                <td>password</td>
                <td><%=rs.getString("password")%></td>
            </tr>
             <tr>
                <td>phone number</td>
                <td><%=rs.getString("phonenumber")%></td>
            </tr>
        </table>
         <%
            } else {
                response.sendRedirect("adminlogin1.jsp?msg=incorrect details");
            }
        %>
        </center>
      
         </div>
            <%@include file="footer.jsp" %>
        </div> 
        
    </body>
</html>
