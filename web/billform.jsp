

<%@page import="java.util.ArrayList"%>
<%@page import="vmm.BillDetails"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript">
            var xmlhttp;
            function go1()
           
            {
               
                var barcode = document.getElementById("barcode").value;
                var qty = document.getElementById("quantity").value;
                try
                {
                    xmlhttp = new ActiveXObject("Msxml2.XMLHTTP")  // For Old Microsoft Browsers
                }
                catch (e)
                {
                    try
                    {
                        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP")  // For Microsoft IE 6.0+
                    }
                    catch (e2)
                    {
                        xmlhttp = new XMLHttpRequest();        //For Mozilla, Opera Browsers
                    }
                }
                xmlhttp.onreadystatechange = go2;
              
                xmlhttp.open("GET", "GenerateBill.jsp?bar=" + barcode + "&qty=" + qty, true);
                xmlhttp.send();
            }
            function go2()
            {

                if (xmlhttp.readyState === 4 && xmlhttp.status === 200)
                {
                    document.getElementById("a1").innerHTML = xmlhttp.responseText;
                    
                }
            }
            function delete1(index)
           
            {
               
                try
                {
                    xmlhttp = new ActiveXObject("Msxml2.XMLHTTP")  // For Old Microsoft Browsers
                }
                catch (e)
                {
                    try
                    {
                        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP")  // For Microsoft IE 6.0+
                    }
                    catch (e2)
                    {
                        xmlhttp = new XMLHttpRequest();        //For Mozilla, Opera Browsers
                    }
                }
                xmlhttp.onreadystatechange = delete2;
              
                xmlhttp.open("GET", "deleteitem.jsp?index="+index, true);
                xmlhttp.send();
            }
            function delete2()
            {

                if (xmlhttp.readyState === 4 && xmlhttp.status === 200)
                {
                    document.getElementById("a1").innerHTML = xmlhttp.responseText;
                    
                }
            }
        </script>
        <link href="all1.css" rel="stylesheet" type="text/css">
    </head>
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
            ArrayList<BillDetails> al = new ArrayList<BillDetails>();
            session.setAttribute("al", al);
        %>
        <center>
        <table  style="margin-top: 10px" cellspacing="5">
            <tr>
                <td>BARCODE</td>
                <td><input type="text" name="barcode" id="barcode" placeholder="scan barcode" class="textbox" required/></td>
            </tr>
            <tr>
                <td>QUANTITY</td>
                <td><input type="text" name="quantity" id="quantity" placeholder="enter quantity" class="textbox" required/></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="button" value="GO" onclick="go1()" class="submitstyle" /></td>
            </tr>
        </table>
            
        <div id="a1"></div>
        </center>
    </div>
            <%@include file="footer.jsp" %>
        </div> 
    </body>
</html>
