

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
      <h3 class="heading">EMPLOYEE LIST</h3>
        <table border class="CSSTableGenerator">
            <tr>
                <td>NAME</td>
                <td>EMAIL</td>
                <td>PHONE</td>
                <td>GENDER</td>
                <td>ADDRESS</td>
                <td>PHOTO</td>
                <td></td>
            </tr>
               <%
                Class.forName("com.mysql.jdbc.Driver");
                System.out.println("Driverloaded successfully");
                Connection com = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/pointofsale", "root", "12345");
                System.out.println("Connection build");
                Statement stmt = com.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                System.out.println("statement created");
                ResultSet rs = stmt.executeQuery("select * from adminlogin");
                while (rs.next()) {
            %> 
            <tr>
                <td><%=rs.getString("username")%></td>  
                <td><%=rs.getString("emailid")%></td>
                <td><%=rs.getString("phonenumber")%></td>
                <td><%=rs.getString("gender")%></td>  
                <td><%=rs.getString("address")%></td>
                <td><img src = "<%=rs.getString("photo")%>" width="50" height=""/50></td>
                <td><a href="deleteemp.jsp?delemp=<%=rs.getString("username")%>" onclick="return go()">delete</a></td>
            </tr>
              <%}%>
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
