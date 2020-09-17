<%-- 
    Document   : addemployee2
    Created on : 7 May, 2014, 8:05:50 PM
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
    <link href="all1.css" rel="stylesheet" type="text/css">
    <body>
             <div id="all">
         <%@include file="header.jsp" %>
             <%@include file="index_1.html" %>
           <div id="main" >
       <%
        
            String name = request.getParameter("mname");
            String passward = request.getParameter("pass");
            String email = request.getParameter("email");
         
            String mobile = request.getParameter("mno");
            String gender = request.getParameter("gender");
            String securityques = request.getParameter("ques");
            String securityans = request.getParameter("ans");
            String address = request.getParameter("address");
  
            
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Driverloaded successfully");
            Connection com = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/pointofsale", "root", "12345");
            System.out.println("Connection build");
            Statement stmt = com.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            System.out.println("statement created");
            ResultSet rs = stmt.executeQuery("select * from adminlogin");  
               rs.moveToInsertRow();
                session.setAttribute("empname",name);
                rs.updateString("username",name); 
                rs.updateString("password", passward);
                rs.updateString("emailid", email);
                rs.updateLong("phonenumber",Long.parseLong(mobile));
                rs.updateString("gender", gender);
                rs.updateString("address",address);
                rs.updateString("sec_ques",securityques);
                 rs.updateString("sec_ans", securityans);
                 rs.insertRow();
             %>
             <center>
           <h3>SELECT PRODUCT PHOTO</h3>
               <form action="addemployeephoto.jsp" enctype="multipart/form-data" method="post">
              
    <input type="file" name="upload" value="Browse" />
      
    <input type="submit" name="submit" value="submit"/>
   </form>
             </center>
        </div>
            <%@include file="footer.jsp" %>
        </div> 
    </body>
</html>
