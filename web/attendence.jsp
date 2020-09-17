

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            function go(select)
            {
                
                var v = document.getElementsByName("cb");
                for(var i=0;i<v.length;i++)
                {
                    if(v[i].checked == false)
                    {
                        v[i].checked = true;
                       
                    }
                    else
                    {
                        v[i].checked = false;
                        //alert(2);
                    }
                }
            }
        </script>
         <link href="all1.css" rel="stylesheet" type="text/css">
    </head>
    <body>
           <div id="all">
           <%@include file="header.jsp" %>
           <%@include file="index_1.html" %>
           <div id="main" >
               <center>
               <h3>SELECT LIST</h3>
           <form action ="attendence2.jsp" method="get">
            <table class="CSSTableGenerator">
                <tr>
                    <td><input type="checkbox" onchange="go(this)"></td>
                    <td>NAME</td>
                    <td>PHOTO</td>
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
                     <%
                        String un = rs.getString("username");
                        un = un.replaceAll(" ", "%20");
                     %>
                     <td><input type="checkbox" value=<%=un%> name="cb"></td>
                    <td><%=rs.getString("username")%></td>
                     <td><img src = "<%=rs.getString("photo")%>" width="50" height="50"/></td>
                </tr> 
                 
            
        <%}%>
        <tr><td></td><td><input type="submit" value="save attendence"/></td></tr>
        </table>
        </form>
        </center>
         </div>
            <%@include file="footer.jsp" %>
        </div>  
    </body>
</html>
