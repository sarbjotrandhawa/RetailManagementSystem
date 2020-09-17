

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <title>ADD BRANDS</title>
    </head>
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
            <div id="main" style="overflow-x: scroll" >
                <center>
                <h3 class="heading"> BRAND DETAIL</h3>
              
                <form action="addbrands2.jsp" method ="post">
                    <table border ="0"  style="margin-top: 30px" cellspacing="7">
                        <tr>
                            <td>BRAND NAME</td>
                            <td><input type="text" name="brandname" placeholder="brand name" class="textbox" required/></td>
                        </tr>
                        <tr>
                            <td>BRAND DESCRIPTION</td>
                            <td><input type="text" name="description" class="textbox" /></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><input type="submit" value="save" class="submitstyle"/></td>
                        </tr>

                    </table>
                </form>
                <% String msgbexist = request.getParameter("msg");
                    if (msgbexist != null) {%>
                <%=msgbexist%>
                <% }%>
                </center>

            </div>
            <%@include file="footer.jsp" %>
        </div> 

    </body>
</html>
