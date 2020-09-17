

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
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Driverloaded successfully");
            Connection com = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/pointofsale", "root", "12345");
            System.out.println("Connection build");
            Statement stmt = com.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            System.out.println("statement created");
            ResultSet rs = stmt.executeQuery("select * from products");
        %>
        <center>
        <h class = "heading">STOCK DETAIL</h>
        <form action="addstock2.jsp" method="post">
            <table  style="margin-top: 30px" cellspacing="7" >
               <tr>
                    <td>PRODUCT NAME</td>
                    <td><select name="stockproid" class= "textbox" required>
                            <%
                                while (rs.next()) {%>
                                <option value="<%=rs.getString("product_id")%>"><%=rs.getString("product_name")%></option> 
                            <%}%> </select></td>
                </tr> 
                 <tr>
                    <td>QUANTITY</td>
                    <td><input type="text" name ="quantity" class="textbox" required/></td>
                </tr>
                <tr>
                    <td>DATE OF STOCk ADDING</td>
                    <td><input type="date" name="date" class="textbox" required/><td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" class="submitstyle"/></td>
                </tr>
                </table>
                </center>
                 </div>
            <%@include file="footer.jsp" %>
        </div> 
    </body>
</html>
