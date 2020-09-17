<%-- 
    Document   : viewproducts0
    Created on : 21 May, 2014, 12:50:51 PM
    Author     : Hp
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
                
        <script type="text/javascript">
            function go()
            {
                return confirm("ARE YOU SURE TO DELETE?");
            }
            function getProducts()
           
            {
               var cat = document.getElementById("sel").value;
                try
                {
                    xmlhttp = new ActiveXObject("Msxml2.XMLHTTP")  // For Old Microsoft Browsers
                }
                catch (e)
                {
                    try
                    {
                        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP")  // For Microsoft IE 6.0+
                    }
                    catch (e2)
                    {
                        xmlhttp = new XMLHttpRequest();        //For Mozilla, Opera Browsers
                    }
                }
                xmlhttp.onreadystatechange = getProducts2;
              
                xmlhttp.open("GET", "viewproducts.jsp?cat="+cat, true);
                xmlhttp.send();
            }
            function getProducts2()
            {

                if (xmlhttp.readyState === 4 && xmlhttp.status === 200)
                {
                    document.getElementById("a1").innerHTML = xmlhttp.responseText;
                    
                }
            }
        </script>
        <link href="all1.css" rel="stylesheet" type="text/css"/>

    </head>
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
            <div id="main">
                            <center>
                                <h class="heading">View Products</h><br><br>
                                <table border="0" style="margin-top: 50"> 
                                    <tr>
                                        <td><b>Search<b></td>
                                    <td>    <select id="sel" class="textsearch">
            <%
                Class.forName("com.mysql.jdbc.Driver");
                System.out.println("Driverloaded successfully");
                Connection com = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/pointofsale", "root", "12345");
                System.out.println("Connection build");
                Statement stmt = com.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                System.out.println("statement created");
                ResultSet rs = stmt.executeQuery("select * from categories");
                while (rs.next()) {
            %> 
                <option value="<%=rs.getString("category_name")%>"><%=rs.getString("category_name")%></option>
            <%}%>
        </select>
                                    </td>
                                    <td>  <input type="button" value="View" onclick="getProducts()" class="submitstyle"></td>
        </tr>
                                </table>
            </center>
        
        <div id="a1">
            
        </div>
            </div>
           <%@include file="footer.jsp" %>
        </div> 
    </body>
</html>
