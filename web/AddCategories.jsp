

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <title>ADD CATEGORIES</title>
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
            ResultSet rs = stmt.executeQuery("select * from sections");
        %>
        <center>
            <h3 class="heading">CATEGORIES DETAIL</h3>
        <form action="AddCategory2.jsp" method="post">
            <table style="margin-top: 30px" cellspacing="7">
                <tr>
                    <td>CATEGORY NAME</td>
                    <td><input type="test" name ="catname" class="textbox" required/></td>
                </tr>
                <tr>
                    <td>CATEGORY DESCRIPION</td>
                    <td><input type="text" name ="catdes" class ="textbox"/></td>
                </tr>
                <tr>
                    <td>SECTION NAME</td>
                    <td><select name="section" class="textbox" required="">
                            <%
                                while (rs.next()) {%>
                                <option value="<%=rs.getString("section_name")%>"><%=rs.getString("section_name")%></option> 
                            <%}%> </select></td>
                </tr> 
                <tr>
                    <td></td>
                    <td><input type="SUBMIT" value ="submit" class ="submitstyle"/></td>
                </tr>
            </table>
        </form>
                </center>
 </div>
            <%@include file="footer.jsp" %>
        </div>  
    </body>
</html>
