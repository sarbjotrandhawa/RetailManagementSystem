
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
        <script type="text/javascript">
            var xmlhttp;
            function go1()
           
            {
               var mob = document.getElementById("mob");
               var nm = document.getElementById("nam");
               var mid = document.getElementById("memberid");
               var radio;
               if(mob.checked)
               {
                   radio = "mobile";
               }
               else if(nm.checked)
               {
                   radio = "name";
               }
               else if(mid.checked)
               {
                   radio = "member";
               }
                var searched = document.getElementById("search").value;
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
                xmlhttp.onreadystatechange = go2;
              
                xmlhttp.open("GET", "viewmember2.jsp?radio=" + radio + "&search=" + searched, true);
                xmlhttp.send();
            }
               function go2()
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
                <center> 
        <table border="0"  style="margin-top: 30px" cellspacing="7" >
            <tr>
                <td>SEARCH</td>
                <td><input type="text" name="search" id="search" placeholder="select and type" class="textsearch"/></td>
                <td><input type="button" value="GO" onclick="go1()" class="submitstyle" /></td>
            </tr><td><td> <input type="radio" name="radiobt" value="mobile" id="mob"/> mobile</td></td></td></tr>
        <tr><td><td><input type="radio" name="radiobt" value="name" id="nam"/>name</td></tr>
        <tr> <td><td><input type="radio" name="radiobt" value="memberid" id="memberid"/>memberid</td></td></tr>
            
               
        </table>
                </center>
        <div id="a1"></div>
         </div>
            <%@include file="footer.jsp" %>
        </div> 
    </body>
</html>
