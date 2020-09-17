

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
     
    <body>
         <%
             String productid = request.getParameter("proid");
            String productname = request.getParameter("pronm");
            String barcode = request.getParameter("barcode");
            String price = request.getParameter("price");
            String discount = request.getParameter("discount");
            String netprice = request.getParameter("netprice");
            String category = request.getParameter("procat");
            String brand = request.getParameter("probrand");
            
            
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Driverloaded successfully");
            Connection com = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/pointofsale", "root", "12345");
            System.out.println("Connection build");
            Statement stmt = com.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            System.out.println("statement created");
            ResultSet rs = stmt.executeQuery("select * from products where product_id='"+productid+"'"); 
            if(rs.next())
            {
                rs.updateString("product_name",productname);
                rs.updateString("barcode", barcode);
                rs.updateFloat("price",Float.parseFloat(price));
                rs.updateFloat("discount", Float.parseFloat(discount));
                rs.updateFloat("netprice", Float.parseFloat(netprice));
                rs.updateString("category", category);
                rs.updateString("brands", brand);
                rs.updateRow();
                response.sendRedirect("viewproducts0.jsp?msgeditedDel=PRODUCT EDITED SUCCESSFULLY");
            }
         
        %> 
    </body>
</html>
