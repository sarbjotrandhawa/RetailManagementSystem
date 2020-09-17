<%-- 
    Document   : viewbadstock
    Created on : 17 Apr, 2014, 2:41:08 PM
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
     <script>
        function go()
        {
            return confirm("ARE YOU SURE TO DELETE?");
        }
    </script>
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
               <center>
         <h class="heading">BADSTOCK  LIST</h>
   
       
        <table class="CSSTableGenerator">
            <tr>
                <td>BAD_STOCK_ID</td>
                <td>STOCK_ID</td>
                <td>QUANTITY</td>
                <td>SUPERVISER</td>
                <td></td>
                <td></td>
            </tr>
               <%
                Class.forName("com.mysql.jdbc.Driver");
                System.out.println("Driverloaded successfully");
                Connection com = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/pointofsale", "root", "12345");
                System.out.println("Connection build");
                Statement stmt = com.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                System.out.println("statement created");
                ResultSet rs = stmt.executeQuery("select * from badstock");
                while (rs.next()) {
            %> 
            <tr>
                <td><%=rs.getString("bad_stock_id")%></td>  
                <td><%=rs.getString("stock_id")%></td>
                <td><%=rs.getString("quantity")%></td>
                <td><%=rs.getString("supervisedby")%></td>
                <td><a href="editedbadstock.jsp?badsto=<%=rs.getString("bad_stock_id")%>">Edit</a></td>
                <td><a href="badstockdelete.jsp?badsto=<%=rs.getString("bad_stock_id")%>" onclick="return go()">delete</a></td>
            </tr>
            <%}%>
            </table>
               <%
            String msgeditDel = request.getParameter("msgeditedDel");
       
            if (msgeditDel != null) {
        %>
        <%=msgeditDel%>
        <%
            }
        %>
               </center>
          </div>
            <%@include file="footer.jsp" %>
        </div> 
    </body>
</html>
