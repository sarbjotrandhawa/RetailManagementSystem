

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
            <%@include file="index_1.html" %>
            <div id="main" >
                <center>
                <h4>MONTHLY BILL DETAIL</h4>
        <%
     
              String from = request.getParameter("from");
              String to = request.getParameter("to");
                Class.forName("com.mysql.jdbc.Driver");
    System.out.println("Driverloaded successfully");
    Connection com = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/pointofsale", "root", "12345");
    System.out.println("Connection build");
    Statement stmt = com.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
    System.out.println("statement created");
    ResultSet rs = stmt.executeQuery("select month(date) as month,sum(totalprice) as total from bill where month(date) between '"+from+"' and '"+to+"' group by month(date)");
    %>
    <table border class="CSSTableGenerator" >
        <tr>
            <td>date</td>
            <td>SUM OF TOTAL SALE</td>
        </tr>
        <%
    while(rs.next())
    {%>
    
        <tr>
            <% String month ="";
           if(rs.getString("month").equals("1"))
           {
               month="january";
           }
           else if(rs.getString("month").equals("2"))
           {
               month="febuary";
           }
            else if(rs.getString("month").equals("3"))
           {
               month="march";
           }
            else if(rs.getString("month").equals("4"))
           {
               month="aprial";
           }
            else if(rs.getString("month").equals("5"))
           {
               month="may";
           }
              else  if(rs.getString("month").equals("6"))
           {
               month="june";
           }
             else  if(rs.getString("month").equals("7"))
           {
               month="july";
           }
              else if(rs.getString("month").equals("8"))
           {
               month="august";
           }
                else if(rs.getString("month").equals("9"))
           {
               month="september";
           }
                  else  if(rs.getString("month").equals("10"))
           {
               month="october";
           }
                   else if(rs.getString("month").equals("11"))
           {
               month="november";
           }
               else if(rs.getString("month").equals("12"))
           {
               month="december";
           }
                     
   
     %>         
               <td><%=month%></td>
             <td><%=rs.getString("total")%></td>
        </tr>
    <%}
    %>
    </table>
                </center>
         </div>
            <%@include file="footer.jsp" %>
        </div> 
    </body>
</html>
