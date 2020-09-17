

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
                <h class="heading">EMPLOYEE DETAIL</h3>
                <form action="addemployee2.jsp" method="post">
                    <table border="0" style="margin-top: 10px" cellspacing="5" >
                        <tr>
                            <td>NAME</td>
                            <td><input type="text" name="mname" class="textbox" required/></td>
                        </tr>
                        <tr>
                            <td>PASSWARD</td>
                            <td><input type="password" name="pass" class="textbox" required/></td>
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
                            <td >GENDER</td>
                            <td><input type="radio" name="gender" value="male" required/> male</td>
                            <td><input type="radio" name="gender" value="female" required/>female</td>
                        </tr>
                        <tr>
                            <td>SECURIY QUESTIONS</td>
                            <td>
                                <select name="ques" class="textbox">
                                    <option value="your favourite game?">your favourite game?</OPTION>
                                    <option value="your birth place">your birth place?</OPTION>
                                    <option value="your favourite colour">your favourite colour?</OPTION>
                                    <option value="your hobby?">your hobby?</OPTION>
                                    <option value="your favourite food?">your favourite food?</OPTION></select>
                            </td>
                        </tr>
                        <tr>
                            <td>SECURITY ANS</td>
                            <td><input type="text" name="ans" class="textbox" required/></td>
                        </tr>
                        <tr>
                            <td>ADDRESS</td>
                            <td>  <textarea name="address" rows="6" cols="23" style=" border:2px solid lightgrey; border-radius: 5px;  box-shadow: 0 0 5px 3px #674700;"></textarea></td>
                    </tr>
                        <tr>
                            <td></td>
                            <td><input type="submit" value="SUBMIT" class="submitstyle"></td>
                        </tr>
                    </table>          
                </form>
                <center>
            </div>
            <%@include file="footer.jsp" %>
        </div> 

    </body>
</html>
