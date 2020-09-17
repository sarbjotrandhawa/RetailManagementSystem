
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
             <%@include file="index_3.html" %>
           <div id="main" style="margin-left: 0px" >
            <h1>Enter login Details</h1>
        <form action="employeelogin2.jsp" method="post">
            <table border="0" style="margin-top: 30px" cellspacing="5" >
                    <tr>
                        <td><b>Username</b></td>
                        <td><input type="text" name="username" placeholder="username" class="textbox" required/></td>
                    </tr>
                    <tr>
                        <td><b>Password</b></td>
                        <td><input type="password" name="password" placeholder="password" class="textbox" required/></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="submit" value="Login" class="submitstyle"/></td>
                    </tr>
                    <tr>
                        <td rowspan="2">
                       
                         <% String msg=request.getParameter("msg") ;
                        if(msg!=null)
                        {
                        %>
                        <%=msg%>
                        <%msg=null;
                        } 
                        
                        %>
                        </td>
                        
                    </tr>
                    <tr>
                        <td rowspan="2">
                       
                            <a href="userforgotpassword1.jsp" style="text-decoration: none"> Forgot password</a>
                        </td>
                        
                    </tr>
            </table>          
        </form>
        </div>
            <%@include file="footer.jsp" %>
        </div>  
           
        </center>
    </body>
</html>
