

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <title>products</title>
        <script type="text/javascript">
            function getdiscount()
            {
                var price = parseInt(document.getElementById("price").value);
                var discount = parseInt(document.getElementById("discount").value);
                 var netprice;
                if(price!==""&&discount!=="")
                {
                   netprice = price-price*(discount/100);      
                   document.getElementById("netprice").value = netprice;
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
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Driverloaded successfully");
            Connection com = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/pointofsale", "root", "12345");
            System.out.println("Connection build");
            Statement stmt = com.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            System.out.println("statement created");
            ResultSet rs = stmt.executeQuery("select * from categories");
        %>
        <center>
            <h3  class="heading">PRODUCT DETAIL</h3>
        <form action ="addproduct1.jsp" method="post">
            <table border="0"  style="margin-top: 30px" cellspacing="7" >
               
                <tr>
                    <td>PRODUCT_NAME</td>
                    <td><input type="text" name="pro_nm" class="textbox" required/></td>
                </tr>
                <tr>
                    <td>BARCODE</td>
                    <td><input type="text" name="barcode" class="textbox" required=""/></td>
                </tr>
                <tr>
                    <td>PRICE</td>
                    <td><input type="text" name="price" id="price" class="textbox" required=""/></td>
                </tr>
                <tr>
                    <td>DISCOUNT</td>
                    <td><input type="text" name="discount" id="discount" onblur="getdiscount()" class="textbox" required/></td>
                </tr>
                <tr>
                    <td>NET_PRICE</td>
                    <td><input type="text" name="netprice" id="netprice" value="" class="textbox"/></td>
                </tr>
                <tr>
                    <td>CATEGORY</td>
                    <td><select name="category" class="textbox" required="">
                            <%

            while (rs.next()) {%>
                            <option value="<%=rs.getString("category_name")%>"><%=rs.getString("category_name")%></option> 
                            <%}%> </select>
                </tr> 
                <%
                      Statement stmt1 = com.createStatement();
                       System.out.println("statement created");
                       ResultSet rs1 = stmt1.executeQuery("select * from brands");
                %>
                <tr>
                    <td>brands</td>
                    <td><select name="brands" class="textbox">
                            <%
                                while (rs1.next()) {%>
                            <option value="<%=rs1.getString("brand_name")%>"><%=rs1.getString("brand_name")%></option> 
                            <%}%> </select>
               
                <tr>
                    <td></td>
                    <td><input type="SUBMIT" value ="submit" class="submitstyle"/></td>
                </tr>

            </table>
        </form>
        </center>
                               </div>
            <%@include file="footer.jsp" %>
        </div> 
    </body>
</html>
