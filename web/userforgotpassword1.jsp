

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title></title>
        <link href="all1.css" rel="stylesheet" type="text/css">
     </head>
      
    <body>
    <center>
             <div id="all">
         <%@include file="header.jsp" %>
         
            <div id="main" style="margin-left: 0px" >
        <form action="userforgotpassword2.jsp" method="post">
            <h class="heading"> Enter your detail </h>
            <center>
            <table border="0"  style="margin-top: 30px" cellspacing="7">
                    <tr>
                        <td>Enter username</td>
                        <td><input type="text" name="username" class="textbox" required/></td>
                    </tr>
                       <tr>
                        <td>Enter dateofbirth</td>
                        <td><input type="date" name="username" class="textbox" required/></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="submit" class="submitstyle"/></td>
                    </tr>
                    
            </table>
            </center>
        </form>
                <%
                String s = request.getParameter("q");
                if(s!=null)
                {
                    %>
                    <%=s%>
                <%
                }
                %>
              </div>
            <%@include file="footer.jsp" %>
        </div> 
    </center>
        
    </body>
</html>
