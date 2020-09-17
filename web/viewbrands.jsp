
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>view brands</title>
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
              <h3 class="heading">BRANDS LIST</h3>
        <table border class="CSSTableGenerator">
            <tr>
                <td>BRAND NAME</td>
                <td>BRAND DESCRIPTION</td>
                <td>LOGO</td>
                <td></td>
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
                ResultSet rs = stmt.executeQuery("select * from BRANDS");
                while (rs.next()) {
            %> 
            <tr>
                <td><%=rs.getString("brand_name")%></td>  
                <td><%=rs.getString("brand_description")%></td>
                <td><img src = "<%=rs.getString("brand_pic")%>" width="50" height="50"/></td>
                <td><a href="editbrand1.jsp?brandnm=<%=rs.getString("brand_name")%>">Edit</a></td>
                <td><a href="Deletebrand1.jsp?delbrandnm=<%=rs.getString("brand_name")%>" onclick="return go()">delete</a></td>
                 <td><a href="editlogo.jsp?brandnm=<%=rs.getString("brand_name")%>">Edit logo</a></td>
            </tr>
                <%
            }
           
                %>
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
