

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
                 <%
                String s = (String) session.getAttribute("type");
                
                if (s != null && s.equals("employee")) {%>
            <%@include file="index.html" %>
            <%} else if (s != null && s.equals("admin")){
            %>
            <%@include file="index_1.html" %>

            <%    
                }
            %>
            <div id="main" >
           
      <%
           String memberid = request.getParameter("memid"); 
            Class.forName("com.mysql.jdbc.Driver");
    System.out.println("Driverloaded successfully");
    Connection com = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/pointofsale", "root", "12345");
    System.out.println("Connection build");
    Statement stmt = com.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
    System.out.println("statement created");
    ResultSet rs = stmt.executeQuery("select * from  members where memberid='"+memberid  + "'");
    
    System.out.println("Connection build");
    Statement stmt1 = com.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
    System.out.println("statement created");
    ResultSet rs1 = stmt1.executeQuery("select * from  points where mid='"+memberid  + "'");
    if(rs1.next())
    %>
    <center>
    <h3>MEMBER FULL DETAIL</h3>
      <table border class="CSSTableGenerator" overflow x>
    <tr>
        
        <td>name</td>
        <td>phone number</td>
        <td>email</td>
        <td>dateofbirth</td>
        <td>gender</td>
        <td>marital status</td>
     
        <td>anniversary date</td>
        
    </tr>
          <%  if (rs.next()) {
            %> 
            <tr>
                 
                <td><%=rs.getString("name")%></td>
                <td><%=rs.getString("mobile")%></td>
                 <td><%=rs.getString("email")%></td>
                <td><%=rs.getString("dateofbirth")%></td>  
                <td><%=rs.getString("gender")%></td>
                 <td><%=rs.getString("marital_status")%></td>  
              
                <td><%=rs.getString("anniversary_date")%></td>
             
            </tr>
                <%
            }
           
                %>
      </table>
      </center>
                  </div>
            <%@include file="footer.jsp" %>
        </div> 
    </body>
</html>
