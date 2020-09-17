<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>view section</title>
    </head>
    <link href="all1.css" rel="stylesheet" type="text/css">
    <body>
        <div id="all">
            <%@include file="header.jsp" %>
            <%@include file="index_1.html" %>
            <div id="main">
                <%
                    String un = (String) session.getAttribute("un");

                %>
                <center>
                    <h1 style="font-size:70px; color: #674700">welcome   <%=un%></h1>
              


                <% 
                    String msginsertsection = request.getParameter("msg");
                    if (msginsertsection != null) {
                %>

                <%=msginsertsection%>
                <% }
                    String changepass = request.getParameter("msgchange");
                    if (changepass != null) {
                %>
                <%=changepass%>
                <% }
                %>
                  </center>
            </div>
            <%@include file="footer.jsp" %>
        </div>  

   

</body>
</html>
