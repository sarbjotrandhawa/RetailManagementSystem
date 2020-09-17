
<%@page import="java.util.StringTokenizer"%>
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
        <h4>DAILY BILL DETAIL</h4>
      
        <%
            
      String fromdate = request.getParameter("fromdate");
      String todate = request.getParameter("todate");
      StringTokenizer st = new StringTokenizer(fromdate,"-");
      int cyear = Integer.parseInt(st.nextToken());
      int cmonth = Integer.parseInt(st.nextToken());
      int cdate = Integer.parseInt(st.nextToken());
      Date from = new Date(cyear-1900,cmonth-1,cdate);
      StringTokenizer st2 = new StringTokenizer(todate,"-");
      cyear = Integer.parseInt(st2.nextToken());
      cmonth = Integer.parseInt(st2.nextToken());
      cdate = Integer.parseInt(st2.nextToken());
      Date to = new Date(cyear-1900,cmonth-1,cdate);
      //System.out.println(from+"     "+to);
     Class.forName("com.mysql.jdbc.Driver");
    System.out.println("Driverloaded successfully");
    Connection com = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/pointofsale", "root", "12345");
    System.out.println("Connection build");
    Statement stmt = com.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
    System.out.println("statement created");
    ResultSet rs = stmt.executeQuery("select convert(date , date) 'dd' , sum(totalprice)'sum' from bill where date between '"+from+"' and '"+to+"' group by dd");
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
            <td><%=rs.getString("dd")%></td>
             <td><%=rs.getString("sum")%></td>
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
