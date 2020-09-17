

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

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
            String brandnm = request.getParameter("brandname");
            String branddes = request.getParameter("description");
         
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Driverloaded successfully");
            Connection com = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/pointofsale", "root", "12345");
            System.out.println("Connection build");
            Statement stmt = com.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            System.out.println("statement created");
            ResultSet rs = stmt.executeQuery("select * from brands where brand_name='"+brandnm + "'");
            if (rs.next()) {
                response.sendRedirect("addbrands.jsp?msg= brand already exit");
            } else {
                session.setAttribute("brandname",brandnm );
                rs.moveToInsertRow();
                rs.updateString("brand_name", brandnm);
                rs.updateString("brand_description",branddes);
                rs.insertRow();
               %>
               <center>
               <h3>SELECT BRAND LOGO</h3>
               <form action="addbrands3.jsp" enctype="multipart/form-data" method="post">
    <input type="file" name="upload" value="Browse" />
      <br>
      <br>
    <input type="submit" name="submit" value="submit"/>
   </form>
               </center>
        <%
            }
        %> 
        <
     </div>
            <%@include file="footer.jsp" %>
        </div> 
    </body>
</html>
