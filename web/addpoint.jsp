<%-- 
    Document   : addpoint
    Created on : 3 May, 2014, 5:11:55 PM
    Author     : Hp
--%>

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
            var select = document.getElementById("sel").value;
            if (select === "MARRIED")
            {
                document.getElementById("anv").style.display = "block"
                document.getElementById("anv1").style.display = "block"
            }
            else
            {
                document.getElementById("anv").style.display = "none"
                document.getElementById("anv1").style.display = "none"
            }
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
                <%
                    String no = request.getParameter("phone");
                    String id = request.getParameter("bid");
                    Double gt = Double.parseDouble(request.getParameter("gt"));
                    int points = (int) (gt / 100);
                    Class.forName("com.mysql.jdbc.Driver");
                    System.out.println("Driverloaded successfully");
                    Connection com = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/pointofsale", "root", "12345");
                    System.out.println("Connection build");
                    Statement stmt = com.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                    System.out.println("statement created");
                    ResultSet rs1 = stmt.executeQuery("select * from members where mobile='" + no + "'");
                    if (rs1.next()) {

                        Statement stmt2 = com.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                        System.out.println("statement created");
                        ResultSet rs2 = stmt2.executeQuery("select * from points where mid='" + rs1.getString("memberid") + "'");
                        if (rs2.next()) {
                %>
                <h3>  Your Current Points are:- <%=rs2.getString("points")%> </h3>
                
                <form action="addpoint3.jsp">
                    <table border='0' >
                        <tr> <td> No. of points</td><td><input type="text" name="p" class="textsearch"></td>
                    <input type="hidden" name="newp" value="<%=points%>">
                    <input type="hidden" name="currentp" value="<%=rs2.getString("points")%>">
                    <input type="hidden" name="mid" value="<%=rs2.getString("mid")%>">
                    <input type="hidden" name="bid" value="<%=id%>">
                    <td>   <input type="submit" value="Generate" class="submitstyle"> </td></tr>
                    </table>
                </form>
                <%

                    }
                } else if (gt > 2500) {
                %>
                <h class="heading">MEMBER DETAIL</h>
                <form action="addpoint2.jsp" method="post">
                    <table border="0" style="margin-top: 30px" cellspacing="6"  >
                        <tr>
                            <td>NAME</td>
                            <td><input type="text" name="mname" required class="textbox"/></td>
                        </tr>
                        <tr>
                            <td>EMAIL ID</td>
                            <td><input type="text" name="email" required class="textbox"/></td>
                        </tr>
                        <tr>
                            <td>MOBILE NUMBER</td>
                            <td><input type="text" name="mno" required class="textbox"/></td>
                        </tr>
                        <tr>
                            <td>DATE OF BIRTH</td>
                            <td><input type="hidden" name="newp" value="<%=points%>">
                                <input type="hidden" name="bid" value="<%=id%>">
                                <input type="text" name="bdate" class="textbox"/></td>
                        </tr>
                        <tr>
                            <td>GENDER</td>
                            <td><input type="radio" name="gender" value="male"/> male</td>
                            <td><input type="radio" name="gender" value="female"/>female</td>
                        </tr>
                        <tr>
                            <td>MERITAL STATUS</td>
                            <td>
                                <select name="mstatus" id="sel" class="textbox" onchange="go()">
                                    <option value="UNMARRIED">UNMARRIED</OPTION>
                                    <option value="MARRIED">MARRIED</OPTION></select>
                            </td>
                        </tr>                                       
                        <tr>
                            <td><label id="anv1" style="display: none;">ANNIVERSARY DATE</label></td>
                            <td><input  id="anv" type="text" name="adate" class="textbox"  style="display: none;"/></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><input type="submit" value="SUBMIT" class="submitstyle"></td>
                        </tr>
                    </table>          
                </form>
                <%
                    } else {
                        response.sendRedirect("printbill.jsp");
                    }

                %>
                </center>

            </div>
            <%@include file="footer.jsp" %>
        </div>  
    </body>
</html>
