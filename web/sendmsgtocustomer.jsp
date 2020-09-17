

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

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
            <div id="main" >
                <center>
                    <h2 class="heading">SEND MESSAGE TO CUSTOMER</h2>
           <form action="sendmessagetocustomers2.jsp" method="post">
               <textarea rows="10" cols="30 " name="message" style=" border:2px solid lightgrey; border-radius: 5px;  box-shadow: 0 0 5px 3px #674700;   "></textarea>
            <input type="submit" value="send" class="submitstyle">
        </form>
        <%
            String msg = request.getParameter("msg");
            if(msg!=null)
            {
                %>
                <label style="color: red; font-size: 20px; font-style: italic;"><%=msg%></label>
                <%
            }
            %>
                </center>
              </div>
            <%@include file="footer.jsp" %>
        </div>
    </body>
</html>
