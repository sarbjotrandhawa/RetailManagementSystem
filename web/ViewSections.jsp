 


<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <title>view sections</title>
    </head>
    <script>
        function go()
        {
            return confirm("ARE YOU SURE TO DELETE?");
        }
    </script>
    <link href="all1.css" rel="stylesheet" type="text/css">
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
         
        <h3 class="heading">SECTIONS LIST</h3>
        <table border  class="CSSTableGenerator">
            <tr>
                <td>Section Name</td>
                <td>Description</td>
                <td>Location</td>
                <td>Incharge</td>
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
                ResultSet rs = stmt.executeQuery("select * from sections");
                while (rs.next()) {
            %> 
            <tr>
                <td><%=rs.getString("section_name")%></td>  
                <td><%=rs.getString("description")%></td>
                <td><%=rs.getString("location")%></td>
                <td><%=rs.getString("incharge")%></td>
                <td><a href="EditSection1.jsp?secnm=<%=rs.getString("section_name")%>">Edit</a></td>
                <td><a href="DeleteSection1.jsp?delsecnm=<%=rs.getString("section_name")%>" onclick="return go()">delete</a></td>
            </tr>
            <% }
            %>
        </table>
        <%
            String msgedited = request.getParameter("msgsectionedited");
            String msgdeleted = request.getParameter("msgsectiondeleted");

            if (msgedited != null) {
        %>
        <%=msgedited%>
        <%
            }
            if (msgdeleted != null) {
        %>
        <%= msgdeleted%>
        <%
            }
        %>
   </div>
            <%@include file="footer.jsp" %>
        </div>  
           
        </center>

    </body>
</html>
