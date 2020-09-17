<%-- 
    Document   : viewstock
    Created on : 16 Apr, 2014, 3:19:15 PM
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
         <h4 class="heading">STOCK LIST</h4>
        <table border  class="CSSTableGenerator">
            <tr>
                <td>STOCK_ID</td>
                <td>PRODUCT_NAME</td>
                <td>QUANTITY</td>
                <td>DATE</td>
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
                ResultSet rs = stmt.executeQuery("select * from addstock");
                while (rs.next()) {
            %> 
             <tr>
                <td><%=rs.getString("stock_id")%></td>  
                <%
                    Statement stmt1 = com.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                System.out.println("statement created");
                ResultSet rs1 = stmt1.executeQuery("select * from products where product_id="+rs.getString("product_id"));
                rs1.next();
                %>
                
                <td><%=rs1.getString("product_name")%></td>
                <td><%=rs.getString("quantity")%></td>
                <td><%=rs.getString("date_of_stockadd")%></td>
                <td><a href="editquantity1.jsp?quantityid=<%=rs.getString("stock_id")%>">Edit</a></td>
                <td><a href="deletequantity1.jsp?delquid=<%=rs.getString("stock_id")%>" onclick="return go()">delete</a></td>
                </tr>
               <% }%>
               </table>
                <%
            String msgeditDel = request.getParameter("msgeditedDel");
       
            if (msgeditDel != null) {
        %>
        <%=msgeditDel%>
        <%
            }
        %>
        <center>
           </div>
            <%@include file="footer.jsp" %>
        </div> 
    </body>
</html>
