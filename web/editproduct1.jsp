

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <script type="text/javascript">
        function getdiscount()
        {
            var price = parseInt(document.getElementById("price").value);
            var discount = parseInt(document.getElementById("discount").value);
            var netprice;
            if (price !== "" && discount !== "")
            {
                netprice = price - price * (discount / 100);
                document.getElementById("netprice").value = netprice;
            }
        }
    </script>
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
            String productid = request.getParameter("proid");
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Driverloaded successfully");
            Connection com = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/pointofsale", "root", "12345");
            System.out.println("Connection build");
            Statement stmt = com.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            System.out.println("statement created");
            ResultSet rs = stmt.executeQuery("select * from products where product_id='"+productid + "'");
            if (rs.next()) {
        %>
        <center>
             <h class="heading">EDIT FORM</h>
        <form action="editproduct2.jsp" method="post">
            <table border ="0" style="margin-top: 30px" cellspacing="7" >
               
                <tr>
                    <td>PRODUCT ID</td>
                    <td><input type="text" name="proid" value= "<%=rs.getString("product_id")%>" class="textbox"/></td>
                </tr>
                <tr>
                    <td>PRODUCT NAME</td>
                    <td><input type="text" name="pronm" value="<%=rs.getString("product_name")%>" class="textbox"/></td>
                </tr>
                <tr>
                <tr>
                    <td>BARCODE</td>
                    <td><input type="text" name="barcode" value= "<%=rs.getString("barcode")%>" class="textbox"/></td>
                </tr>
                <tr>
                    <td>PRICE</td>
                    <td><input type="text" name="price" id="price" value="<%=rs.getString("price")%>" class="textbox"/></td>
                </tr>
                <tr>
                    <td>DISCOUNT</td>
                    <td><input type="text" name="discount"  id="discount" onblur="getdiscount()" value="<%=rs.getString("discount")%>" class="textbox"/></td>
                </tr>
                <tr>
                    <td>NET PRICE</td>
                    <td><input type="text" name="netprice" id="netprice" value="<%=rs.getString("netprice")%>" class="textbox"/></td>
                </tr>
                               <tr>

                               <td>CATEGORY</td>
                               <td><select name="procat" class="textbox">
                               <%
                                   Statement stmt1 = com.createStatement();
                                   System.out.println("statement created");
                                   ResultSet rs1 = stmt1.executeQuery("select * from categories");
                                   while (rs1.next()) {%>
                <option value="<%=rs1.getString("category_name")%>"><%=rs1.getString("category_name")%></option> 
                <%}%> </select></td>
            </tr>
                <tr>
                    <td>BRAND</td>
                    <td><select name="probrand" class="textbox">
                            <%
                                Statement stmt2 = com.createStatement();
                                System.out.println("statement created");
                                ResultSet rs2 = stmt2.executeQuery("select * from brands");
                                while (rs2.next()) {%>
                            <option value="<%=rs2.getString("brand_name")%>"><%=rs2.getString("brand_name")%></option> 
                            <%}%> </select></td>
                </tr> 
                 <tr>
                    <td>LOGO</td>
                    <td><img src = "<%=rs.getString("photo")%>" width="50" height="50"/></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="save" class="submitstyle"/></td>
                </tr>
            </table>
        </form>
        </center>
        <%}%>
           </div>
            <%@include file="footer.jsp" %>
        </div> 
    </body>
</html>
