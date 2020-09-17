

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
       
        <title>edit brand</title>
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
             String brandname = request.getParameter("brandnm");
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Driverloaded successfully");
            Connection com = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/pointofsale","root","12345");
            System.out.println("Connection build");
            Statement stmt = com.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            System.out.println("statement created");
            ResultSet rs = stmt.executeQuery("select * from brands where brand_name='"+brandname+"'");
            if(rs.next())
            {
         %>
         <center>
         <h class="heading">EDIT FORM</h>
          <form action="EditBrand2.jsp" method="post">
            <table border ="0"  style="margin-top: 30px" cellspacing="7"  >
               
                <tr>
                    <td>BRAND NAME</td>
                    <td><input type="text" name="brandnm" value= "<%=rs.getString("brand_name")%>" class="textbox" readonly/></td>
                </tr>
                <tr>
                    <td>BRAND DESCRIPTION</td>
                    <td><input type="text" name="description" value="<%=rs.getString("brand_description")%>" class="textbox "/></td>
                </tr>
                <tr>
                    <td>LOGO</td>
                    <td><img src = "<%=rs.getString("brand_pic")%>" width="50" height="50"/></td>
                </tr>
                 <tr>
                    <td></td>
                    <td><input type="SUBMIT"  value="SAVE" class="submitstyle"/></td>
                </tr>
            </table>
          </form>
         </center>
   <% }     %>
    </div>
            <%@include file="footer.jsp" %>
        </div> 
       
    </body>
</html>
