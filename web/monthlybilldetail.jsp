

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
                <h4 class="heading">MONTHLY BILL DETAIL</h4>
                <form action="monthlybilldetail2.jsp" method ="post">
                    <table  style="margin-top: 30px" cellspacing="7">
                        <tr>
                            <td>FROM</td>
                            <td><select name="from" class="textsearch">
                                    <option value="1">january</option> 
                                    <option value="2">febuary</option> 
                                    <option value="3">march</option> 
                                    <option value="4">aprail</option> 
                                    <option value="5">may</option> 
                                    <option value="6">june</option> 
                                    <option value="7">july</option> 
                                    <option value="8">august</option> 
                                    <option value="9">september</option> 
                                    <option value="10">october</option> 
                                    <option value="11">november</option> 
                                    <option value="12">december</option> 
                                </select>
                        </tr> 
                        <tr>
                            <td>TO</td>
                            <td><select name="to" class="textsearch">
                                    <option value="1">january</option> 
                                    <option value="2">febuary</option> 
                                    <option value="3">march</option> 
                                    <option value="4">aprail</option> 
                                    <option value="5">may</option> 
                                    <option value="6">june</option> 
                                    <option value="7">july</option> 
                                    <option value="8">august</option> 
                                    <option value="9">september</option> 
                                    <option value="10">october</option> 
                                    <option value="11">november</option> 
                                    <option value="12">december</option> 
                                </select>
                        </tr> 
                        <tr>
                            <td></td>
                            <td><input type="submit" value="go" class="submitstyle"/></td>
                        </tr>
                    </table>
                </form>
                </center>
            </div>
            <%@include file="footer.jsp" %>
        </div> 
    </body>
</html>
