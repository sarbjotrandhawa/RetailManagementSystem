

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <title>editsection1</title>
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
            String categoryname = request.getParameter("catnm");
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Driverloaded successfully");
            Connection com = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/pointofsale", "root", "12345");
            System.out.println("Connection build");
            Statement stmt = com.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            System.out.println("statement created");
            ResultSet rs = stmt.executeQuery("select * from categories where category_name='" + categoryname + "'");
            if (rs.next()) {
        %>
  <center>
        <h class="heading">EDIT FORM</h>
        <form action="editcategory2.jsp" method="post">
            <table  border ="0" style="margin-top: 30px" cellspacing="7">
              
                <tr>
                    <td>CATEGORY NAME</td>
                    <td><input type="text" name="catnm" value= "<%=rs.getString("category_name")%>" class="textbox"/></td>
                </tr>
                <tr>
                    <td>CATEGORY DESCRIPTION</td>
                    <td><input type="text" name="catdescription" value="<%=rs.getString("category_description")%>" class="textbox"/></td>
                </tr>
                <tr>
                    <td>SECTION NAME</td>
                    <td><select name="catsec" class="textbox" required="">
                            <%
                                Statement stmt1 = com.createStatement();
                                System.out.println("statement created");
                                ResultSet rs1 = stmt1.executeQuery("select * from sections");
                                while (rs1.next()) {%>
                            <option value="<%=rs1.getString("section_name")%>"><%=rs1.getString("section_name")%></option> 
                            <%}%> </select></td>
                </tr> 
                <tr>
                    <td></td>
                    <td><input type="submit" value="save" class="submitstyle"/></td>
                </tr>
            </table>
        </form>
  </center>
        <%
            }
        %>
         </div>
            <%@include file="footer.jsp" %>
        </div> 
    </body>
</html>
