<%@page import="vmm.BillDetails"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%
    String barcode = request.getParameter("bar");
    int qty = Integer.parseInt(request.getParameter("qty"));
    int tqty = 0, badqty = 0, soldqty = 0;
    int sid = 0,remain=0;
    
    ArrayList<BillDetails> al = (ArrayList<BillDetails>) session.getAttribute("al");
    Class.forName("com.mysql.jdbc.Driver");
    Connection com = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/pointofsale", "root", "12345");
    System.out.println("Connection build");

    
        Statement stmt1 = com.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
        System.out.println("statement created");
        ResultSet rs1 = stmt1.executeQuery("select * from  products where barcode='" + barcode + "'");
        if (rs1.next()) {
            Statement stmt2 = com.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            System.out.println("statement created");
            ResultSet rs2 = stmt2.executeQuery("select * from  addstock where product_id='" + rs1.getString("product_id") + "'");
            if (rs2.next()) {
                tqty = rs2.getInt("quantity");
                sid = rs2.getInt("stock_id");
            }
            Statement stmt3 = com.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            System.out.println("statement created");
            ResultSet rs3 = stmt3.executeQuery("select * from  badstock where stock_id='" + sid + "'");
            if (rs3.next()) {
                badqty = rs3.getInt("quantity");
            }
            Statement stmt4 = com.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            System.out.println("statement created");
            ResultSet rs4 = stmt4.executeQuery("select sum(quantity) as quantity from billdetail where barcode ='" + barcode + "'");
            if (rs4.next()) {
                soldqty = rs4.getInt("quantity");
            }
            System.out.println(tqty + "       " + badqty + "      " + soldqty);
            
            remain = tqty - badqty - soldqty;
            for(int i = 0 ; i<al.size();i++)
            {
                System.out.println(al.get(i).barcode);
                if(barcode.equals(al.get(i).barcode))
                {
                    remain = remain - al.get(i).qty;
                }
            }
            System.out.println("final remain" + remain);

        }
   
    if (remain > qty) {
    
        Statement stmt = com.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
        System.out.println("statement created");
        ResultSet rs = stmt.executeQuery("select * from  products where barcode='" + barcode + "'");
        if (rs.next()) {
            String pn = rs.getString("product_name");
            double price = Double.parseDouble(rs.getString("netprice"));
            double tprice = qty * price;
          al.add(new BillDetails(barcode, pn, qty, price, tprice));
            session.setAttribute("al", al);
    }  
        }
    else
    {
        %>
        Item cannot be added

<%
    }
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