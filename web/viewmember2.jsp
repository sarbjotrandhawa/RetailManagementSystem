

<%@page import="java.sql.*"%>
       <%
           ResultSet rs1;
            String searchtext = request.getParameter("search");
             String radioselect = request.getParameter("radio");
                Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Driverloaded successfully");
            Connection com = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/pointofsale", "root", "12345");
            System.out.println("Connection build");
            Statement stmt = com.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            System.out.println("statement created");
            if(radioselect.equals("mobile"))
            {
                rs1 = stmt.executeQuery("select * from members where mobile like'"+searchtext+"%'");
            }
            else if(radioselect.equals("name"))
            {
                rs1 = stmt.executeQuery("select * from members where name like'"+searchtext+"%'");
            }
            else
            {
                rs1 = stmt.executeQuery("select * from members where memberid like'"+searchtext+"%'");
            }
           %>
           <center>
           <h3>MEMBER LIST</h3>
           <table border class="CSSTableGenerator" cellspacing="5px;" cellpadding="5px;" >
    <tr>
        <td>memberid</td>
        <td>name</td>
        <td>phone number</td>
        <td></td>
    </tr>
       
        <%while (rs1.next()) {
        %>
        <tr>
            <td><%=rs1.getString("memberid")%></td>
         <td><%=rs1.getString("name")%></td>
         <td><%=rs1.getString("mobile")%></td>
          <td><a href="viewmemberfulldetail.jsp?memid=<%=rs1.getString("memberid")%>">view detail</a></td>
        <%}
        %>
           </table>
           </center>