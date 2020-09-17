<%-- 
    Document   : viewproducts2
    Created on : 18 May, 2014, 8:14:58 AM
    Author     : Hp
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    
           <script>
               aleart(2222222);
            function go()
            {
                return confirm("ARE YOU SURE TO DELETE?");
            }
            </script>
    <body>
          <%
                         String category = request.getParameter("name"); 
                        Class.forName("com.mysql.jdbc.Driver");
                        System.out.println("Driverloaded successfully");
                        Connection com = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/pointofsale", "root", "12345");
                        System.out.println("Connection build");
                        Statement stmt = com.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                        System.out.println("statement created");
                        ResultSet rs = stmt.executeQuery("select * from products where category_name='"+ category + "'" );
                        while (rs.next()) {
                    %> 
        
                   <table border  class="CSSTableGenerator" cellspacing="5px;" cellpadding="5px;">
                    <tr>
                        <td>PRODUCT_ID</td>
                        <td>PRODUCT_NAME</td>
                        <td>BARCODE</td>
                        <td>PRICE</td>
                        <td>DISCOUNT</td>
                        <td>NETPRICE</td>
                        <td>CATEGORY</td>
                        <td>BRAND</td>
                        <td>PHOTO</td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                  
                    <tr>
                        <td><%=rs.getString("product_id")%></td>  
                        <td><%=rs.getString("product_name")%></td>
                        <td><%=rs.getString("barcode")%></td>
                        <td><%=rs.getString("price")%></td>  
                        <td><%=rs.getString("discount")%></td>
                        <td><%=rs.getString("netprice")%></td>
                        <td><%=rs.getString("category")%></td>
                        <td><%=rs.getString("brands")%></td>
                        <td><img src = "<%=rs.getString("photo")%>" width="50" height="50"/></td>
                        <td><a href="editproduct1.jsp?proid=<%=rs.getString("product_id")%>">Edit</a></td>
                        <td><a href="deleteproduct1.jsp?delproid=<%=rs.getString("product_id")%>" onclick="return go()">delete</a></td>
                        <td><a href="editproph.jsp?productnm=<%=rs.getString("product_name")%>">Edit photo</a></td>
                    </tr>
                    <%
                        }

                    %>
                </table>
                </div>
                
             
               </center> 
            </div>

    </center>
    </body>
</html>
