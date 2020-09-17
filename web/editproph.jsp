

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
         
      <%
        String productname = request.getParameter("productnm");
        session.setAttribute("proname",productname );
        %>
        <center>
        <h3 class="heading">SELECT PHOTO</h3>
          <form action="editproph2.jsp" enctype="multipart/form-data" method="post">
              <input type="file" name="upload" value="Browse" class="submitstyle"/>  <br> <br>
              <input type="submit" name="submit" value="submit" class="submitstyle"/>
   </form>
            </div>
            <%@include file="footer.jsp" %>
        </div> 
    </center>
    </body>
</html>
