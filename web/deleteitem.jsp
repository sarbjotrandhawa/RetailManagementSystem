<%-- 
    Document   : deleteitem
    Created on : 19 May, 2014, 4:37:51 PM
    Author     : Hp
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="vmm.BillDetails"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            ArrayList<BillDetails> al = (ArrayList<BillDetails>) session.getAttribute("al");
            int index = Integer.parseInt(request.getParameter("index"));
            al.remove(index);
        %>
        <center>
<table border class="CSSTableGenerator" >
    <tr>
        <td>SR.NO</td>
        <td>PRODUCT NAME</td>
        <td>QUANTITY</td>
        <td>PRICE</td>
        <td>TOTAL PRICE</td>
        <td>DELETE</td>
    </tr>
    <%
        for (int i = 0; i < al.size(); i++) {%>
    <tr>
        <td><%=i + 1%></td>
        <td><%=al.get(i).productname%></td>
        <td><%=al.get(i).qty%></td>
        <td><%=al.get(i).price%></td>
        <td><%=al.get(i).tprice%></td>
        <td><input type="button" value="Delete" onclick="delete1('<%=i%>')"></td>
    </tr>
    <%}%>
</table>
</center>    
        
<%    double p = 0;
    for (int i = 0; i < al.size(); i++) {
        p = p + al.get(i).tprice;
    }
%>
                        <h3>grand total     <%=p%>     </h3>
                        <center>
<form action="generatebill2.jsp?grandtotal=<%=p%>" method="post">
    <input type="submit" value="print" class="submitstyle"/>
</form>
    
    </center>
        
        
        
    </body>
</html>
