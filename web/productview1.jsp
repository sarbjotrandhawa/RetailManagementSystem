<%-- 
    Document   : productview1
    Created on : 18 May, 2014, 8:07:40 AM
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
     <script type="text/javascript">
            var xmlhttp;
            function change()
           
            {
               alert("hell0o")
               
                var user = document.getElementById("select").value;
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
                xmlhttp.onreadystatechange = change2;
                alert("hell02222222");
                xmlhttp.open("GET", "viewproducts2.jsp?name=" +user, true);
                 alert("h333333333");
                xmlhttp.send();
            }
            function change2()
            {
             
                if (xmlhttp.readyState === 4 && xmlhttp.status === 200)
                {
                    document.getElementById("a1").innerHTML = xmlhttp.responseText;
                    
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
        <%
     Class.forName("com.mysql.jdbc.Driver");
    System.out.println("Driverloaded successfully");
    Connection com = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/pointofsale", "root", "12345");
    System.out.println("Connection build");%>
    <center>
    <h class="heading">Select Category <h>
         
                <select name="category" id ="select" class="textsearch" onchange="change()">
                               <%
                                   Statement stmt1 = com.createStatement();
                                   System.out.println("statement created");
                                   ResultSet rs1 = stmt1.executeQuery("select * from categories");
                                   while (rs1.next()) {%>
                                   <option  value="<%=rs1.getString("category_name")%>"><%=rs1.getString("category_name")%></option> 
                <%}%> </select>
                   <%             String msgeditDel = request.getParameter("msgeditedDel");

                    if (msgeditDel != null) {
                %>
                <%=msgeditDel%>
                <%
                    }
                %>
                </center>
                     <div id="a1"></div>
                      </div>
            <%@include file="footer.jsp" %>
        </div> 
    </body>
</html>
