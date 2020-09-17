

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
            ResultSet rs = stmt.executeQuery("select * from addstock");
        %>
        <center>
        <h class="heading">BADSTOCK DETAIL</h>
          <form action="badstock2.jsp" method="post">
            <table border="0"  style="margin-top: 30px" cellspacing="7" >
               <tr>
                    <td>STOCK ID</td>
                    <td><select name="stockid" required class="textbox">
                            <%
                                while (rs.next()) {%>
                                <option value="<%=rs.getString("stock_id")%>"><%=rs.getString("stock_id")%></option> 
                            <%}%> </select></td>
                </tr> 
                 <tr>
                    <td>QUANTITY</td>
                    <td><input type="text" name ="quantity" required class="textbox"/></td>
                </tr>
                  <%
                                   Statement stmt1 = com.createStatement();
                                   System.out.println("statement created");
                                   ResultSet rs1 = stmt1.executeQuery("select * from adminlogin");
                                   %>
                 <tr>
                    <td>SUPERVISER</td>
                    <td><select name="superviser" class="textbox" required>
                            <%
                                while (rs1.next()) {%>
                                <option value="<%=rs1.getString("username")%>"><%=rs1.getString("username")%></option> 
                            <%}%> </select></td>
                </tr> 
                 <tr>
                    <td></td>
                    <td><input type="submit" value="add" class="submitstyle"/></td>
                </tr>
            </table>
                <form>
                    </center>
                      </div>
            <%@include file="footer.jsp" %>
        </div> 
    </body>
</html>
