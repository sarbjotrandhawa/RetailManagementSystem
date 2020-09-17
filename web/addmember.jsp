
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
            if(select === "MARRIED")
            {
                document.getElementById("anv").style.display="block"
                document.getElementById("anv1").style.display="block"
            }
            else
            {
                document.getElementById("anv").style.display="none"
                document.getElementById("anv1").style.display="none"
            }
        }
</script>
    <link href="all1.css" rel="stylesheet" type="text/css">
    <body>
       
        <div id="all">
            <%@include file="header.jsp" %>
            <%@include file="index_1.html" %>
            <div id="main" >
                <center>
                 <h class="heading">MEMBER DETAIL</h>
                <form action="addmember2.jsp" method="post">
                    <table border="0"  style="margin-top: 30px" cellspacing="8" >
                        <tr>
                            <td>NAME</td>
                            <td><input type="text" name="mname" class="textbox" required/></td>
                        </tr>
                        <tr>
                            <td>EMAIL ID</td>
                            <td><input type="text" name="email" class="textbox" required/></td>
                        </tr>
                        <tr>
                            <td>MOBILE NUMBER</td>
                            <td><input type="text" name="mno" class="textbox" required/></td>
                        </tr>
                        <tr>
                            <td>DATE OF BIRTH</td>
                            <td><input type="text" name="bdate" class="textbox"/></td>
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
                            <td><input  id="anv" type="text" name="adate" style="display: none;" class="textbox"/></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><input type="submit" value="SUBMIT" class="submitstyle"></td>
                        </tr>
                    </table>          
                </form>
                </center>
            </div>
            <%@include file="footer.jsp" %>
        </div> 
    </body>
</html>
