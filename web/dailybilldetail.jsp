

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <link href="all1.css" rel="stylesheet" type="text/css">
    <body>
        <div id="all">
            <%@include file="header.jsp" %>
            <%@include file="index_1.html" %>
            <div id="main" >
                <center>
                <h class="heading">DAILY BILL DETAIL</h>
                <form action="dailybilldetail2.jsp" method ="post">
                    <table  style="margin-top: 40px" cellspacing="8">
                        <td>FROM</td>
                        <td><input type="date" name ="fromdate" class="textsearch"/></td>
                        </tr>
                        <td>TO</td>
                        <td><input type="date" name ="todate" class ="textsearch" /></td>
                        </tr>
                        <td></td>
                        <td><input type="submit" value ="submit" class="submitstyle"/></td>
                        </tr>
                    </table>
                </form>
                </center>
            </div>
            <%@include file="footer.jsp" %>
        </div> 
    </body>
</html>
