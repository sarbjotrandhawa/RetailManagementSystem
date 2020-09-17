

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>add sections</title>
        <link href="all1.css" rel="stylesheet" type="text/css">
    </head>
    <body>
         <center>
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
                ResultSet rs = stmt.executeQuery("select * from adminlogin");
               
            %> 
            <center>
            <h3 class="heading"> SECTIONS DETAIL</h3>
        <form action="addsection2.jsp" method="Post">
            <table border="0" style="margin-top: 30px" cellspacing="7">
                <tr>
                    <td>SECTION NAME</td>
                    <td><INPUT TYPE="TEXT" name="section_name" class="textbox" required/></td>
                </tr>
                <tr>
                    <td>DESCRIPTION</td>
                    <td><input type="text" name="description" class="textbox" required/></td>
                </tr>
                <tr>
                    <td>LOCATION</td>
                    <td><input type="text" name="location" class="textbox"/></td>
                </tr>
                 <tr>
                    <td>INCHARGE</td>
                    <td><select name="incharge" class="textbox" required>
                            <%
                                while (rs.next()) {%>
                                <option value="<%=rs.getString("username")%>"><%=rs.getString("username")%></option> 
                            <%}%> </select></td>
                </tr> 
              
                <tr>
                    <td></td>
                    <td><input type="submit" value = submit class ="submitstyle"/></td>
                </tr>

            </table>
        </form>
                
        <%
             String msgnotinsertsection = request.getParameter("msg");
             if(msgnotinsertsection!=null)
             {
        %>
        <%=msgnotinsertsection%> 
<%}%>
</center>
              </div>
            <%@include file="footer.jsp" %>
        </div>  
           
     

    </body>
</html>
