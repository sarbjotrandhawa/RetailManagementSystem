

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
       
        <title>change password 1</title>
    </head>
    <link href="all1.css" rel="stylesheet" type="text/css">
    <script>
        function go()
        {
            var newpass = document.getElementById("newpass").value;
            var confirmpass = document.getElementById("confirmpass").value;
            if(newpass == confirmpass)
            {
                return true;
            }
            else
            {
                alert("New Password and confirm password donot match");
                return false;
            }
        }
    </script>
    <body>
          <center>
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
                   <h1 class="heading">CHOOSE NEW PASSWORD</h1>
        <%
        String username = (String)session.getAttribute("un");
        %>
        <form action="changepassward2.jsp" method="post" onsubmit="return go()">
        <table border="0" style="margin-top: 30px" cellspacing="7">
            <tr>
                <td>USERNAME</td>
                <td><input type="text" name="username" value ="<%=username%>" class="textbox"/></td>
            </tr>  
            <tr>
                <td>OLD PASSWORD</td>
                <td><input type="Text" name="oldpassword" required class="textbox"/></td>
            </tr>
            <tr>
                <td>NEW PASSWORD</td>
                <td><input type="Text" name="newpassword" required id="newpass" class="textbox"/></td>
            </tr>
            <tr>
                <td>CONFIRM PASSWORD</td>
                <td><input type="Text" name="confirmpassword" required id="confirmpass" class="textbox"/></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="SAVE" class="submitstyle"></td>
            </tr>
        </table>
        </form>
                    <%
                    String s1 = request.getParameter("q");
                    
                    
                    if(s1!=null)
                    {
                        %>
                           <%=s1%>
                           <%
                    }
                    %>
               </center>
                      </div>
            <%@include file="footer.jsp" %>
        </div>  
           
        </center>
                
    </body>
</html>
