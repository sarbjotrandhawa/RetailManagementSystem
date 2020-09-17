

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
  
        <title>ADD PRODUCTS</title>
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
        
            String productname = request.getParameter("pro_nm");
            String barcode = request.getParameter("barcode");
            String price = request.getParameter("price");
            System.out.println(price);
            String discount = request.getParameter("discount");
            String netprice = request.getParameter("netprice");
            String category = request.getParameter("category");
            String brand = request.getParameter("brands");
            float price1 = Float.parseFloat(price);
            System.out.println(price1);
            
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Driverloaded successfully");
            Connection com = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/pointofsale", "root", "12345");
            System.out.println("Connection build");
            Statement stmt = com.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            System.out.println("statement created");
            ResultSet rs = stmt.executeQuery("select * from products");  
               rs.moveToInsertRow();
               session.setAttribute("productname",productname);
                rs.updateString("product_name",productname);
                rs.updateString("barcode", barcode);
                rs.updateFloat("price",price1);
                rs.updateFloat("discount", Float.parseFloat(discount));
                rs.updateFloat("netprice", Float.parseFloat(netprice));
                rs.updateString("category", category);
                rs.updateString("brands", brand);
                rs.insertRow();
             %>
             <center>
           <h3 class = "heading">SELECT PRODUCT PHOTO</h3>
    <form action="addproducts2.jsp" enctype="multipart/form-data" method="post">
    <input type="file" name="upload" value="Browse" class="submitstyle"/>
      <br>
      <br>
    <input type="submit" name="submit" value="submit" class="submitstyle"/>
   </form>
             </center>
        </div>
            <%@include file="footer.jsp" %>
        </div>  
    </body>
</html>
