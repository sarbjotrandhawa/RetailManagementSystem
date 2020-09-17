
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="all.css" rel="stylesheet" type="text/css">
        <title></title>
    </head>
    <link href="all1.css" rel="stylesheet" type="text/css">
    <body>
    <center>
        <div id="all">
            <%@include file="header.jsp" %>
          
             <div id="main" style="margin-left: 0px" >
                <%
                    String username = request.getParameter("username");

                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/pointofsale", "root", "12345");
                    Statement stmt = conn.createStatement();
                    ResultSet rs = stmt.executeQuery("select sec_ques from adminlogin where username='" + username + "' ");
                    if(rs.next())
                    {
                    String sec_ques = rs.getString("sec_ques");

                %>  

                <form action="userforgotpassword3.jsp" method="post">
                <input type="hidden" name="username" value="<%=username%>"/>
                <h1>Give security Ans</h1>
                    <table border="0" style="margin-top: 30px" cellspacing="7">
                       <tr>
                            <td>security question</td>
                            <td><input type="text" disabled value="<%=sec_ques%>" class="textbox"/></td>
                        </tr>
                        <tr>
                        <td>security answer</td>
                        <td><input type="text" name="sec_ans" class="textbox"/></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><input type="submit" class="submitstyle"/></td>
                        </tr>
                    </table>
                </form>
                        <%}
                        else
                    {
                         
                     response.sendRedirect("userforgotpassword1.jsp?q=username does not exist");
                        
}%>
                       
            </div>
            <%@include file="footer.jsp" %>
        </div> 
    </center>
    </body>
</html>
